extends Node
var blueControl = true
# Called when the node enters the scene tree for the first time
var level = self.get_child(0)
func _ready():
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (blueControl):
		if Input.is_action_pressed("ui_right"):
			$Level_1/IcePlayer.moveRight = true
		if Input.is_action_just_released("ui_right"):
			$Level_1/IcePlayer.moveRight = false
		if Input.is_action_pressed("ui_left"):
			$Level_1/IcePlayer.moveLeft = true
		if Input.is_action_just_released("ui_left"):
			$Level_1/IcePlayer.moveLeft = false
		if Input.is_action_just_pressed("ui_up"):
			$Level_1/IcePlayer.jump = true
			yield(get_tree().create_timer(0.3), "timeout")
			$Level_1/IcePlayer.jump = false 
	else:
		if Input.is_action_pressed("ui_right"):
			$Level_1/FirePlayer.moveRight = true
		if Input.is_action_just_released("ui_right"):
			$Level_1/FirePlayer.moveRight = false
		if Input.is_action_pressed("ui_left"):
			$Level_1/FirePlayer.moveLeft = true
		if Input.is_action_just_released("ui_left"):
			$Level_1/FirePlayer.moveLeft = false
		if Input.is_action_just_pressed("ui_up"):
			$Level_1/FirePlayer.jump = true
			yield(get_tree().create_timer(0.3), "timeout")
			$Level_1/FirePlayer.jump = false 

func _on_HUD_move_left():
	if (blueControl):
		$Level_1/IcePlayer.moveLeft = true
	else:
		$Level_1/FirePlayer.moveLeft = true

func _on_HUD_move_right():
	if (blueControl):
		$Level_1/IcePlayer.moveRight = true
	else:
		$Level_1/FirePlayer.moveRight = true

func _on_HUD_stop_move_left():
	if (blueControl):
		$Level_1/IcePlayer.moveLeft = false
	else:
		$Level_1/FirePlayer.moveLeft = false

func _on_HUD_stop_move_right():
	if (blueControl):
		$Level_1/IcePlayer.moveRight = false
	else:
		$Level_1/FirePlayer.moveRight = false

func _on_HUD_jump():
	if (blueControl):
		$Level_1/IcePlayer.jump = true
		yield(get_tree().create_timer(0.3), "timeout")
		$Level_1/IcePlayer.jump = false
	else:
		$Level_1/FirePlayer.jump = true
		yield(get_tree().create_timer(0.3), "timeout")
		$Level_1/FirePlayer.jump = false

func _on_WaterWay_player_entered():
	pass

func _on_HUD_switch_control():
	blueControl = !blueControl


func _on_Level_1_level_complete():
	var level_1 = self.get_node("Level_1")
	self.remove_child(level_1)
	var level_2_resource = load("res://Level_2.tscn")
	var level_2 = level_2_resource.instance()
	self.add_child(level_2)
	
