extends Timer

var timer : Timer
var day : int
var started : bool

func _ready() -> void:
	day = 1
	started = false
	timer = Timer.new()
	timer.wait_time = 300
	add_child(timer)
