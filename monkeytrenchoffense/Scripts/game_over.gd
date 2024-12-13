extends VBoxContainer

const GAME = preload("res://Scenes/world.tscn")


func _on_menu_button_game_over_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	






func _on_quit_button_game_over_pressed() -> void:
	get_tree().quit()




func _on_restart_button_game_over_pressed() -> void:
	get_tree().change_scene_to_packed(GAME)
