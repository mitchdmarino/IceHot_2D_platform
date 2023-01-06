extends Node
var blueControl = true
# Called when the node enters the scene tree for the first time
var level

func _ready():
	level = self.get_child(0)
	print(level)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (blueControl):
		if Input.is_action_pressed("ui_right"):
			level.get_node("IcePlayer").moveRight = true
		if Input.is_action_just_released("ui_right"):
			level.get_node("IcePlayer").moveRight = false
		if Input.is_action_pressed("ui_left"):
			level.get_node("IcePlayer").moveLeft = true
		if Input.is_action_just_released("ui_left"):
			level.get_node("IcePlayer").moveLeft = false
		if Input.is_action_just_pressed("ui_up"):
			level.get_node("IcePlayer").jump = true
			yield(get_tree().create_timer(0.3), "timeout")
			level.get_node("IcePlayer").jump = false 
	else:
		if Input.is_action_pressed("ui_right"):
			level.get_node("FirePlayer").moveRight = true
		if Input.is_action_just_released("ui_right"):
			level.get_node("FirePlayer").moveRight = false
		if Input.is_action_pressed("ui_left"):
			level.get_node("FirePlayer").moveLeft = true
		if Input.is_action_just_released("ui_left"):
			level.get_node("FirePlayer").moveLeft = false
		if Input.is_action_just_pressed("ui_up"):
			level.get_node("FirePlayer").jump = true
			yield(get_tree().create_timer(0.3), "timeout")
			level.get_node("FirePlayer").jump = false 

func _on_HUD_move_left():
	if (blueControl):
		level.get_node("IcePlayer").moveLeft = true
	else:
		level.get_node("FirePlayer").moveLeft = true

func _on_HUD_move_right():
	if (blueControl):
		level.get_node("IcePlayer").moveRight = true
	else:
		level.get_node("FirePlayer").moveRight = true

func _on_HUD_stop_move_left():
	if (blueControl):
		level.get_node("IcePlayer").moveLeft = false
	else:
		level.get_node("FirePlayer").moveLeft = false

func _on_HUD_stop_move_right():
	if (blueControl):
		level.get_node("IcePlayer").moveRight = false
	else:
		level.get_node("FirePlayer").moveRight = false

func _on_HUD_jump():
	if (blueControl):
		level.get_node("IcePlayer").jump = true
		yield(get_tree().create_timer(0.3), "timeout")
		level.get_node("IcePlayer").jump = false
	else:
		level.get_node("FirePlayer").jump = true
		yield(get_tree().create_timer(0.3), "timeout")
		level.get_node("FirePlayer").jump = false

func _on_WaterWay_player_entered():
	pass

func _on_HUD_switch_control():
	blueControl = !blueControl


func _on_Level_1_level_complete():
	var level_1 = self.get_node("Level_1")
	self.remove_child(level)
	var level_2_resource = load("res://Level_2.tscn")
	var level_2 = level_2_resource.instance()
	self.add_child(level_2)
	level = level_2
	
