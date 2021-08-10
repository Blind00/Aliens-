extends Area2D

func ready():
	add_to_group("P")
	$LifeTime.start()

func _on_p_Bullet_body_entered(body):
	if body.is_in_group("b"):
		body.queue_free()

func _on_LifeTime_timeout():
	queue_free()
