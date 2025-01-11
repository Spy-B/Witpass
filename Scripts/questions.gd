extends Node

var questions_file_path: String = "res://Assets/JSON/Questions_1.json"
var answers_file_path: String = "res://Assets/JSON/Answers_1.json"

var questions: Dictionary = {}
var answers: Dictionary = {}

#var lvl_1_tests: int = 18
#var lvl_2_tests: int = 44
#var lvl_3_tests: int = 

var selected_question: String
var chosen_question: int
var correctAnswer: bool
var passedQuestions: Array = []
var currentTest: int
var testsPassed: Array = []
var number_of_questions: int

var test_done = false

func _ready() -> void:
	#Global.load_resource()
	#Global.save_game("passed_questions", [])
	
	lvl()
	load_questions()

func load_questions() -> void:
	var questionFile = FileAccess.open(questions_file_path, FileAccess.READ)
	var jsonQuestions = JSON.new()
	jsonQuestions.parse(questionFile.get_as_text(), true)
	questions = jsonQuestions.get_data()
	
	var answersFile = FileAccess.open(answers_file_path, FileAccess.READ)
	var jsonAnswers = JSON.new()
	jsonAnswers.parse(answersFile.get_as_text(), true)
	answers = jsonAnswers.get_data()
	
	#print(Global.load_game().passed_questions.front())

func questions_selector() -> void:
	randomize()
	chosen_question = randi_range(1, questions.size())
	
	if passedQuestions.size() >= number_of_questions:
		testsPassed.append(Global.load_game().current_test)
		test_done = true
		return
	else:
		if !chosen_question in passedQuestions:
			print("Done! -> Pass the Question")
			selected_question = questions["q" + str(chosen_question)]
			passedQuestions.append(chosen_question)
			
			correctAnswer = answers["a" + str(chosen_question)]
		else:
			print("Repeated! -> Run Again")
			questions_selector()


func lvl():
	if Global.load_game().passed_questions.size() >= 270:
		Global.save_game("account_level", 2)
	elif Global.load_game().passed_questions.size() >= 528:
		Global.save_game("account_level", 3)
	
	
	match Global.load_game().account_level:
		1:
			number_of_questions = 15
			#questions_file_path = "res://Assets/JSON/Questions_1.json"
			#answers_file_path = "res://Assets/JSON/Answers_1.json"
		2:
			number_of_questions = 12
			#questions_file_path = "res://Assets/JSON/Questions_2.json"
			#answers_file_path = "res://Assets/JSON/Answers_2.json"
		3:
			number_of_questions = 10
			#questions_file_path = "res://Assets/JSON/Questions_3.json"
			#answers_file_path = "res://Assets/JSON/Answers_3.json"
