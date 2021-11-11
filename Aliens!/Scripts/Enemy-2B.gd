extends KinematicBody2D


onready var player = get_parent().get_node("Player")

var velocity = Vector2.ZERO
var direction = velocity
var Speed = 150
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
	if "P_Laser" in body.name:
		max_health -= 1
		checkdeath()
		body.queue_free()

func _on_Speed_timeout():
	Speed += 100
	$SpeedBoost.play()

func checkdeath():
	if max_health < 1:
		$DeathSound.play()
