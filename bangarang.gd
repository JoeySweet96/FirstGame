extends RigidBody2D

var velocity = Vector2.ZERO

# Set initial velocity
func init(velocity):
	self.velocity = velocity

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set linear velocity
	linear_velocity = velocity
	connect("body_entered", _on_body_entered)

func _integrate_forces(state):
	# Apply boomerang arc
	var angular_velocity = 200.0
	var radial_force = Vector2(-linear_velocity.y, linear_velocity.x).normalized() * angular_velocity
	linear_velocity += radial_force * state.step

func explode():
	print("explosion")

func _on_body_entered(body):
	# Handles collision with other objects
	if body.is_in_group("Floor"):
		queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
