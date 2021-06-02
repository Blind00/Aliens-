extends Node2D

var ene1 = preload("res://Scenes/Enemy-2B.tscn")
var ene2 = preload("res://Scenes/Enemy-1B.tscn")

onready var timer = get_node("EneSpawnTimer")

func _ready():
	timer.set_wait_time(5)
	timer.start()

func _on_EneSpawnTimer_timeout():
	var e1 = ene1.instance()
	get_tree().get_root().add_child(e1)
	
	var e2 = ene2.instance()
	get_tree().get_root().add_child(e2)
