extends CanvasLayer

signal move_left
signal stop_move_left
signal move_right
signal stop_move_right
signal jump
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LeftButton_button_down():
	emit_signal("move_left")


func _on_RightButton_button_down():
	emit_signal("move_right")



func _on_LeftButton_button_up():
	emit_signal("stop_move_left")


func _on_RightButton_button_up():
	emit_signal("stop_move_right")


func _on_JumpButton_button_down():
	emit_signal("jump")
