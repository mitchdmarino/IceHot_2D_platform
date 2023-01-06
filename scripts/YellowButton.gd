extends Area2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


	
	


func _on_YellowButton_body_exited(body):
	$ButtonAnimation.play("release")
	

func _on_YellowButton_body_entered(body):
	$ButtonAnimation.play("press")
