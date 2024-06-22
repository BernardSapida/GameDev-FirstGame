extends Sprite

onready var player = get_node("/root/Level1/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = player.position.x + 300
	position.y = player.position.y - 300
