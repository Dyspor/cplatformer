class_name building_spawner
extends Node2D

const small_building: PackedScene = preload("res://Prefabs/BuildingSmall.tscn")
const medium_building: PackedScene = preload("res://Prefabs/BuildingMedium.tscn")
const big_building: PackedScene = preload("res://Prefabs/BuildingBig.tscn")
const tunnel_building: PackedScene = preload("res://Prefabs/BuildingTunnel.tscn")

@export var platform_gap: float = 900.0

var last_spawn: float = 0
var buildings: Array


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	buildings = [small_building, medium_building, big_building, tunnel_building]
	
	var start_building: Node = medium_building.instantiate()
	start_building.position = Vector2(last_spawn, 0)
	last_spawn += platform_gap
	add_child(start_building)
	
	spawn_next(null)
	
func spawn_next(_body) -> void:
	var type: PackedScene = buildings[randi() % buildings.size()]
	
	var next_building: Node = type.instantiate()
	next_building.position = Vector2(last_spawn, 0)
	call_deferred("add_child", next_building)
	
	var area: Area2D = next_building.get_child(1)
	area.body_entered.connect(spawn_next)
	
	last_spawn += platform_gap
