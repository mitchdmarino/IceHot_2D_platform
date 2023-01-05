extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var color = "red"
export var speed = 200
var jump_speed = 400
var gravity = 800
var velocity = Vector2()
var screen_size
var moveLeft = false
var moveRight = false
var jump = false
var alive = true

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func get_input(delta): 
	velocity.x = 0
	if moveRight :
		velocity.x +=speed
	if moveLeft:
		velocity.x -=speed
	if jump:
		if is_on_floor():
			velocity.y -= jump_speed
	#gravity
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)

func _physics_process(delta):
	# Check for input 
	get_input(delta)
	
func die():
	hide()
