extends Node

var GeneratedFilePath: String = "user://GeneratedFile.txt"

func _ready() -> void:
	#TYPE HERE THE TEXT YOU WANNA GENERATE
	
	var output = ""
	for i in range(1, 3720):
		#output += '\t' + str(i) + '\n'
		#output += '\t\t' + str(i) + '\n'
		#output += '\t\t\t' + str(i) + '\n'
		pass
	
	var save_file = FileAccess.open(GeneratedFilePath, FileAccess.WRITE)
	if !output:
		print("The Output is Empty!")
	else:
		save_file.store_string(output)
