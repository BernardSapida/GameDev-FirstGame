extends StaticBody2D

onready var box_sound = $BoxSound
onready var tile_1 = $Tile1
onready var tile_2 = $Tile2
onready var tile_3 = $Tile3
onready var left_tile = $LeftTile
onready var middle_tile = $MiddleTile
onready var right_tile = $RightTile
onready var bottom_left_tile = $BottomLeftTile
onready var bottom_right_tile = $BottomRightTile

export(
	String, 
	"Tile1,Tile2,Tile3,LeftTile,MiddleTile,RightTile,BottomLeftTile,BottomRightTile"
) var tile_type = "Tile2"

# Called when the node enters the scene tree for the first time.
func _ready():
	match tile_type:
		"Tile1":
			tile_1.visible = true
		"Tile2":
			tile_2.visible = true
		"Tile3":
			tile_3.visible = true
		"LeftTile":
			left_tile.visible = true
		"MiddleTile":
			middle_tile.visible = true
		"RightTile":
			right_tile.visible = true
		"BottomLeftTile":
			bottom_left_tile.visible = true
		"BottomRightTile":
			bottom_right_tile.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func hide_tiles():
	tile_1.visible = false
	tile_2.visible = false
	tile_3.visible = false
	left_tile.visible = false
	middle_tile.visible = false
	right_tile.visible = false
	bottom_left_tile.visible = false
	bottom_right_tile.visible = false

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		box_sound.play()
	pass # Replace with function body.
