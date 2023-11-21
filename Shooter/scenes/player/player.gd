extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true
signal laser(pos)
signal grenade(pos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity =direction * 500
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_pressed("primary_action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		$LaserTimer.start()
		# emit the position selected
		laser.emit(selected_laser.global_position)
		
	# secondary action
	if Input.is_action_pressed("secondary_action") and can_grenade:
		var grenade_marker = $LaserStartPositions.get_children()
		var selected_grenade = grenade_marker[0]
		can_grenade = false
		$GrenadeTimer.start()
		grenade.emit(selected_grenade.global_position)

func _on_laser_timer_timeout():	
	can_laser = true
		
func _on_grenade_timer_timeout():
	can_grenade = true




