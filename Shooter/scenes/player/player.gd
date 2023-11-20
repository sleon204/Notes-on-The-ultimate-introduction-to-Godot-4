extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true
signal laser
signal grenade

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#input
	var direction = Input.get_vector("left","right","up","down")
	velocity =direction * 500
	move_and_slide()
	
	# laser shooting input
	if Input.is_action_pressed("primary_action") and can_laser:
		can_laser = false
		$LaserTimer.start()
		laser.emit()
		
	# secondary action
	if Input.is_action_pressed("secondary_action") and can_grenade:
		can_grenade = false
		$GrenadeTimer.start()
		grenade.emit()

func _on_laser_timer_timeout():	
	can_laser = true
		
func _on_grenade_timer_timeout():
	can_grenade = true




