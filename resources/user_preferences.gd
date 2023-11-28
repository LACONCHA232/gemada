class_name UserPreferences extends Resource

@export_range(0, 1, 0.05) var music_audio_level: float = 1.0
@export_range(0, 1, 0.05) var sfx_audio_level: float = 1.0
@export var input_language: int



func save() -> void: 
	ResourceSaver.save(self, "res://user_preferences.tres")
	
static func read_or_create() -> UserPreferences:
	var res: UserPreferences = load("res://user_preferences.tres") as UserPreferences
	if !res:
		res = UserPreferences.new()
	return res
	

