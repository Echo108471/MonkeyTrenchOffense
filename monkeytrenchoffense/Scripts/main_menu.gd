extends VBoxContainer

const GAME = preload("res://Scenes/world.tscn")


func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_packed(GAME)


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_check_button_pressed() -> void:
	Autoload.cheat_mode_checked = !Autoload.cheat_mode_checked
		
		
	
