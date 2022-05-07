extends Control

onready var GenButt = $GenerateButton

var length: int = 0
var genwant: int = 0
var gencount: int = 0 

var password = ""

var chars = ['A','B','C','D','E','F','G','H','I','J','K','L','M',
'N','O','P','Q','R','S','T','U','V','W','X','Y','Z', 
'&','$', '!','#','@']

func _ready():
	GenButt.connect("pressed", self, "_on_generate_pressed")
	
	
func _on_generate_pressed():
	$Passwords.text = ""
	generate(length, genwant)

func _on_Amount_text_changed(new_text):
	genwant = int(new_text)
	
func _on_Length_text_changed(new_text):
	length =  int(new_text)
	
func generate(length:int, amount:int):
	# while gencount is lower than getwant
	while gencount < amount:
		randomize()
		password = ""
		while password.length() < length:
			var select = randi() % chars.size()
			var UL = randi() % 2 + 1
			if UL == 1:
				password += chars[select].to_upper()
			else:
				password += chars[select].to_lower()
		$Passwords.add_text(password)
		$Passwords.newline()
		$Passwords.newline()	
		gencount += 1
	gencount = 0
	






