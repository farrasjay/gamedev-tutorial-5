extends Area2D

func _on_OnDoorEntered_body_entered(body):
	if body.get_name() == "Player":
		$AnimatedSprite.play("opened")
		$AudioStreamPlayer2D.play()

func _on_OnDoorEntered_body_exited(body):
	if body.get_name() == "Player":
		$AnimatedSprite.play("idle")
