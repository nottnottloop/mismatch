extends Label

var finishedText = ""
var subtitles = $CanvasLayer/HSplitContainer/textBox1/Panel/MarginContainer/Subtitles
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var idx = 0
var lastLetter = Time.get_ticks_msec()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if text != finishedText and Time.get_ticks_msec()-lastLetter> 100 :
		if finishedText[idx]  in ",.":
			lastLetter = Time.get_ticks_msec()+100

		else:
			lastLetter = Time.get_ticks_msec()
		text += finishedText[idx]
		idx += 1


func setLine(ttext):
	text = ""
	idx = 0
	finishedText = ttext
