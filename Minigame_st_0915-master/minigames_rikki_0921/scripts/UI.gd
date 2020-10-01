extends Control


# all variables need to be "onready"
onready var TotEnemies : Label = get_node("Bkgnd/EnemiesBkgnd/EnemiesCount")
onready var EnemyKills : Label = get_node("Bkgnd/KillsBkgnd/KillCount")

func _ready():
	update_enemy_counter(10)
	pass


func update_enemy_counter (enemies):
	
	TotEnemies.text = str(enemies)
	print("Tot enemies updated", enemies)
	

func update_kill_count (eKilled):
	
	EnemyKills.text = str(PlayerVariables.EnemiesKilled)
	print("Enemies killed updated")

