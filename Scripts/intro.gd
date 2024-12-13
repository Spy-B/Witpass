extends Control

@export_file("*.tscn") var loading_root_path
@export_file("*.tscn") var loading_signup_menu_path

var targeted_scene

func _ready() -> void:
	if Global.load_app() == null:
		Global.save_app()
	
	if Global.load_app().username != "" && (Global.load_app().email != "" || Global.load_app().phone_number != ""):
		targeted_scene = loading_root_path
	else:
		targeted_scene = loading_signup_menu_path
	
	ResourceLoader.load_threaded_request(targeted_scene)

func _process(_delta: float) -> void:
	if ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(targeted_scene))
