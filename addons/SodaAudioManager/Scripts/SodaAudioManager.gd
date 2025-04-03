#---------- Soda Audio Manager ver 1.0 MIT liscense - Alexsander Oliveira de Almeida ----------
extends Node
# ----------- DECLARATIONS -----------
#Variables
var currentMusic: AudioStream = null;
#Constants
enum EFFECTS{FADE_IN, FADE_OUT};

#Referencing AudioStreamPlayer Nodes ----------
@onready var playerMusic: AudioStreamPlayer = $player_music;
@onready var playerInterfaceSfx: AudioStreamPlayer = $player_sfx_interface;
@onready var playerSfxContainer: Node = $player_sfx_container;
@onready var effectsNode: Node =  $effectsNode;

#Create Signals
signal music_start;
signal music_finish;
signal interface_sfx_finish;
signal sfx_finish;
signal fadein_finish;

# ---------- GODOT FUNC ----------
func _ready() -> void:
	playerMusic.connect("finished", current_null);
func _process(delta: float) -> void:
	pass
# ----------- SODA FUNCTIONS -----------
#Music manager ------
func play_music(sound_path: String, volume: float,loop: bool = false, fade_in = false, fade_duration: float = 2.0) -> void:
	if sound_path != "" and sound_path is String:
		var sound = load(sound_path);
		#Avoid playing the same song or playing something null
		if !sound or currentMusic == sound:
			return
		currentMusic = sound;
		playerMusic.stream = sound;
		playerMusic.volume_db = volume;
		#Set loop
		if sound is AudioStreamOggVorbis or sound is AudioStreamMP3:
			sound.loop = loop;
		#Use "fade_in" effect or play music immediately
		if fade_in:
			effectsNode.fade_in_effect(volume, fade_duration);
		else:
			playerMusic.play();
			emit_signal("music_start");
	else:
		print("--SAM-- ERROR: THE MUSIC FILE PATH IS INVALID!");

func pause_music() -> void:
	playerMusic.stream_paused = !playerMusic.stream_paused;

#Interface SFX Manager -----
func play_interface_sfx(sound_path: String, volume: float) -> void:
	if sound_path != "" and sound_path is String:
		#Load the file and play the sound.
		var sound = load(sound_path);
		if !sound:
			return;
		playerInterfaceSfx.stream = sound;
		playerInterfaceSfx.volume_db = volume;
		playerInterfaceSfx.play();
		#When finished, empty the local variables.
		await playerInterfaceSfx.finished;
		playerInterfaceSfx.stop();
		emit_signal("interface_sfx_finish")
		playerInterfaceSfx.stream = null;
		sound = null;
	else:
		print("--SAM-- ERROR: THE MUSIC FILE PATH IS INVALID!");
	
#General Sfx manager -----
func play_sfx(sound_path, volume: float) -> void:
	#creates a StreamPlayer, Loads the file and
	#assigns it to the newly created StreamPlayer.
	#if the sound finished, destroy node
	if sound_path != "" and sound_path is String:
		var sound = load(sound_path);
		if !sound:
			return;
		var player_sfx = AudioStreamPlayer.new();
		player_sfx.stream = sound;
		player_sfx. volume_db = volume;
		playerSfxContainer.add_child(player_sfx);
		player_sfx.play();
		#Auto remove node
		await player_sfx.finished;
		emit_signal("sfx_finish");
		player_sfx.queue_free();
		
	else:
		print("--SAM-- ERROR: THE MUSIC FILE PATH IS INVALID!");

#General manager -----
func stop_music(fade_out: bool = false, fade_duration: float = 2.0) -> void:
	if fade_out:
		effectsNode.fade_out_effect(fade_duration);
	else:
		playerMusic.stop();
		emit_signal("music_finish");

func get_current_music():
	if !currentMusic:
		print("NOT CURRENT MUSIC")
	return currentMusic;

func current_null() -> void:
	currentMusic = null;
#---------- Soda Audio Manager ver 1.0 MIT liscense - Alexsander Oliveira de Almeida ----------
