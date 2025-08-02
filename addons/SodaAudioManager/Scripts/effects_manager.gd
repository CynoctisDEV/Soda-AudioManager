#---------- Soda Audio Manager ver 1.1 MIT liscense - Alexsander O. de Almeida(CyNoctis) ----------
extends Node

# ---------- DECLARATIONS ----------
#General Var

#Constants

#Node Reference
@onready var rootAudioManager: Node = get_parent()
@onready var musicPlayer: AudioStreamPlayer = $"../music_player"

#Signals

# ---------- GODOT NATIVE FUNCTIONS ----------

# ---------- MY FUNCTIONS ----------
func fade_in(fade_duration):
	var tween = create_tween()
	musicPlayer.play()
	tween.tween_property(musicPlayer, "volume_db", rootAudioManager.musicVolume, fade_duration)
	await tween.finished
	rootAudioManager.emit_signal("fade_in_ended")
	rootAudioManager.emit_signal("music_started")
	tween = null
	
func fade_out(fade_duration):
	var tween = create_tween()
	tween.tween_property(musicPlayer, "volume_db", rootAudioManager.musicMuteVolume, fade_duration)
	await tween.finished
	musicPlayer.stop()
	rootAudioManager.emit_signal("fade_out_ended")
	rootAudioManager.emit_signal("music_stoped")
	tween = null
	rootAudioManager.currentMusic = null
	
# ---------- SIGNALS ----------

#---------- Soda Audio Manager ver 1.1 MIT liscense - Alexsander O. de Almeida(CyNoctis) ----------
