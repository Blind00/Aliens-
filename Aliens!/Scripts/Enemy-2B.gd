extends KinematicBody2D

const Speed = 50

export var friction = 0.1
export var acceleration = 0.01

onready var player = get_parent().get_node("Player")

var velocity = Vector2.ZERO
var direction = velocity

func _ready():
	add_to_group("ene")
	player = get_parent().get_node("Player")

func _physics_process(_delta):
	if player == null:
		player = get_tree().get_nodes_in_group("Player")[0]
		print("Player Finding")
		return
	look_at(player.position)
	position += transform.x * Speed  * _delta

func set_player(p):
	player=p

func _on_Enemy2B_body_entered(body):
	if body.is_in_group("P"):
		queue_free()
