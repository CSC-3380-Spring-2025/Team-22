extends RichTextLabel

var dayText : RichTextLabel
var time : int
var day : int
var mins : int
var secs : int

func _ready() -> void:
	dayText = get_node("DayCount")
	day = GlobalTimer.day
	dayText.text = str("Day ", day)
	GlobalTimer.timer.timeout.connect(_on_timer_timeout)
	if(GlobalTimer.started == false):
		GlobalTimer.timer.start()
		GlobalTimer.started = true

func _process(delta: float) -> void:
	time = GlobalTimer.timer.get_time_left()
	mins = time / 60
	time -= mins * 60
	secs = time
	text = "%02d:%02d" % [mins, secs]
	if Input.is_action_just_pressed("click"):
		get_tree().change_scene_to_file("res://Scenes/Battle.tscn");

func UpdateDay() -> void:
	GlobalTimer.day = GlobalTimer.day + 1
	day = GlobalTimer.day
	dayText.text = str("Day ", day)

func _on_timer_timeout():
	UpdateDay()
