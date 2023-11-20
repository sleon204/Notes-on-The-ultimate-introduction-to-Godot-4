extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")


func _on_gate_player_entered_gate():
	print('player has entered gate')


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos
	# add laser to node2d
	$Projectiles.add_child(laser)


func _on_player_grenade():
	print('grenade from level')
