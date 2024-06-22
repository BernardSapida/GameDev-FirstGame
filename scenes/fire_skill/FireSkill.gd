extends Area2D

onready var fire_count = $FireCountText
export var fire_value = 5

func _ready():
	fire_count.text = "+ " + str(fire_value)

func _on_FireSkill_body_entered(body):
	if body.name == "Player":
		body.collect_fire(fire_value)
		queue_free()
