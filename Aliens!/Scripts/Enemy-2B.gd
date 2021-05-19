extends KinematicBody2D

const Speed = 200

onready var collision = $CollisionShape2D
var player = null
var velocity = Vector2.ZERO

func _ready():
	add_to_group("ene")
	
func _physics_process(delta):
	if player == null:
		return 
	velocity = position.direction_to(player.position) * Speed 
	velocity = move_and_slide(velocity)

	if collision.is_colliding():
		var coll = collision.get_collider()
		if coll.name == "Player":
			coll.kill()

func kill():
	queue_free()
	
func set_player(p):
	player=p
