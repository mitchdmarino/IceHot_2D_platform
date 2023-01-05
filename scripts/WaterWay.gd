extends RigidBody2D

signal player_entered

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_area_entered(area):
	emit_signal("player_entered")


func _on_Area2D_body_entered(body):
	if body.is_in_group("FirePlayer"):
		body.die()
