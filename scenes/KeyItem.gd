extends Area2D

func _on_PressurePlate_body_entered(body : KinematicBody2D):
	if body.get_name() == "Player":
		$AnimatedSprite.play("pressed")
		$AudioStreamPlayer2D.play()
		$Ground17.move_local_x(-154)
