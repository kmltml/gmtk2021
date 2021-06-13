extends RigidBody2D

var attached_things = []

# Called when the node enters the scene tree for the first time.
func _ready():
    connect("body_entered", self, "on_body_entered")

func on_body_entered(body):
    if body.is_in_group("sticky"):
        disconnect("body_entered", self, "on_body_entered")
        add_to_group("sticky")
        join_together_with(body)

func join_together_with(body):
    var joint = PinJoint2D.new()
    add_child(joint)
    joint.node_a = self.get_path()
    joint.node_b = body.get_path()
    collision_layer = body.collision_layer
    collision_mask = body.collision_mask
    if body.has_method("attach_powerup"):
        body.attach_powerup(self)

    if body.is_in_group("player"):
        add_to_group("player")
    elif body.is_in_group("monster"):
        add_to_group("monster")

    var sparkle = get_node_or_null("Sparkle")
    if sparkle != null:
        sparkle.queue_free()

    after_joined(body)

func after_joined(_body):
    pass


func on_bullet_hit(bullet):
    powerup_die()

func powerup_die():
    for thing in attached_things:
        if is_instance_valid(thing):
            thing.powerup_die()
    queue_free()

func attach_powerup(powerup):
    attached_things.append(powerup)

func on_contact_damage(_enemy):
    powerup_die()
