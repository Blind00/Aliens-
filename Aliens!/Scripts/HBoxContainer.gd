extends HBoxContainer

enum MODES {simple, empty, partial}

var heart_full = preload("res://.import/HPBars1_0100_Package-----------------.png-2da56dbffb04b918492d4a1be79db1a5.stex")

export (MODES) var mode = MODES.simple

func update_health(value):
	match mode:
		MODES.simple:
			update_simple(value)

func update_simple(value):
	for i in get_child_count():
		get_child(i).visible = value > i
