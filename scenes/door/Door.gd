extends Area2D

onready var door = $Door
onready var current_level = int(get_tree().current_scene.name)

onready var door_blue_texture = load("res://assets/Sprites/door/DoorBlue.png")
onready var door_green_texture = load("res://assets/Sprites/door/DoorGreen.png")
onready var door_red_texture = load("res://assets/Sprites/door/DoorRed.png")
onready var door_yellow_texture = load("res://assets/Sprites/door/DoorYellow.png")
onready var door_open_texture = load("res://assets/Sprites/door/DoorOpen.png")
onready var door_open_sound = $DoorOpenSound

export(
	String, 
	"Blue,Green,Red,Yellow,Open"
) var door_color = "Open"

func _ready():
	match door_color:
		"Blue":
			door.set_texture(door_blue_texture)
		"Green":
			door.set_texture(door_green_texture)
		"Red":
			door.set_texture(door_red_texture)
		"Yellow":
			door.set_texture(door_yellow_texture)
		"Open":
			door.set_texture(door_open_texture)

func _on_Door_body_entered(body):
	if body.name == "Player" and body.get_key() == door_color:
		door_open_sound.play()
		door.set_texture(door_open_texture)
		body.enter_door(position.x)
		yield(get_tree().create_timer(2), "timeout") 
		get_tree().change_scene("res://scenes/level_" + str(current_level+1) + "/Level" + str(current_level+1) + ".tscn")
