extends Node

func play(path: String, start: float = 0, length: float = 0):
	var audio_player = AudioStreamPlayer.new()
	Utils.game.add_child(audio_player)
	audio_player.stream = load(path)
	audio_player.play(start)
	if length == 0:
		await audio_player.finished
	else:
		await get_tree().create_timer(length).timeout
	if is_instance_valid(audio_player) == true:
		audio_player.stop()
