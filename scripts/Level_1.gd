extends Node2D

signal level_complete

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$YellowObstacle/YellowButton.translate(Vector2(-450,0))
	$BlueObstacle/YellowWall/Sprite.modulate = Color(0, 0, 1)
	$BlueObstacle/YellowButton/ButtonAnimation.modulate = Color(0, 0, 1)
	$BlueObstacle/YellowButton.translate(Vector2(500, -70))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Finish_body_entered(body):
	emit_signal("level_complete")
	
