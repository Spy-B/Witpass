extends Node

var saveFilePath: String = "user://witpass.ww"
var saveFilePass: String = "23439"

var save_dic: Dictionary = {
	"language": 1,
	"username": "",
	"phone_number": "",
	"email": "",
	"referral_code": "",
	"friend_referral_code": "",
	"account_level": 1,
	"tickets": 0,
	"total_time_in_app": 0,
	"passed_questions": [],
	"current_test": 1,
	"tests_passed": [],
	"questions_answered_correctly": 0
	}

var appStarted: bool = false
var signUpDone: bool = false
var QuitPressed: bool = false

var click_again: String

func _ready() -> void:
	print(load_game())
	
	if Engine.has_singleton("ToastPlugin"):
		var toast_plugin = Engine.get_singleton("ToastPlugin")
		toast_plugin.connect("toast_shown", Callable(self, "_on_toast_shown"))
		toast_plugin.connect("toast_hidden", Callable(self, "_on_toast_hidden"))
		toast_plugin.connect("toast_callback", Callable(self, "_on_toast_callback"))
	else:
		print("[TOAST_PLUGIN] ToastPlugin not found")

func _on_toast_hidden():
	QuitPressed = false


func save_game(_key = null, _value = null):
	if _key != null && _value != null:
		save_dic[_key] = _value
	var save_file = FileAccess.open_encrypted_with_pass(saveFilePath, FileAccess.WRITE, saveFilePass)
	var json_string = JSON.stringify(save_dic)
	save_file.store_line(json_string)
	
	save_file.close()

func load_game():
	if !FileAccess.file_exists(saveFilePath):
		save_game()
	var load_file = FileAccess.open_encrypted_with_pass(saveFilePath, FileAccess.READ, saveFilePass)
	
	while load_file.get_position() < load_file.get_length():
		var json = JSON.new()
		json.parse(load_file.get_line(), true)
		return json.get_data()
	
	#save_dic = 
	
	load_file.close()


func load_resource() -> void:
	if signUpDone:
		save_dic.language = load_game().language
	
	save_dic.username = load_game().username
	save_dic.phone_number = load_game().phone_number
	save_dic.email = load_game().email
	
	if load_game().referral_code == "":
		pass
	else:
		save_dic.referral_code = load_game().referral_code
	
	save_dic.friend_referral_code = load_game().friend_referral_code
	save_dic.passed_questions = load_game().passed_questions
	save_dic.current_test = load_game().current_test
	save_dic.tests_passed = load_game().tests_passed
