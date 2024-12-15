extends Control

@export_file("*.tscn") var rootScenePath
@export_file("*.tscn") var signupScenePath

@export_file("*.tscn") var questionsFilePath

var targeted_scene

func _ready() -> void:
	if Global.load_app() == null:
		Global.save_app()
	
	if Global.load_app().username != "" && (Global.load_app().email != "" || Global.load_app().phone_number != ""):
		Global.signUpDone = true
		targeted_scene = rootScenePath
	else:
		Global.signUpDone = false
		targeted_scene = signupScenePath
	
	ResourceLoader.load_threaded_request(questionsFilePath)
	ResourceLoader.load_threaded_request(targeted_scene)

func _process(_delta: float) -> void:
	if ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(targeted_scene))
