extends Node

var item_data : Dictionary = {}
var data_file_path = "res://Data/Item Data.json"

func _ready():
	item_data = load_json_file(data_file_path)

func load_json_file(file_path : String):
	if FileAccess.file_exists(file_path):
		var data_file = FileAccess.open(file_path, FileAccess.READ)
		var parsed_result = JSON.parse_string(data_file.get_as_text())
		
		if parsed_result is Dictionary:
			return parsed_result
		else:
			push_error("Error reading JSON file.")
	
	else:
		push_error("File doesn't exist.")
