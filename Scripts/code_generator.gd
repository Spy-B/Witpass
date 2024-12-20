extends Node

var referralCodeSavePath: String = "user://referral_code.wp"
var encrypt_pass: String = "45345"


func _ready() -> void:
	#print(generate_random_code_with_inserted_subcode())
	
	Global.load_resource()
	if Global.load_app().referral_code == "":
		Global.save_app("referral_code", generate_referral_code())

func generate_referral_code(length = 10):
	var num = "0123456789"
	var random_code = ""
	
	for i in range(length):
		random_code += num[randi() % num.length()]
	
	return random_code #"%" + random_code + "%"

func generate_random_code_with_inserted_subcode(length = 100, subcode = Global.load_app().referral_code, email = Global.load_app().email, phoneNumber = Global.load_app().phone_number) -> String:
	var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzАаБбВвГгДдЕеЁёЖжЗзИиЙйКкЛлМмНнОоПпРрСсТтУуФфХхЦцЧчШшЩщЪъЫыЬьЭэЮюЯя0123456789!@$%&*_+-=?;|"
	var random_code = "%" + "" + "%"
	
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
	
	var full_code = random_code.substr(0, insert_position) + subcode + phoneNumber + email + random_code.substr(insert_position)
	
	return full_code

#func save_referral_code(file_path: String):
	#var referral_code_file = FileAccess.open_encrypted_with_pass(file_path, FileAccess.WRITE, encrypt_pass)
	#referral_code_file.store_var(generate_referral_code())
	#referral_code_file.close()
#
#func load_referral_code(file_path: String):
	#var referral_code_file = FileAccess.open_encrypted_with_pass(file_path, FileAccess.READ, encrypt_pass)
	#if referral_code_file == null:
		#save_referral_code(file_path)
		#return
	#referral_code_file.close()
	#
	#return referral_code_file.get_var(true)
