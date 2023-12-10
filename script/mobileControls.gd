extends CanvasLayer

@onready var menu_pause = $pause_menu
@onready var h_slider_music = %HSliderMusic
@onready var h_slider_2_effx = %HSlider2Effx

var user_prefs: UserPreferences

func _ready():
	menu_pause.visible = false


func _on_menu_button_pressed():
	menu_pause.visible = true
	get_tree().paused = true


var musicSlider = AudioServer.get_bus_index("music")
var sfxSlider = AudioServer.get_bus_index("sfx")

func _on_h_slider_music_value_changed(value):
	AudioServer.set_bus_volume_db(musicSlider, linear_to_db(value))
	if user_prefs:
		user_prefs.music_audio_level = value
		user_prefs.save()



func _on_h_slider_2_effx_value_changed(value):
	AudioServer.set_bus_volume_db(sfxSlider, linear_to_db(value))
	if user_prefs:
		user_prefs.sfx_audio_level = value
		user_prefs.save()



func _on_close_button_pressed():
	menu_pause.visible = false
	get_tree().paused = false


func _on_home_button_pressed():
	get_tree().change_scene_to_file("res://escenas/interfaz-main.tscn")
	get_tree().paused = false
	
