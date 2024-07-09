extends Node2D

var bangarang_scene = preload("res://bangarang.tscn")
var shoot_speed = 500


func _ready():
	$Area2D.connect("input_event", _on_Area2D_input_event)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		shoot_bangarang(event.position)

func shoot_bangarang(target_pos):
	var bangarang = bangarang_scene.instantiate()
	bangarang.position = $Player.position
	var direction = (target_pos - $Player.position).normalized()
	var velocity = direction * shoot_speed
	bangarang.init(velocity)
	add_child(bangarang)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
