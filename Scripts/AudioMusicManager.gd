extends Node

var num_players := 8
var bus := "Music"

var available: = []  # The available players.
var queue: = []  # The queue of sounds to play.


func _ready() -> void:
	# Create the pool of AudioStreamPlayer nodes.
	for i in num_players:
		var p := AudioStreamPlayer.new()
		add_child(p)
		available.append(p)
		p.finished.connect(_on_stream_finished.bind(p))
		p.bus = bus


func _on_stream_finished(stream: AudioStreamPlayer) -> void:
	# When finished playing a stream, make the player available again.
	available.append(stream)


func play(sound_path: String) -> void:
	queue.append(sound_path)


func _process(delta: float) -> void:
	# Play a queued sound if any players are available.
	if not queue.is_empty() and not available.is_empty():
		available[0].stream = load(queue.pop_front())
		available[0].play()
		available.pop_front()
