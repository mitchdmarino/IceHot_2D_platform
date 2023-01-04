extends Node



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HUD_move_left():
	$IcePlayer.moveLeft = true



func _on_HUD_move_right():
	$IcePlayer.moveRight = true


func _on_HUD_stop_move_left():
	$IcePlayer.moveLeft = false

func _on_HUD_stop_move_right():
	$IcePlayer.moveRight = false


func _on_HUD_jump():
	$IcePlayer.jump = true
	yield(get_tree().create_timer(0.3), "timeout")
	$IcePlayer.jump = false


func _on_WaterWay_player_entered():
	$IcePlayer.jump=true
