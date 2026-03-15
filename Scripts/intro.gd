extends Control

##Root Scene file path
@export var rootScenePath: PackedScene

##Signup Scene file path
@export var signupScenePath: PackedScene

##Questions Scene file path
@export var questionsFilePath: PackedScene

var targeted_scene

func _ready() -> void:
	if !Global.load_game():
		Global.save_game()
	
	if Global.load_game().username != "" && (Global.load_game().email != "" || Global.load_game().phone_number != ""):
		Global.signUpDone = true
		targeted_scene = rootScenePath.resource_path
	else:
		Global.signUpDone = false
		targeted_scene = signupScenePath.resource_path
	
	ResourceLoader.load_threaded_request(targeted_scene)

func _process(_delta: float) -> void:
	if ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(targeted_scene))
		print("Resource Loaded => ", "'", targeted_scene, "'")
		print("Resource Loaded => ", "'", questionsFilePath.resource_path, "'")
