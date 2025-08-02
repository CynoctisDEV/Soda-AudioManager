#---------- Soda Audio Manager ver 1.1 MIT liscense - Alexsander O. de Almeida(CyNoctis) ----------
extends Node

# ---------- DECLARATIONS ----------
#General Var
var musicVolume: float = 0.0
var sfxUiVolume: float = 0.0
var sfxVolume: float = 0.0
var musicMuteVolume: float = -50.0
var currentMusic

#Constants

#Node Reference
@onready var musicPlayer: AudioStreamPlayer = $music_player
@onready var containerSfx: Node = $container_sfx
@onready var effectsManager: Node = $effects_manager

#Signals
signal fade_in_ended
signal fade_out_ended
signal music_stoped
signal music_started

# ---------- GODOT NATIVE FUNCTIONS ----------
func _ready() -> void:
	pass

# ---------- MY FUNCTIONS ----------
#Music functions
func play_music(soundPath: String, loop: bool, fade: bool = true, fade_duration: float = 1.0) -> void:
	if soundPath == "":
		push_error("ERROR: The path to the music file cannot be an empty string.")
		return
		
	var sound = load(soundPath)
	if !sound:
		push_error("ERROR: The music load is falied. Please verify the path to file.")
		return
	if sound is AudioStreamOggVorbis or sound is AudioStreamMP3:
		sound.loop = loop;
	else:
		push_warning("Looping is only available in .ogg and .mp3 files. This song will not loop after it finishes playing.")
	
	if currentMusic != sound:
		currentMusic = sound
		musicPlayer.stream = sound
		match fade:
			true:
				musicPlayer.volume_db = musicMuteVolume
				effectsManager.fade_in(fade_duration)
			false:
				musicPlayer.volume_db = musicVolume
				musicPlayer.play()
				emit_signal("music_started")
	else:
		push_warning("The selected song is already playing, nothing will be changed.")
		return
	
func pause_play_music() -> void:
	musicPlayer.stream_paused = !musicPlayer.stream_paused
	
func stop_music(fade: bool = true, fade_duration: float = 1.0) -> void:
	match  fade:
		true:
			effectsManager.fade_out(fade_duration)
		false:
			musicPlayer.stop()
			emit_signal("music_stoped")
			currentMusic = null
	
#SFX functions
func play_sfx(soundPath: String) -> void:
	if soundPath == "":
		push_error("ERROR: The path to the sound sfx file cannot be an empty string.")
		return
		
	var sound = load(soundPath)
	if !sound:
		push_error("ERROR: The sound sfx load is falied. Please verify the path to file.")
		return
		
	var sfx: SodaSFX = SodaSFX.new()
	containerSfx.add_child(sfx)
	sfx.currentType = sfx.TYPES.GENERAl
	sfx.stream = sound
	sfx.volume_db = sfxVolume
	sfx.play()
		
func play_ui_sfx(soundPath: String) -> void:
	if soundPath == "":
		push_error("ERROR: The path to the sound sfx file cannot be an empty string.")
		return
		
	var sound = load(soundPath)
	if !sound:
		push_error("ERROR: The sound sfx load is falied. Please verify the path to file.")
		return
		
	var sfx: SodaSFX = SodaSFX.new()
	containerSfx.add_child(sfx)
	sfx.currentType = sfx.TYPES.UI
	sfx.stream = sound
	sfx.volume_db = sfxUiVolume
	sfx.play()
	
#Update pripriets
func update_volume(musicVolumeGlobal: float, sfxUiVolumeGlobal: float, sfxVolumeGlobal: float) -> void:
	musicVolume = musicVolumeGlobal
	sfxUiVolume = sfxUiVolumeGlobal
	sfxVolume = sfxVolumeGlobal
	
	musicPlayer.volume_db = musicVolume
	var sfxNodes = containerSfx.get_children()
	if !sfxNodes:
		return
	for i in sfxNodes:
		i as SodaSFX
		if i.currentType == i.TYPES.UI:
			i.volume_db = sfxUiVolume
		else:
			i.volume_db = sfxVolume
			
	sfxNodes = null
		


# ---------- SIGNALS ----------

#---------- Soda Audio Manager ver 1.1 MIT liscense - Alexsander O. de Almeida(CyNoctis) ----------
