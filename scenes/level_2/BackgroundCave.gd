extends Sprite

onready var current_level = int(get_tree().current_scene.name)
onready var player = get_node("/root/Level"+str(current_level)+"/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = player.position.x
	position.y = player.position.y
