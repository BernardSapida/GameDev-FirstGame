extends Area2D

var is_collected: bool = false

onready var current_level = int(get_tree().current_scene.name)
onready var coin_sound = $CoinSound
onready var animation = $Animation
onready var coin = $Coin

onready var coin_blue_texture = load("res://assets/Sprites/coin/CoinBlue.png")
onready var coin_red_texture = load("res://assets/Sprites/coin/CoinRed.png")
onready var coin_yellow_texture = load("res://assets/Sprites/coin/CoinYellow.png")
onready var coin_green_texture = load("res://assets/Sprites/coin/CoinGreen.png")

export var value = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	match str(current_level):
		"1":
			coin.set_texture(coin_yellow_texture)
		"2":
			coin.set_texture(coin_blue_texture)
		"3":
			coin.set_texture(coin_red_texture)
		"Green":
			coin.set_texture(coin_green_texture)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation_degrees += 90 * delta
	
	if is_collected:
		position.y -= 150 * delta

func _on_Coins_body_entered(body):
	if body.name == "Player":
		is_collected = true
		animation.play("fade")
		coin_sound.play()
		body.collect_coin(value)
		yield(get_tree().create_timer(0.5), "timeout") 
		queue_free()
