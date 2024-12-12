extends CanvasLayer

const MENU = preload("res://Scenes/main_menu.tscn")


@onready var pause_panel = get_node("PausePanel") 
@onready var pause_button = get_node("PauseContainer/PauseButton") 


func _on_pause_button_pressed() -> void:
	pause_panel.visible = true
	pause_button.visible = false
	get_tree().paused = true


func _on_resume_button_pressed() -> void:
	get_tree().paused = false
	pause_button.visible = true
	pause_panel.visible = false
	


func _on_quit_button_game_pressed() -> void:
	get_tree().quit()
