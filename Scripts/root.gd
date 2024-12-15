extends Control
class_name Root

@onready var main: Control = $Main

@onready var top_side: Control = $Main/TopSide

@onready var tickets: TextureRect = $Main/TopSide/Tickets
@onready var tickets_label: Label = $Main/TopSide/Tickets/TicketsLabel
@onready var user_name: Label = $Main/TopSide/UserName


@onready var main_panel: Control = $Main/MainPanel
@onready var question: Label = $Main/MainPanel/Question
@onready var start_btn: Button = $Main/MainPanel/Start
@onready var correct_btn: Button = $Main/MainPanel/Correct
@onready var incorrect_btn: Button = $Main/MainPanel/Incorrect
@onready var yes_btn: Button = $Main/MainPanel/StopWarning/Panel/Yes
@onready var cancel_btn: Button = $Main/MainPanel/StopWarning/Panel/Cancel
@onready var close_btn: Sprite2D = $Main/MainPanel/Close
@onready var stop_warning_panel: Control = $Main/MainPanel/StopWarning

@onready var cards_wrapper: Control = $Main/CardsWrapper

@onready var profile: Control = $Profile
@onready var total_time_label: Label = $Profile/ScrollContainer/HBoxContainer/TotalTime/Label2

@onready var more: Control = $More
@onready var selecting_language: Control = $More/SelectingLangLabel
@onready var system_bar_color_changer: SystemBarColorChanger = $SystemBarColorChanger

@onready var bottom_btns: Control = $BottomBtns
@onready var page_selector: Node2D = $BottomBtns/PageSelector
@onready var selector: Sprite2D = $BottomBtns/PageSelector/Selector
@onready var marker_2d: Marker2D = $BottomBtns/PageSelector/Marker2D
@onready var marker_2d_2: Marker2D = $BottomBtns/PageSelector/Marker2D2
@onready var marker_2d_3: Marker2D = $BottomBtns/PageSelector/Marker2D3

@onready var timer: Timer = $TotalTime

var totalTimeInApp


func _ready() -> void:
	Global.appStarted = true
	load_app_resource()
	
	if TranslationServer.get_locale() == "ar":
		selector.global_position = marker_2d_3.global_position
	
	system_bar_color_changer.set_translucent_system_bars(true)

func _process(_delta: float) -> void:
	if selecting_language.next_btn.button_pressed == true:
		if TranslationServer.get_locale() == "ar":
			selector.position = marker_2d.position
		else:
			selector.position = marker_2d_3.position
	
	if !Questions.test_done:
		question.text = str(Questions.question)
	else:
		question.text = "YOU WON"

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		if Global.QuitPressed:
			get_tree().quit()
		
		if Engine.has_singleton("ToastPlugin") && !Global.QuitPressed:
			var toast_plugin = Engine.get_singleton("ToastPlugin")
			toast_plugin.showToast("Click again", 0, 0, 0, 500)
			Global.QuitPressed = true
		
		Global.load_resource()
		Global.save_app("total_time_in_app", totalTimeInApp)


func load_app_resource():
	user_name.text = str(Global.load_app().username)
	tickets_label.text = str(Global.load_app().tickets)
	#Questions.passedQuestions = Global.load_app().passed_questions
	totalTimeInApp = Global.load_app().total_time_in_app


func _on_start_pressed() -> void:
	tickets.visible = false
	cards_wrapper.visible = false
	start_btn.visible = false
	
	correct_btn.visible = true
	incorrect_btn.visible = true
	close_btn.visible = true
	
	var tween1 = get_tree().create_tween()
	var tween2 = get_tree().create_tween()
	var tween3 = get_tree().create_tween()
	var tween4 = get_tree().create_tween()
	tween1.tween_property(bottom_btns, "position", Vector2(0, 2350), 0.1).set_trans(Tween.TRANS_CUBIC)
	tween2.tween_property(correct_btn, "modulate", Color.html("ffffff"), 0.1).set_trans(Tween.TRANS_CUBIC)
	tween3.tween_property(incorrect_btn, "modulate", Color.html("ffffff"), 0.1).set_trans(Tween.TRANS_CUBIC)
	tween4.tween_property(close_btn, "modulate", Color.html("ff2929"), 0.1).set_trans(Tween.TRANS_CUBIC)
	
	Questions.questions_selector()


func _on_correct_pressed() -> void:
	var answer
	
	if Questions.correctAnswer:
		answer = "Correct"
		Questions.questions_selector()
	else:
		answer = "Incorrect!"
		Questions.questions_selector()
	
	print(answer)

func _on_incorrect_pressed() -> void:
	var answer
	
	if !Questions.correctAnswer:
		answer = "Correct"
		Questions.questions_selector()
	else:
		answer = "Incorrect!"
		Questions.questions_selector()
	
	print(answer)


func _on_close_pressed() -> void:
	stop_warning_panel.visible = true

func _on_yes_stop_playing_pressed() -> void:
	stop_warning_panel.visible = false
	
	tickets.visible = true
	cards_wrapper.visible = true
	start_btn.visible = true
	
	correct_btn.visible = false
	incorrect_btn.visible = false
	close_btn.visible = false
	
	var tween1 = get_tree().create_tween()
	var tween2 = get_tree().create_tween()
	var tween3 = get_tree().create_tween()
	var tween4 = get_tree().create_tween()
	tween1.tween_property(bottom_btns, "position", Vector2(0, 2080), 0.1).set_trans(Tween.TRANS_CUBIC)
	tween2.tween_property(correct_btn, "modulate", Color.html("ffffff00"), 0.1).set_trans(Tween.TRANS_CUBIC)
	tween3.tween_property(incorrect_btn, "modulate", Color.html("ffffff00"), 0.1).set_trans(Tween.TRANS_CUBIC)
	tween4.tween_property(close_btn, "modulate", Color.html("ff292900"), 0.1).set_trans(Tween.TRANS_CUBIC)


func _on_cancel_pressed() -> void:
	stop_warning_panel.visible = false




func _on_get_1_pressed() -> void:
	pass

func _on_get_2_pressed() -> void:
	pass

func _on_get_3_pressed() -> void:
	pass

func _on_get_4_pressed() -> void:
	pass

func _on_get_5_pressed() -> void:
	pass


func _on_language_pressed() -> void:
	selecting_language.visible = true
	bottom_btns.visible = false



func _on_home_pressed() -> void:
	main.visible = true
	profile.visible = false
	more.visible = false
	
	var tween = get_tree().create_tween()
	if TranslationServer.get_locale() == "ar":
		tween.tween_property(selector, "position", marker_2d_3.position, 0.15).set_trans(Tween.TRANS_CUBIC)
	else:
		tween.tween_property(selector, "position", marker_2d.position, 0.15).set_trans(Tween.TRANS_CUBIC)

func _on_profile_pressed() -> void:
	main.visible = false
	profile.visible = true
	more.visible = false
	
	var tween = get_tree().create_tween()
	tween.tween_property(selector, "position", marker_2d_2.position, 0.15).set_trans(Tween.TRANS_CUBIC)

func _on_more_pressed() -> void:
	main.visible = false
	profile.visible = false
	more.visible = true
	
	var tween = get_tree().create_tween()
	if TranslationServer.get_locale() == "ar":
		tween.tween_property(selector, "position", marker_2d.position, 0.15).set_trans(Tween.TRANS_CUBIC)
	else:
		tween.tween_property(selector, "position", marker_2d_3.position, 0.15).set_trans(Tween.TRANS_CUBIC)


func _on_timer_timeout() -> void:
	totalTimeInApp += 1
	
	total_time_label.text = str(totalTimeInApp)
	timer.start()
