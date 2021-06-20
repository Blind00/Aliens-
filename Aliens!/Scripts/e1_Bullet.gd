extends Area2D

var speed = 10
var move =  Vector2.ZERO

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _ready():
	add_to_group("ene")
	pass

func _physics_process(delta):
	position += transform.x * speed

func _on_e1_Bullet_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
