#---------- Soda Audio Manager ver 0.5 MIT liscense - 2024 - Alexsander Oliveira de Almeida ----------
extends Node

# ----------- DECLARATIONS -----------
#Variables for volume sound system -----------
var musicVolume: float = 0.0 #Volume in Db for music
var sfxInterfaceVolume: float = 0.0 #Volume in Db for interface SFX
var sfxPlayerVolume: float = 0.0 #Volume in Db for player SFX
var sfxAmbientVolume: float = 0.0 #Volume in Db for ambient sounds.

#Variables for last sound(MUsic and ambience)
var musicIsLoop: bool = false
var ambientIsLoop: bool = false
var lastMusic: String
var lastAmbient: String

#Referencing AudioStreamPlayer Nodes ----------
@export var sndMusic: AudioStreamPlayer
@export var sndPlayer: AudioStreamPlayer
@export var sndInterface: AudioStreamPlayer
@export var sndAmbient: AudioStreamPlayer

# ---------- GODOT FUNC ----------
func _process(delta: float) -> void:
	#Here, it is defined that the volume of the nodes that play the audio will have the same value
	#as the declared volume variables, so by changing these variables, the volume of the respective
	#sounds will also change.
	sndMusic.volume_db = musicVolume
	sndInterface.volume_db = sfxInterfaceVolume
	sndPlayer.volume_db = sfxPlayerVolume
	sndAmbient.volume_db = sfxAmbientVolume
	
# ----------- SODA FUNCTIONS -----------
#Music manager ------
func play_music(sndPath: String, isLoop: bool) -> void:
	var snd = load(sndPath)
	musicIsLoop = isLoop
	if isLoop == true:
		lastMusic = sndPath
	else:
		pass
	sndMusic.stream = snd
	sndMusic.play()
	
func pause_music() -> void:
	sndMusic.stream_paused = true

func unpause_music() -> void:
	sndMusic.stream_paused = false
	
func stop_music() -> void:
	sndMusic.stop()
	sndMusic.stream = null
	
#Ambient sounds manager -----
func play_ambient_sound(sndPath, isLoop) -> void:
	var snd = load(sndPath)
	if isLoop == true:
		lastAmbient = sndPath
	else:
		pass
	sndAmbient.stream =  snd
	sndAmbient.play()
	
func stop_ambient_sound() -> void:
	sndAmbient.stop()
	sndAmbient.stream = null
	
#Player SFX Manager -----
func play_snd_player(sndPath) -> void:
	var snd = load(sndPath)
	sndPlayer.stream = snd
	sndPlayer.play()
	
#Interface SFX Manager -----
func play_snd_interface(sndPath) -> void:
	var snd = load(sndPath)
	sndInterface.stream = snd
	sndInterface.play()
	
# ---------- SIGNALS RECEIVED FROM THE AUDIO NODES ----------
func _on_snd_music_finished() -> void:
	if musicIsLoop == true:
		play_music(lastMusic, true)
	else:
		pass

func _on_snd_ambient_finished() -> void:
	if ambientIsLoop == true:
		play_ambient_sound(lastAmbient, true)
	else:
		pass

#---------- Soda Audio Manager ver 0.5 MIT liscense - 2024 - Alexsander Oliveira de Almeida ----------
