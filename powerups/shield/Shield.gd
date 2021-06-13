extends RigidBody2D

var is_attached = false

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

    if body.is_in_group("player"):
        add_to_group("player")
        $ShieldArea.set_collision_layer_bit(1, false)
