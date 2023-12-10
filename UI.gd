extends CanvasLayer

var chas = 0

func _ready():
	
	#var chaskaNode = get_tree().get_root().find_node("chaska",true,false)
	#chaskaNode.connect("ChaskaCollected",self,"handleChaskaCollected")
	
	$ChaskaCollectedText.text = str(chas)

func handleChaskaCollected():
	print("chaska Collected")
	chas+=1
	$ChaskaCollectedText.text = str(chas)
