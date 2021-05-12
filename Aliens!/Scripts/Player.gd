extends Node2D

func _ready():
	pass 
	add_to_group("Player")

export var Speed = 200
var velocity = Vector2.ZERO
var p_Bullet = load("res://Scenes/p_Bullet.tscn")
onready var A1 = $AnimationPlayer.play("Idle")
var b = p_Bullet.instance()

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		$AnimationPlayer.play("Move Up")
	if Input.is_action_pressed("ui_down"):
		velocity.y  += 1
		$AnimationPlayer.play("Move Down")
	if Input.is_action_pressed("Shoot"):
		shoot()
	
	velocity = velocity.normalized() * Speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	


func shoot():
	add_child(b)





