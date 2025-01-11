extends Control

##Root Scene file path
@export_file("*.tscn") var rootScenePath

##Signup Scene file path
@export_file("*.tscn") var signupScenePath

##Questions Scene file path
@export_file("*.tscn") var questionsFilePath

var targeted_scene

func _ready() -> void:
	if !Global.load_game():
		Global.save_game()
	
	if Global.load_game().username != "" && (Global.load_game().email != "" || Global.load_game().phone_number != ""):
		Global.signUpDone = true
		targeted_scene = rootScenePath
	else:
		Global.signUpDone = false
		targeted_scene = signupScenePath
	
	ResourceLoader.load_threaded_request(targeted_scene)

func _process(_delta: float) -> void:
	if ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(targeted_scene))
		print("Resource Loaded => ", "'", targeted_scene, "'")
		print("Resource Loaded => ", "'", questionsFilePath, "'")
