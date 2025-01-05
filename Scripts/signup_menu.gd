extends Control

@onready var selecting_language: Control = $SelectingLanguage

@onready var signup_panel: Panel = $SignupPanel
@onready var us_label: Label = $SignupPanel/UsLabel
@onready var line_edit_1: LineEdit = $SignupPanel/UsLabel/LineEdit
@onready var emailor_ph_num_label: Label = $SignupPanel/EmailorPhNumLabel
@onready var line_edit_2: LineEdit = $SignupPanel/EmailorPhNumLabel/LineEdit
@onready var referral_code_label: Label = $SignupPanel/ReferralCodeLabel
@onready var line_edit_3: LineEdit = $SignupPanel/ReferralCodeLabel/LineEdit
@onready var done_btn: Button = $SignupPanel/Done

func _process(_delta: float) -> void:
	if line_edit_1.text == "" || line_edit_2.text == "":
		done_btn.disabled = true
	else:
		done_btn.disabled = false


func _on_done_pressed() -> void:
	Global.save_game("username", line_edit_1.text)
	
	if line_edit_2.text.is_valid_int():
		Global.save_game("phone_number", line_edit_2.text)
		Global.save_game("email", "")
	else:
		Global.save_game("email", line_edit_2.text)
		Global.save_game("phone_number", "")
		
	Global.save_game("friend_referral_code", line_edit_3.text)
	
	get_tree().change_scene_to_file("res://Scenes/root.tscn")


func _on_back_pressed() -> void:
	selecting_language.visible = true
