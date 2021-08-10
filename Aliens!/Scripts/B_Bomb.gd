extends Area2D

var speed = 50

func _ready():
	add_to_group("b")

func _physics_process(delta):
	position += transform.x * speed * delta 

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
