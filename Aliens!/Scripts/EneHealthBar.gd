extends Node

var bar_full = preload("res://.import/HPBars2_0061_Package-----------------.png-7feea08f8b6687e7ad9fccaa51d809a6.stex")

onready var healthbar = $HealthBar

func _ready():
	hide()
	if get_parent() and get_parent().get("max_health"):
		healthbar.max_value = get_parent().max_health
		
func _process(delta):
	global_rotation = 0

func update_healthbar(value):
	healthbar.texture_progress = bar_green
	if value < healthbar.max_value * 0.7:
		healthbar.texture_progress = bar_yellow
	if value < healthbar.max_value * 0.35:
		healthbar.texture_progress = bar_red
	
