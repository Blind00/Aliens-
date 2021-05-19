extends Node2D

var ene = load("res://Scene/Enemy-2B.tscn")
onready var start = $Timer.set_paused("false")
func _ready():
	$Timer.set_wait_time("60")
	$Timer.set_autostart("true")
	if not $Timer.is_paused():
		add_child(ene)

