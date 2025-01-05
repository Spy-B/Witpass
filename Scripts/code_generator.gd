extends Node

var referralCodeSavePath: String = "user://referral_code.wp"
var encrypt_pass: String = "45345"


func _ready() -> void:
	Global.load_resource()
	if Global.load_game().referral_code == "":
		Global.save_game("referral_code", generate_referral_code())

func generate_referral_code(length = 10):
	var num = "0123456789"
	var random_code = ""
	
	for i in range(length):
		random_code += num[randi() % num.length()]
	
	return random_code

func generate_random_code_with_inserted_subcode(length = 100, subcode = Global.load_game().referral_code, email = Global.load_game().email, phoneNumber = Global.load_game().phone_number) -> String:
	var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzАаБбВвГгДдЕеЁёЖжЗзИиЙйКкЛлМмНнОоПпРрСсТтУуФфХхЦцЧчШшЩщЪъЫыЬьЭэЮюЯя0123456789!@$%&*_+-=?;|"
	var random_code = ""
	
	if phoneNumber != "":
		for i in range(length - (subcode + phoneNumber).length()):
			random_code += chars[randi() % chars.length()]
	elif email != "":
		for i in range(length - (subcode + email).length()):
			random_code += chars[randi() % chars.length()]
	
	var insert_position
	
	if phoneNumber != "":
		insert_position = randi() % (length - (subcode + phoneNumber).length())
	elif email != "":
		insert_position = randi() % (length - (subcode + email).length())
	
	var full_code = random_code.substr(0, insert_position) + ("%" + subcode + "%") + phoneNumber + email + random_code.substr(insert_position)
	
	return full_code
