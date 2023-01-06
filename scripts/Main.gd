extends Node
var blueControl = true
# Called when the node enters the scene tree for the first time

func _ready():
	var yellowButton = $YellowObstacle/YellowButton.duplicate()
	yellowButton.translate(Vector2(100, -500))
	$YellowObstacle.add_child(yellowButton)
	$YellowObstacle/YellowButton.translate(Vector2(-100, 0))
	$YellowObstacle/YellowWall/Sprite.modulate = Color(0, 0, 1)
	$YellowObstacle/YellowButton/ButtonAnimation.modulate = Color(0, 0, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (blueControl):
		if Input.is_action_pressed("ui_right"):
			$IcePlayer.moveRight = true
		if Input.is_action_just_released("ui_right"):
			$IcePlayer.moveRight = false
		if Input.is_action_pressed("ui_left"):
			$IcePlayer.moveLeft = true
		if Input.is_action_just_released("ui_left"):
			$IcePlayer.moveLeft = false
		if Input.is_action_just_pressed("ui_up"):
			$IcePlayer.jump = true
			yield(get_tree().create_timer(0.3), "timeout")
			$IcePlayer.jump = false 
	else:
		if Input.is_action_pressed("ui_right"):
			$FirePlayer.moveRight = true
		if Input.is_action_just_released("ui_right"):
			$FirePlayer.moveRight = false
		if Input.is_action_pressed("ui_left"):
			$FirePlayer.moveLeft = true
		if Input.is_action_just_released("ui_left"):
			$FirePlayer.moveLeft = false
		if Input.is_action_just_pressed("ui_up"):
			$FirePlayer.jump = true
			yield(get_tree().create_timer(0.3), "timeout")
			$FirePlayer.jump = false 

func _on_HUD_move_left():
	if (blueControl):
		$IcePlayer.moveLeft = true
	else:
		$FirePlayer.moveLeft = true

func _on_HUD_move_right():
	if (blueControl):
		$IcePlayer.moveRight = true
	else:
		$FirePlayer.moveRight = true

func _on_HUD_stop_move_left():
	if (blueControl):
		$IcePlayer.moveLeft = false
	else:
		$FirePlayer.moveLeft = false

func _on_HUD_stop_move_right():
	if (blueControl):
		$IcePlayer.moveRight = false
	else:
		$FirePlayer.moveRight = false

func _on_HUD_jump():
	if (blueControl):
		$IcePlayer.jump = true
		yield(get_tree().create_timer(0.3), "timeout")
		$IcePlayer.jump = false
	else:
		$FirePlayer.jump = true
		yield(get_tree().create_timer(0.3), "timeout")
		$FirePlayer.jump = false

func _on_WaterWay_player_entered():
	pass

func _on_HUD_switch_control():
	blueControl = !blueControl
