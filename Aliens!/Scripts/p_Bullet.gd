extends Area2D

func ready():
	add_to_group("P")

func _on_p_Bullet_body_entered(body):
	if body.is_in_group("ene"):
		body.queue_free()
		self.queue_free()
