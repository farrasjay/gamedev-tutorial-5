extends Area2D

func _on_Door_body_entered(body : KinematicBody2D):
	if body.get_name() == "Player":
		get_tree().change_scene("res://scenes/Level2.tscn")
