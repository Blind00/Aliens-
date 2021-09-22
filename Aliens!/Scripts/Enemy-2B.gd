extends KinematicBody2D


onready var player = get_parent().get_node("Player")

var velocity = Vector2.ZERO
var direction = velocity
var Speed = 100
var max_health = 3

func _ready():
	add_to_group("ene")
	player = get_parent().get_node("Player")

func _physics_process(_delta):
	if player == null:
		return
		player = get_tree().get_nodes_in_group("Player")[0]
	look_at(player.position)
	position += transform.x * Speed  * _delta

func _on_Enemy2B_body_entered(body):
	if body.is_in_group("P"):
		max_health -= 1
		checkdeath()

func _on_Speed_timeout():
	Speed += 100

func checkdeath():
	if max_health > 1:
		queue_free()
