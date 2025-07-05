extends CharacterBody2D

const speed = 15
const jumpForce = 250
const superJumpForce = 600
const gravity = 400

@export var sprite: Sprite2D
@export var collision: CollisionShape2D

const defaultCollisionShape = Vector2(124.0, 360.0)
const defaultCollisionPosition = Vector2(-1.0, -1.0)
const duckCollisionShape = Vector2(119.5, 199.0)
const duckCollisionPosition = Vector2(-2.75, 78.5)

@export var duckSprite: Sprite2D

func _physics_process(delta: float):
	if Input.is_action_pressed("player_left"):
		velocity.x -= speed
	elif Input.is_action_pressed("player_right"):
		velocity.x += speed
	else:
		velocity.x = 0
	
	velocity.y += gravity * delta
	if Input.is_action_pressed("player_jump") and is_on_floor():
		velocity.y -= jumpForce
	elif Input.is_action_pressed("player_super_jump") and is_on_floor():
		velocity.y -= superJumpForce
	
	if Input.is_action_pressed("player_duck"):
		sprite.visible = false
		duckSprite.visible = true
		collision.shape.set_size(duckCollisionShape)
		collision.position = duckCollisionPosition
	elif Input.is_action_just_released("player_duck"):
		sprite.visible = true
		duckSprite.visible = false
		collision.shape.set_size(defaultCollisionShape)
		collision.position = defaultCollisionPosition
	
	move_and_slide()
	
	sprite.flip_h = velocity.x > 0 #velocity.x < 0
	duckSprite.flip_h = velocity.x > 0
