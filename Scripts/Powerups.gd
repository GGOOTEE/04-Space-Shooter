extends Node2D



export var probability = 0.3
onready var Meteor = load("res://Scenes/Powerup.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	if randf() < probability:
		var m = Meteor.instance()
		add_child(m)
