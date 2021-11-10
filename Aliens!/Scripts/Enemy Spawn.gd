extends Node2D

var ene3 = preload("res://Scenes/Boss#1.tscn")
var ene2 = preload("res://Scenes/Enemy-2B.tscn")
var ene1 = preload("res://Scenes/Enemy-1B.tscn")
#onready var level = get_parent().get_parent()
func _ready():
	$AnimationPlayer.play("Spawn Idle")

# e is Enemy-1B 
# E is Enemy-2B

func WaveOne():
	print("wave one")
	for i in range(5):
		var e = ene2.instance()
		get_tree().get_root().add_child(e)
		e.global_transform = $Portal.global_transform

func WaveTwo():
	for i in range (3):
		var e = ene2.instance()
		get_tree().get_root().add_child(e)
		e.transform = $Portal.global_transform
	
	var E = ene1.instance()
	get_tree().get_root().add_child(E)
	E.transform = $Portal.global_transform
	$WaveThree.set_wait_time(5)

func WaveThree():
	for i in range(3):
		var e = ene1.instance()
		get_tree().get_root().add_child(e)
		e.transform = $Portal.global_transform
	
	for i in range(3):
		var e2 = ene2.instance()
		get_tree().get_root().add_child(e2)
		e2.transform = $Portal.global_transform
	
	var e3 = ene3.instance()
	get_tree().get_root().add_child(e3)
	e3.transform = $Portal.global_transform
	
func _on_WaveOne_timeout():
	WaveOne()

func _on_WaveTwo_timeout():
	WaveTwo()

func _on_WaveThree_timeout():
	WaveThree()
