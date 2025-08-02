#---------- Soda Audio Manager ver 1.0 MIT liscense - 2024 - Alexsander Oliveira de Almeida ----------
@tool
extends EditorPlugin

# This is autoload propreties for plugin.
const AUTOLOAD_NAME = "SodaAudioManager"
const  AUTOLOAD_PATH = "res://addons/SodaAudioManager/Scenes/soda_audio_manager.scn"

# ----------------------------------------------------------------------------------------- 
func _enter_tree():
	#Add scene AudioManager to Autoload
	add_autoload_singleton(AUTOLOAD_NAME, AUTOLOAD_PATH)


func _exit_tree():
	#Remove scene AudioManager to Autoload
	remove_autoload_singleton(AUTOLOAD_NAME)
# -----------------------------------------------------------------------------------------

#---------- Soda Audio Manager ver 1.0 MIT liscense - 2024 - Alexsander Oliveira de Almeida ----------
