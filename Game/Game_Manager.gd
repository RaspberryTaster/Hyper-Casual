extends Node

var obstacle = preload("res://Obstacles/Spike_Head.tscn")
var time_elapsed = 0
var curDiffSpike := 0.0
var maxDiffSpike := 10

func _ready():
	ScoreManager.Start()
func spawn():
	var screenX = get_viewport().size.x;
	var spawnPoint = Vector2(randf_range(0,screenX),0)
	var spawnedObject = obstacle.instantiate()
	print(spawnedObject)
	spawnedObject.position = spawnPoint
	add_child(spawnedObject)

func _on_timer_timeout():
	spawn()

func _process(delta):
	$Timer.wait_time = Interpolation(1.2,0.8,curDiffSpike/maxDiffSpike)
	$Label.text = "Wall grabbing = " + str($Player.wall_grabbing)
	time_elapsed += delta
	ScoreManager.UpdateScore( int(time_elapsed))
	$Label3.text = "Score = " +str(ScoreManager.score)



func Interpolation(A,B,t):
	return A + (B - A) * t
	
func _on_difficulty_timer_timeout():
	if(curDiffSpike >= maxDiffSpike):return
	curDiffSpike+= curDiffSpike+1
