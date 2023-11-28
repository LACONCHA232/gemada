extends Control


#Escucha el evento del boton "inicar partidas" para que cuando sea precionado ejecute el juego
func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://escenas/nivel_1.tscn")

#Escucha el evento del boton "personaje" para que cuando sea precionado ejecute la ventana personaje
func _on_pressed():
	get_tree().change_scene_to_file("res://escenas/interfaz-personaje.tscn")

#Escucha el evento del boton "ajustes" para que cuando sea precionado ejecute la ventana ajustes
func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://escenas/interfazAjustes.tscn")

#Esta funcion le da la funcionalidad al boton de salir
func _on_close_button_pressed():
	get_tree().change_scene_to_file("res://escenas/interfaz-main.tscn")


#el button se refiere al boton de jugar
func _on_button_pressed():
	get_tree().change_scene_to_file("res://escenas/nivel_1.tscn")
	
	
#variables para guardar las preferencias del usuario
@onready var option_button_langguage = %OptionButtonLangguage
@onready var h_slider_music = %HSliderMusic
@onready var h_slider_2_effx = %HSlider2Effx

var user_prefs: UserPreferences

func _ready():
	user_prefs = UserPreferences.read_or_create()
	if h_slider_music:
		h_slider_music.value = user_prefs.music_audio_level
	if h_slider_2_effx:
		h_slider_2_effx.value = user_prefs.sfx_audio_level



#boton para seleccionar el idoma del juego
func _on_option_button_langguage_item_selected(index):
	match index:
		0:
			TranslationServer.set_locale("es")
		1:
			TranslationServer.set_locale("en")
		2:
			TranslationServer.set_locale("ja")
		3:
			TranslationServer.set_locale("zh")
			
	if user_prefs:
		user_prefs.input_language = index
		user_prefs.save()

#afecta a los sliders del sonido
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
