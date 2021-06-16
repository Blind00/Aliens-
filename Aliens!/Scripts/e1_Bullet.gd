extends Node2D


var speed = 10
var look_vec =  Vector2.ZERO
var move =  Vector2.ZERO
var player = null

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _ready():
	add_to_group("ene")
	pass



func _physics_process(delta):
	
	position += transform.x * speed
	#move = move.move_toward(look_vec, delta)
	#move = move.normalized()
	#position += move 
	#move = move * speed

func _on_p_Bullet_body_entered(body):
	if body.is_in_group("player"):
		body.queue_free()
	

