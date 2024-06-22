extends Area2D

export var life_value = 1

func _ready():
	pass

func _on_Life_body_entered(body):
	if body.name == "Player":
		body.collect_life(life_value)
		queue_free()
