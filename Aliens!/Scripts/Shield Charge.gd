extends Area2D

func _ready():
	add_to_group("C")

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Area2D2_body_entered(body):
	if body.is_in_group("P"):
		queue_free()
