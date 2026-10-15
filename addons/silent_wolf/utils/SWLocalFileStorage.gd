extends Node

const SWLogger = preload("res://addons/silent_wolf/utils/SWLogger.gd") 

# Retrieves data stored as JSON in local storage
# example path: "user://swsession.save"

# store lookup (not logged in player name) and validator in local file
static func save_data(path: String, data: Dictionary, debug_message: String='Saving data to file in local storage: ') -> bool:
	var save_success = false
	# SECURITY: serialize as JSON (matches get_data) and never log the raw
	# contents — this file holds session credentials (lookup/validator).
	var file = FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		SWLogger.error("Failed to open file for writing: " + str(path))
		return false
	file.store_string(JSON.stringify(data))
	save_success = true
	SWLogger.debug(debug_message + "[redacted]")
	return save_success


static func remove_data(path: String, debug_message: String='Removing data from file in local storage: ') -> bool:
	var delete_success = false
	if FileAccess.file_exists(path):
		DirAccess.remove_absolute(path)
		delete_success = not FileAccess.file_exists(path)
	SWLogger.debug(debug_message)
	return delete_success


static func does_file_exist(path: String) -> bool:
	return FileAccess.file_exists(path)


static func get_data(path: String) -> Dictionary:
	var content = {}
	print("path: " + str(path))
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		var text_content = file.get_as_text()
		if text_content == null or text_content == '' or text_content.length() == 0:
			SWLogger.debug("Empty file in local storage at " + str(path))
		else:
			var data = JSON.parse_string(text_content)
			if typeof(data) == TYPE_DICTIONARY:
				content = data
			else:
				SWLogger.debug("Invalid data in local storage at " + str(path))
	else:
		SWLogger.debug("Could not find any data at: " + str(path))
	return content
