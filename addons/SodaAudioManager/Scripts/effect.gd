extends Node
@onready var samNode: Node = $"..";
@onready var playerMusic: AudioStreamPlayer = $"../player_music";


func fade_in_effect(volume: float, fade_duration: float) -> void:
	#FADE_IN
	var tween = create_tween();
	playerMusic.volume_db = -50;
	playerMusic.play();;
	tween.tween_property(playerMusic, "volume_db", volume, fade_duration);
	await tween.finished;
	emit_signal("fadein_finish");
	emit_signal("music_start");
	tween = null;
	
func fade_out_effect(fade_duration: float) -> void:
	#FADE_OUT
	var tween = create_tween();
	tween.tween_property(playerMusic, "volume_db", -50, fade_duration);
	await tween.finished;
	playerMusic.stop();
	samNode.emit_signal("music_finish");
	tween = null;
