extends Node

var dead := false
var score := 0
var score_submitted = false
func _ready():
	print("Hello im starting")
	SilentWolf.configure({
	"api_key": "VrIVtP93OTaTXBEJ25oqXMQrzJXSlBF3teYRxMT9",
	"game_id": "FrogNinja1",
	"game_version" : "1.0.0",
	"log_level": 0})
	SilentWolf.configure_scores({
	"open_scene_on_close": "res://Main.tscn"
	})
	#SilentWolf.Scores.wipe_leaderboard()


func Start():
	dead = false
	score = 0
	score_submitted = false
	
func UpdateScore(value):
	if(dead):
		return
	score = value

func Dead():
	dead = true

func Send_Score(n):
	if(score_submitted == true):
		return
	score_submitted = true
	SilentWolf.Scores.save_score(n,score)
