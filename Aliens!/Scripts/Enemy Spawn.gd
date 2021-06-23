extends Node2D

var ene2 = preload("res://Scenes/Enemy-2B.tscn")
var ene1 = preload("res://Scenes/Enemy-1B.tscn")

func _ready():
	$AnimationPlayer.play("Spawn Idle")

# e is Enemy-1B 
# E is Enemy-2B

func WaveOne():
	var e = ene2.instance()
	get_tree().get_root().add_child(e)
	e.transform = $Portal.global_transform
	
	var e2 = ene2.instance()
	get_tree().get_root().add_child(e2)
	e2.transform = $Portal.global_transform
	
	var e3 = ene2.instance()
	get_tree().get_root().add_child(e3)
	e3.transform = $Portal.global_transform
	
	var e4 = ene2.instance()
	get_tree().get_root().add_child(e4)
	e4.transform = $Portal.global_transform
	
	var e5 = ene2.instance()
	get_tree().get_root().add_child(e5)
	e5.transform = $Portal.global_transform
	$WaveTwo.set_wait_time(3)

func WaveTwo():
	var e = ene2.instance()
	get_tree().get_root().add_child(e)
	e.transform = $Portal.global_transform
	
	var e2 = ene2.instance()
	get_tree().get_root().add_child(e2)
	e2.transform = $Portal.global_transform
	
	var e3 = ene2.instance()
	get_tree().get_root().add_child(e3)
	e3.transform = $Portal.global_transform
	
	var E = ene1.instance()
	get_tree().get_root().add_child(E)
	E.transform = $Portal.global_transform
	$WaveThree.set_wait_time(5)

func WaveThree():
	var E = ene1.instance()
	get_tree().get_root().add_child(E)
	E.transform = $Portal.global_transform
	
	var E2 = ene1.instance()
	get_tree().get_root().add_child(E2)
	E2.transform = $Portal.global_transform
	
	var E3 = ene1.instance()
	get_tree().get_root().add_child(E3)
	E3.transform = $Portal.global_transform
	
	var E4 = ene1.instance()
	get_tree().get_root().add_child(E4)
	E4.transform = $Portal.global_transform
	
	var E5 = ene1.instance()
	get_tree().get_root().add_child(E5)
	E5.transform = $Portal.global_transform
	
	var e = ene2.instance()
	get_tree().get_root().add_child(e)
	e.transform = $Portal.global_transform
	
	var e2 = ene2.instance()
	get_tree().get_root().add_child(e2)
	e2.transform = $Portal.global_transform
	
	var e3 = ene2.instance()
	get_tree().get_root().add_child(e3)
	e3.transform = $Portal.global_transform
	
	var e4 = ene2.instance()
	get_tree().get_root().add_child(e4)
	e4.transform = $Portal.global_transform
	
	var e5 = ene2.instance()
	get_tree().get_root().add_child(e5)
	e5.transform = $Portal.global_transform

func _on_WaveOne_timeout():
	WaveOne()

func _on_WaveTwo_timeout():
	WaveTwo()

func _on_WaveThree_timeout():
	WaveThree()
