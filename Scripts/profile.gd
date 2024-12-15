extends Control

@onready var username_label: Label = $Panel/UsernameLabel
@onready var referral_code_label: Label = $Panel/ReferralCodeLabel

@onready var account_settings_menu: Control = $AccountSettingsMenu
@onready var us_label: Label = $AccountSettingsMenu/AccountSettingsPanel/UsLabel
@onready var line_edit_1: LineEdit = $AccountSettingsMenu/AccountSettingsPanel/UsLabel/LineEdit
@onready var email_or_phone_number_label: Label = $AccountSettingsMenu/AccountSettingsPanel/EmailorPhNumLabel
@onready var line_edit_2: LineEdit = $AccountSettingsMenu/AccountSettingsPanel/EmailorPhNumLabel/LineEdit
@onready var done: Button = $AccountSettingsMenu/AccountSettingsPanel/Done

func _ready() -> void:
	load_resource()
	
	line_edit_1.text = str(Global.load_app().username)
	
	if Global.load_app().phone_number != "":
		email_or_phone_number_label.text = "EDIT_YOUR_PHONE_NUMBER_LABEL"
		line_edit_2.text = str(Global.load_app().phone_number)
		line_edit_2.placeholder_text = "PHONE_NUMBER_LABEL"
	elif Global.load_app().email != "":
		email_or_phone_number_label.text = "EDIT_YOUR_EMAIL_LABEL"
		line_edit_2.text = str(Global.load_app().email)
		line_edit_2.placeholder_text = "EMAIL_LABEL"
		

func load_resource() -> void:
	username_label.text = Global.load_app().username
	referral_code_label.text = Global.load_app().referral_code


func _on_done_pressed() -> void:
	Global.load_resource()
	
	if line_edit_1.text != "":
		Global.load_resource()
		Global.save_app("username", line_edit_1.text)
	
	if Global.load_app().phone_number != "" && line_edit_2.text != "":
		Global.load_resource()
		Global.save_app("phone_number", line_edit_2.text)
	elif Global.load_app().email != "" && line_edit_2.text != "":
		Global.load_resource()
		Global.save_app("email", line_edit_2.text)
	
	account_settings_menu.visible = false

func _on_cancel_pressed() -> void:
	line_edit_1.text = str(Global.load_app().username)
	
	if Global.load_app().phone_number != "":
		line_edit_2.text = str(Global.load_app().phone_number)
	elif Global.load_app().email != "":
		line_edit_2.text = str(Global.load_app().email)
	
	account_settings_menu.visible = false


func _on_account_settings_pressed() -> void:
	account_settings_menu.visible = true
