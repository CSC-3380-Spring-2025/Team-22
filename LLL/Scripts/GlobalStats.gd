extends Node2D

var xp : int = 0
var level : int = 1

var attack : int = 5
var health : int = 20
var learnedStealth : bool = false
var learnedLick : bool = false
var learnedBurn : bool = false

var currentlyFighting : int = 1

func raiseXP(xpEarned: int) -> int:
	xp = xp + xpEarned
	if(xp >= 10):
		xp = xp % 10
		level = level + 1
		health = health + 3
		attack = attack + 1
		
		if(level == 2):
			learnedStealth = true;
		if(level == 3):
			learnedLick = true;
		if(level == 4):
			learnedBurn = true;
		return level
	else:
		return 0
