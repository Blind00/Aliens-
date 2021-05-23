extends RigidBody2D


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_p_Bullet_body_entered(body):
	if "Enemy-2B" in body.name:
		queue_free()
