extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 400
var screen_size
var moveLeft = false
var moveRight = false
var jump = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	# Check for input 
	var velocity = Vector2.ZERO
	if moveLeft:
		velocity.x -=1
	if moveRight:
		velocity.x +=1
	if jump: 
		velocity.y -=1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


	
