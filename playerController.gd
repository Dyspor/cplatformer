class_name PlayerPhysicsBody2D 
extends CharacterBody2D

@export var gravity: float = 200.0
@export var jump_force: float = 200.0
@export var move_speed: float = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y += delta * gravity
	
	velocity.x = move_speed
	
	if Input.is_action_just_pressed("Jump"):
		if is_grounded():
			velocity.y = -jump_force
	
	if Input.is_action_just_released("Jump"):
		if velocity.y < 0:
			velocity.y = 0
	
	move_and_slide()


func is_grounded() -> bool:
	return move_and_collide(Vector2(0,5), true) != null
