extends KinematicBody2D

const Speed = 5

onready var player = get_parent().get_node("Player")
onready var e1 = preload("res://Scenes/Enemy-1B.tscn")
onready var e2 = preload("res://Scenes/Enemy-2B.tscn")

export var bspeed = 500
export var friction = 0.1
export var acceleration = 0.01

var bullet_scene = load("")
var velocity = Vector2.ZERO
var direction = velocity


func _ready():
	pass
	add_to_group("ene")

func _physics_process(_delta):
	if player == null:
		return 
		velocity = position.direction_to(player.position) * Speed
		velocity = move_and_slide(velocity)
		if direction.length() > 0:
			velocity = lerp(velocity, direction.normalized() * Speed, acceleration)
		else:
			velocity = lerp(velocity, Vector2.ZERO, friction)
		velocity = move_and_slide(velocity)
		look_at(player.position)


