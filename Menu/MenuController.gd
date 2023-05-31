extends Node

func _on_pong_start_pressed():
	get_tree().change_scene_to_file("res://Games/Pong/Pong.tscn")
	pass # Replace with function body.


func _on_tetris_start_pressed():
	get_tree().change_scene_to_file("res://Games/Tetris/Tetris.tscn")
	pass # Replace with function body.
