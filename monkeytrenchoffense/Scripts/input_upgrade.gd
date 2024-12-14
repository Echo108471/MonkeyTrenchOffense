extends CanvasLayer

signal upgradeChosen

@onready var upgrade_panel = get_node("ChooseUpgradePanel") 
@onready var leadBalloonButton = get_node("ChooseUpgradePanel/CenterContainer/PanelContainer/MarginContainer/HBoxContainer/LeadBloonContainer/LeadBloonButton")
@onready var beastBalloonButton = get_node("ChooseUpgradePanel/CenterContainer/PanelContainer/MarginContainer/HBoxContainer/BeastBloonContainer/BeastBloonButton") 
@onready var blackHoleBalloonButton = get_node("ChooseUpgradePanel/CenterContainer/PanelContainer/MarginContainer/HBoxContainer/BlackHoleBloonContainer/BlackHoleBloonButton")



func _on_lead_bloon_button_pressed() -> void:
	emit_signal("upgradeChosen", "lead")
	get_tree().paused = false
	visible = false 
	


func _on_beast_bloon_button_pressed() -> void:
	emit_signal("upgradeChosen", "beast")
	get_tree().paused = false
	visible = false 
	
	

func _on_black_hole_bloon_button_pressed() -> void:
	emit_signal("upgradeChosen", "black_hole")
	get_tree().paused = false
	visible = false
