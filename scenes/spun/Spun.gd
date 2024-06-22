extends Area2D

onready var spun = $Sprite

export var vertical_flip = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if vertical_flip:
		spun.flip_v = true

func _on_Spun_body_entered(body):
	if body.name == "Player":
		body.reduce_life()
