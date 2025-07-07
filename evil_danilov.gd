extends CharacterBody2D

@export var player : CharacterBody2D
@onready var follow_point = player.get_node("sprite/Marker2D")

const speed = 15

func _physics_process(delta):
	var dir =  (player.global_position - global_position).normalized()
	#velocity.x = dir * speed * delta
	#move_and_slide()
	move_and_collide(dir * speed * delta)
