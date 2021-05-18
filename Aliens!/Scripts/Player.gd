extends KinematicBody2D

func _ready():
	pass 
	add_to_group("player")
	yield(get_tree(),"idle_frame")
	get_tree().call_group("ene","set_player",self)

export var speed = 200
export var friction = 0.01
export var acceleration = 0.01
onready var Bullet = ("res://p_Bullet.tscn")

var velocity = Vector2()

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('Right'):
		input.x += 1
	if Input.is_action_pressed('Left'):
		input.x -= 1
	if Input.is_action_pressed('Down'):
		input.y += 1
	if Input.is_action_pressed('Up'):
		input.y -= 1
	return input

# warning-ignore:unused_argument
func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)
	look_at(get_global_mouse_position())
	get_input()

func kill():
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()

