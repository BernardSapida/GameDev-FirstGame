extends StaticBody2D

onready var block = $Block
onready var box_sound = $BoxSound
onready var soil_grass_texture = load("res://assets/Sprites/SoilGrass.png")
onready var soil_texture = load("res://assets/Sprites/Soil.png")
onready var block_yellow_dotted_white_texture = load("res://assets/Sprites/BlockYellowDottedWhite.png")
onready var block_yellow_dotted_texture = load("res://assets/Sprites/BlockYellowDotted.png")
onready var block_wood_texture = load("res://assets/Sprites/BlockWood.png")
onready var block_metal_texture = load("res://assets/Sprites/BlockMetal.png")

export(
	String, 
	"SoilGrass,Soil,BlockYellowDottedWhite,BlockYellowDotted,BlockWood,BlockMetal"
) var tile_type = "SoilGrass"

# Called when the node enters the scene tree for the first time.
func _ready():
	match tile_type:
		"SoilGrass":
			block.set_texture(soil_grass_texture)
		"Soil":
			block.set_texture(soil_texture)
		"BlockYellowDottedWhite":
			block.set_texture(block_yellow_dotted_white_texture)
		"BlockYellowDotted":
			block.set_texture(block_yellow_dotted_texture)
		"BlockWood":
			block.set_texture(block_wood_texture)
		"BlockMetal":
			block.set_texture(block_metal_texture)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		box_sound.play()
	pass # Replace with function body.
