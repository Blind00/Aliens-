extends KinematicBody2D

const Speed = 50
export var friction = 0.1
export var acceleration = 0.01
var alive = true
#onready var revivetime = $Timer

onready var collision = $RayCast2D
var player = null
var velocity = Vector2.ZERO
var direction = velocity
var fd = 50
func _ready():
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
		

func set_player(p):
	player=p


func _on_Enemy2B_body_entered(body):
	if "p_Bullet"  in body.name:
		queue_free()

