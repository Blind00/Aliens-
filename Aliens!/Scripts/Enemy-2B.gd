extends KinematicBody2D

var Speed = 100

onready var player = get_parent().get_node("Player")

var velocity = Vector2.ZERO
var direction = velocity

func _ready():
	add_to_group("ene")
	player = get_parent().get_node("Player")

func _physics_process(_delta):
	if player == null:
		return
		player = get_tree().get_nodes_in_group("Player")[0]
		print("Player Finding")
	look_at(player.position)
	position += transform.x * Speed  * _delta

func _on_Enemy2B_body_entered(body):
	if body.is_in_group("P"):
		queue_free()

func _on_Speed_timeout():
	Speed += 100
	print('Start Speed')
