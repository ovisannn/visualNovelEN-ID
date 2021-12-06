extends Node2D

func _ready():
	var savedData = load("user://saveVisualNovel/playerData.tres")
	
	if savedData.gender == 'male':
		#$chara/female.visible = false
		if savedData.scoreMinigames1 < 3 or savedData.scoreMinigames2 < 60 or savedData.scoreMinigames3 < 60:
			$chara/MaleSad.visible = true
		else:				
			$chara/MaleSad.visible = false
			$chara/male.visible = true		
	elif savedData.gender =='female':
		#$chara/male.visible = false		
		if savedData.scoreMinigames1 < 3 or savedData.scoreMinigames2 < 60 or savedData.scoreMinigames3 < 60:
			$chara/FemaleSad.visible = true
		else:				
			$chara/FemaleSad.visible = false
			$chara/female.visible = true
		
	$chara/Label.text = savedData.playerName
	$score1/score.text = String(savedData.scoreMinigames1)+'/7'
	$score2/score.text = String(savedData.scoreMinigames2)+'/100'
	$score3/score.text = String(savedData.scoreMinigames3)+'/100'
	
	if savedData.scoreMinigames1 < 3:
		$score1/red.visible = true
		$score1/green.visible = false
	if savedData.scoreMinigames2 < 60:
		$score2/red.visible = true
		$score2/green.visible = false
	if savedData.scoreMinigames3 < 60:
		$score3/red.visible = true
		$score3/green.visible = false
		

