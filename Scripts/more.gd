extends Control

@onready var selecting_language: Control = $SelectingLangLabel
@onready var rules: Control = $Rules
@onready var support: Control = $Support
@onready var about: Control = $About
@onready var bottom_btns: Control = $"../BottomBtns"

func _on_language_pressed() -> void:
	selecting_language.visible = true
	bottom_btns.visible = false

func _on_rules_pressed() -> void:
	rules.visible = true
	bottom_btns.visible = false

func _on_support_pressed() -> void:
	support.visible = true
	bottom_btns.visible = false

func _on_about_pressed() -> void:
	about.visible = true
	bottom_btns.visible = false
