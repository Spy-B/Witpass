extends Control

@onready var selecting_language: Control = $SelectingLanguage

@onready var signup_panel: Panel = $SignupPanel
@onready var us_label: Label = $SignupPanel/UsLabel
@onready var line_edit_1: LineEdit = $SignupPanel/UsLabel/LineEdit
@onready var emailor_ph_num_label: Label = $SignupPanel/EmailorPhNumLabel
@onready var line_edit_2: LineEdit = $SignupPanel/EmailorPhNumLabel/LineEdit
@onready var referral_code_label: Label = $SignupPanel/ReferralCodeLabel
@onready var line_edit_3: LineEdit = $SignupPanel/ReferralCodeLabel/LineEdit
@onready var next2_btn: Button = $SignupPanel/NextBtn

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if line_edit_1.text == "" || line_edit_2.text == "":
		next2_btn.disabled = true
	else:
		next2_btn.disabled = false



func _on_next2_btn_pressed() -> void:
	Global.save_app("username", line_edit_1.text)
	
	if line_edit_2.text.is_valid_int():
		Global.save_app("phone_number", line_edit_2.text)
		Global.save_app("email", "")
	else:
		Global.save_app("email", line_edit_2.text)
		Global.save_app("phone_number", "")
		
	Global.save_app("friend_referral_code", line_edit_3.text)
	
	get_tree().change_scene_to_file("res://Scenes/root.tscn")
