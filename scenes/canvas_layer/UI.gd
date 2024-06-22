extends Control

onready var score_text = get_node("ScoreText")
onready var fire_remaining_text = get_node("FireRemainingText")
onready var life_remaining_text = get_node("LifeRemainingText")
onready var yellow_coin_texture = load("res://assets/Sprites/coin/CoinYellow.png")
onready var blue_coin_texture = load("res://assets/Sprites/coin/CoinBlue.png")
onready var red_coin_texture = load("res://assets/Sprites/coin/CoinRed.png")
onready var blue_key_texture = load("res://assets/Sprites/key/KeyBlue.png")
onready var red_key_texture = load("res://assets/Sprites/key/KeyRed.png")
onready var green_key_texture = load("res://assets/Sprites/key/KeyGreen.png")
onready var yellow_key_texture = load("res://assets/Sprites/key/KeyYellow.png")
onready var current_level = int(get_tree().current_scene.name)

onready var key_rect = $KeyRect
onready var score_rect = $ScoreRect

# Called when the node enters the scene tree for the first time.
func _ready():
	score_text.text = "0"
	fire_remaining_text.text = "0"
	life_remaining_text.text = "0"
	
	match str(current_level):
		"1":
			score_rect.set_texture(yellow_coin_texture)
		"2":
			score_rect.set_texture(blue_coin_texture)
		"3":
			score_rect.set_texture(red_coin_texture)

func set_score_text(score):
	score_text.text = str(score)
	
func set_fire_remaining_text(fire_remaining):
	fire_remaining_text.text = str(fire_remaining)

func set_life_remaining_text(life_remaining):
	life_remaining_text.text = str(life_remaining)

func set_key(key_type):
	match key_type:
		"Blue":
			key_rect.set_texture(blue_key_texture)
		"Red":
			key_rect.set_texture(red_key_texture)
		"Green":
			key_rect.set_texture(green_key_texture)
		"Yellow":
			key_rect.set_texture(yellow_key_texture)
