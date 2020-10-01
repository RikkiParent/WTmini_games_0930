extends Node2D


var METHANE = load("res://Methane.tscn")
var H20 = load("res://H20.tscn")
var BIOSOLID = load("res://Biosolid.tscn")
var COMPOST = load("res://Compost.tscn")

var is_spawning = false



# Called when the node enters the scene tree for the first time.

func _ready():
	
	#var COUGHT_METHANE = get_tree().get_root().find_node("Level_Biogas", true, false)
	#COUGHT_METHANE.connect("cought_methane", self, "handle_cought_methane")
	
	pass


func spawn_gas():
	randomize()
	var my_random_number = randi() % 2 + 1
	print("Random Number is: ", my_random_number)
	
	is_spawning = true
	
	while is_spawning:
		
		if my_random_number == 1:
			var spawn = METHANE.instance()
			var pos = Vector2()
			pos.x = rand_range(-150, 150) #get_viewport().get_visible_rect().size.x)
			pos.y = rand_range(-50, 50) #get_viewport().get_visible_rect().size.y)
			print("Methane spawn position is: ", "x: ", pos.x, "y: ", pos.y)
			spawn.position = pos
			spawn.scale = Vector2(0.4, 0.4)
			#PlayerVariables.TotalEnemies += 1
			add_child(spawn)
			#yield(get_tree().create_timer(rand_range(0.5, 5)), "timeout")
			is_spawning = false
			
		elif my_random_number == 2:
			var spawn = H20.instance()
			var pos = Vector2()
			pos.x = rand_range(-150, 150) #get_viewport().get_visible_rect().size.x)
			pos.y = rand_range(-50, 50) #get_viewport().get_visible_rect().size.y)
			print("H20 spawn position is: ", "x: ", pos.x, "y: ", pos.y)
			spawn.position = pos
			spawn.scale = Vector2(0.4, 0.4)
			#PlayerVariables.TotalEnemies += 1
			add_child(spawn)
			#yield(get_tree().create_timer(rand_range(0.5, 5)), "timeout")
			is_spawning = false
			
		
	
func spawn_biosolid():
	
	var spawn = BIOSOLID.instance()
	var pos = Vector2()
	pos.x = rand_range(-150, 150) #get_viewport().get_visible_rect().size.x)
	pos.y = rand_range(-50, 50) #get_viewport().get_visible_rect().size.y)
	print("Biosolid spawn position is: ", "x: ", pos.x, "y: ", pos.y)
	spawn.position = pos
	spawn.scale = Vector2(3, 3)
	add_child(spawn)
	
	
func spawn_compost():
	var spawn = COMPOST.instance()
	add_child(spawn)
