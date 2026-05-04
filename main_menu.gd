extends Control

func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://ModeSelection.tscn")
	

func _on_exit_btn_pressed():
	get_tree().quit()
