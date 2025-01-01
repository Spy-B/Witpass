extends Node

var questions_file_path: String = "res://Assets/JSON/Questions.json"
var answers_file_path: String = "res://Assets/JSON/Answers.json"

var questions: Dictionary = {}
var answers: Dictionary = {}

var selected_question: String
var chosen_question: int
var correctAnswer: bool
var passedQuestions: Array = []
var testQuestions: Array = []
var number_of_questions: int

var test_done = false

func _ready() -> void:
	load_questions()
	
	if Global.load_app().account_level == 1:
		number_of_questions = 10
	elif Global.load_app().account_level == 2:
		number_of_questions = 15
	elif Global.load_app().account_level == 3:
		number_of_questions = 30

func load_questions() -> void:
	var questionFile = FileAccess.open(questions_file_path, FileAccess.READ)
	var jsonQuestions = JSON.new()
	jsonQuestions.parse(questionFile.get_as_text(), true)
	questions = jsonQuestions.get_data()
	
	var answersFile = FileAccess.open(answers_file_path, FileAccess.READ)
	var jsonAnswers = JSON.new()
	jsonAnswers.parse(answersFile.get_as_text(), true)
	answers = jsonAnswers.get_data()

func questions_selector() -> void:
	randomize()
	chosen_question = randi_range(1, questions.size())
	
	if passedQuestions.size() == number_of_questions:
		test_done = true
		return
	else:
		selected_question = questions["q" + str(chosen_question)]
		passedQuestions.append(chosen_question)
		
		correctAnswer = answers["a" + str(chosen_question)]
	
	Global.load_resource()
	Global.save_app("passed_questions", passedQuestions)
