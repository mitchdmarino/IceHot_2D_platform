extends Node2D

var move = false
var velocity = Vector2()
var speed = 200
var count = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	if(move):
		if ($YellowWall.position.y > $YellowWall.position2.y):
			$YellowWall.position += Vector2(0, -2)
	else:
		if ($YellowWall.position.y < $YellowWall.position1.y):
			$YellowWall.position += Vector2(0, 2)
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	


		
# If button down, move to alt pos
# If button released, return to original position
		

func _on_YellowButton_body_exited(body):
	move = false


func _on_YellowButton_body_entered(body):
	move = true
