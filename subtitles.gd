extends RichTextLabel

var finishedText = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

var idx = 0
var lastLetter = Time.get_ticks_msec()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if idx <= len(finishedText)-1 and Time.get_ticks_msec()-lastLetter> 50/Engine.time_scale and finishedText:
		if finishedText[idx]  in ",.-":
			lastLetter = Time.get_ticks_msec()+120/Engine.time_scale

		else:
			lastLetter = Time.get_ticks_msec()
		if "Wif" in finishedText or "Old Lady" in finishedText:
			$"../../../../../../talkingFemale".play()
		elif "Baby" in finishedText:
			$"../../../../../../talkingMale".pitch_scale = 0.8
			$"../../../../../../talkingMale".play()
		elif "Builder" in finishedText:
			$"../../../../../../talkingMale".pitch_scale = 0.8
			$"../../../../../../talkingMale".play()
		elif "Alien" in finishedText:
			$"../../../../../../talkingMale".pitch_scale = 1.4
			$"../../../../../../talkingMale".play()
		else:
			$"../../../../../../talkingMale".pitch_scale = 1.13
			$"../../../../../../talkingMale".play()

		text = "[shake  rate=4 level=8]"+finishedText.substr(0,idx+1)+"[/shake]"
		idx += 1

func setLine(ttext: String):
	text = ""
	if ":" in ttext:
		idx = ttext.find(":")
	else:
		idx = 0
	finishedText = ttext
