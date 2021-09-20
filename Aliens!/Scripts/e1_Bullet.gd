extends KinematicBody2D

var speed = 1100

func _ready():
	add_to_group("b")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _physics_process(delta):
	position += transform.x * speed * delta 

func _on_e1_Bullet_body_entered(body):
	if body.is_in_group("P"):
		queue_free()
