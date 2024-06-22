extends Area2D

onready var blade = $Blade
onready var current_level = int(get_tree().current_scene.name)

var blade_green_texture = load("res://assets/Sprites/enemy/BladeGreen.png")
var blade_metal_texture = load("res://assets/Sprites/enemy/BladeMetal.png")
var blade_blue_texture = load("res://assets/Sprites/enemy/BladeBlue.png")
var blade_red_texture = load("res://assets/Sprites/enemy/BladeRed.png")
var blade_yellow_texture = load("res://assets/Sprites/enemy/BladeYellow.png")
var reverse = false

export var speed: int = 2
export var moveDist: int = 100
export var vertical_enemy = false
export var horizontal_enemy = false
export var circular = false
export var radius = 200

var target : KinematicBody2D
var angle = 0

export(
	String, 
	"BladeGreen,BladeMetal,BladeRed,BladeYellow,BladeBlie"
) var blade_type = "BladeMetal"

onready var startX: float = position.x
onready var targetX: float = position.x + moveDist
onready var center_position = position

# Called when the node enters the scene tree for the first time.
func _ready():
	match str(current_level):
		"1":
			blade.set_texture(blade_green_texture)
		"2":
			blade.set_texture(blade_metal_texture)
		"3":
			blade.set_texture(blade_red_texture)

func _physics_process(delta):
	if !vertical_enemy and !horizontal_enemy and !circular:
		return null
		
	if vertical_enemy:
		if reverse:
			position.y += speed
		else:
			position.y -= speed
	elif circular:
		angle += speed * delta
		
		var new_position = center_position + Vector2(radius * cos(angle), radius * sin(angle))
		
		# Move the enemy to the new position
		position = new_position
	else:
		if reverse:
			position.x += speed
		else:
			position.x -= speed

func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.reduce_life()

	if body.name.begins_with("Tile"):
		reverse = !reverse
