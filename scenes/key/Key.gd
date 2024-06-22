extends Area2D

onready var key = $Key

onready var key_blue_texture = load("res://assets/Sprites/key/KeyBlue.png")
onready var key_green_texture = load("res://assets/Sprites/key/KeyGreen.png")
onready var key_red_texture = load("res://assets/Sprites/key/KeyRed.png")
onready var key_yellow_texture = load("res://assets/Sprites/key/KeyYellow.png")

export(
	String, 
	"Blue,Green,Red,Yellow"
) var key_color = "Blue"

# Called when the node enters the scene tree for the first time.
func _ready():
	match key_color:
		"Blue":
			key.set_texture(key_blue_texture)
		"Green":
			key.set_texture(key_green_texture)
		"Red":
			key.set_texture(key_red_texture)
		"Yellow":
			key.set_texture(key_yellow_texture)

func _on_Key_body_entered(body):
	if body.name == "Player":
		body.collect_key(key_color)
		queue_free()
