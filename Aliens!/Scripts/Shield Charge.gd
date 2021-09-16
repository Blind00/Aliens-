extends Area2D

signal Charge

func _ready():
	add_to_group("C")

func _on_Area2D2_body_entered(body):
	if body.is_in_group("P"):
		emit_signal("Charge")
		queue_free()
