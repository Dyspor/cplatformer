class_name PlayerPhysicsBody2D 
extends CharacterBody2D

@export var gravity: float = 200.0
@export var jump_force: float = 200.0
@export var start_move_speed: float = 300.0
@export var add_speed_per_second: float = 50.0
@export var min_jump_time: float = 0.2
@export var point_modifier: float = 100

var move_speed: float
var jump_release_buffer: bool = false;
var jump_timer: float = 0
var point_label: Label
var points: float = 0

func _ready() -> void:
	move_speed = start_move_speed
	point_label = get_node("Camera2D/LabelScoreNumb")

# Called every frame. 'delta' s the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	points += (move_speed * delta) / point_modifier
	point_label.text = str(int(points))
	move_speed += delta * add_speed_per_second
	jump_timer += delta
	
	velocity.y += delta * gravity
	velocity.x = move_speed
	
	if Input.is_action_just_pressed("Jump"):
		if is_grounded():
			velocity.y = -jump_force
			jump_timer = 0
	
	if Input.is_action_just_released("Jump") || jump_release_buffer:
		if velocity.y < 0:
			if jump_timer > min_jump_time:
				velocity.y = 0
				jump_release_buffer = false
			else:
				jump_release_buffer = true
	
	move_and_slide()



func is_grounded() -> bool:
	return move_and_collide(Vector2(0,5), true) != null

func _on_death_zone_body_entered(_body: Node2D) -> void:
	Global.points = points
	get_tree().call_deferred("change_scene_to_file", "res://Data/Menus/GameOver/game_over.tscn")
