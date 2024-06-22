extends Area2D

var direction = Vector2.ZERO
var speed = 400

onready var fire = $Fire

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	position += direction.normalized() * speed * delta
	
	if direction.normalized().x == 1:
		fire.flip_h = false
	else:
		fire.flip_h = true
	
func _on_Fire_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
	if area.name.begins_with("Spun") or area.name.begins_with("Blade"):
		area.queue_free()
		queue_free()

func _on_Fire_body_entered(body):
	if body.name.begins_with("Tile"):
		queue_free()
