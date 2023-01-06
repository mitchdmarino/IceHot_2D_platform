extends RigidBody2D


var position1 
var position2 

# Called when the node enters the scene tree for the first time.
func _ready():
	position1 = position # (69, -120)
	position2 = position + Vector2(0, -100) # (69, -220)
	print(position, position1, position2)
func _physics_process(delta):
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
