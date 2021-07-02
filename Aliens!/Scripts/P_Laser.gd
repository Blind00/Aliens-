extends Area2D

var speed = 750

func ready():
	add_to_group("P")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Area2D_body_entered(body):
	if body.is_in_group("ene"):
		body.queue_free()
	queue_free()
