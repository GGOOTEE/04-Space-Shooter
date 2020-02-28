extends RigidBody2D


var velocity = Vector2(0,0)
export var min_speed = 100
export var max_speed = 300
export var damage = 30
export var score = 20

onready var Explosion = load("res://Scenes/Explosion.tscn")


func _ready():
	randomize()
	position.x = randi() % int(get_viewport_rect().size.x)
	velocity.y = max(randi() % max_speed, min_speed)
	contact_monitor = true
	set_max_contacts_reported(4)
	linear_velocity = velocity

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		
		if c.name == "Player":
			c.change_health(damage)
		queue_free()
		
	if position.y > get_viewport_rect().size.y - 50:
		linear_velocity = Vector2(0,0)

func _integrate_forces(state):
	#state.set_linear_velocity(velocity)
	pass
