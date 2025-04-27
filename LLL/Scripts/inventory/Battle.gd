extends Node2D

# Defining stats
var laikaAttack : int = 5;
var laikaMaxHealth : int = 20 * laikaLevel;
var laikaHealth : int = laikaMaxHealth;
var laikaLevel : int = 1;
var laikaExp : int = 0;
var enemyLevel : int
var enemyAttack : int
var enemyHealth : int
var enemyMaxHealth : int
	
# Defining status effects
var poison : int = 0;
var acid : int = 0;
var screech : int = 0;
var sing : bool = false;
var stealth : bool = false;
var lick : bool = false;
var burned : bool = false;
var defending : bool = false;
var waiting : bool = true;
	
# Defining cooldowns
var biteCooldown : int = 0;
var howlCooldown : int = 0;
var stealthCooldown : int = 0;
var lickCooldown : int = 0;
var burnCooldown : int = 0;
	
# Defining learned moves (will change to plug in data from another scene)
var learnedStealth : bool = false;
var learnedLick : bool = false;
var learnedBurn : bool = false;

# Defining scene elements (buttons, sprites, and sound effects)
var Fight : MenuButton
var Defend : Button
var Items : MenuButton
var Flee : Button
var FightPopup : PopupMenu
var ItemsPopup : PopupMenu
var Text : RichTextLabel
var LaikaStats : RichTextLabel
var AlienStats : RichTextLabel
var TimeText : RichTextLabel
var LaikaSprite : Sprite2D
var EnemySprite : Sprite2D
var HealSound : AudioStreamPlayer
var DamageSound : AudioStreamPlayer

# Signal for clicking + timer
signal clicked
var canClick : bool
var time : int
var day : int
var mins : int
var secs : int

@export var inv: Inv
@export var stick : Item
@export var rock : Item
@export var metal : Item
@export var goo : Item

func _ready(): 
	LaikaSprite = get_node("LaikaBattle")
	EnemySprite = get_node("AlienBattle")
	
	day = GlobalTimer.day
	var rand : RandomNumberGenerator = RandomNumberGenerator.new()
	var levelDecider : int = 1
	if(day > 2):
		levelDecider = rand.randi_range(day, 20)
	print(levelDecider)
	if(levelDecider < 15):
		enemyLevel = 1
		var texture = load("res://Art+Font/type_1_alien.png")
		EnemySprite.texture = texture;
		enemyAttack = 4;
		enemyHealth = 10;
		enemyMaxHealth = 10;
	if(levelDecider >= 15):
		enemyLevel = 2
		var texture = load("res://Art+Font/type_2_alien.png")
		EnemySprite.texture = texture;
		enemyAttack = 10;
		enemyHealth = 40;
		enemyMaxHealth = 40;
	
	Fight = get_node("Fight")
	Defend = get_node("Defend")
	Items = get_node("Items")
	Flee = get_node("Flee")
	Text = get_node("Text")
	LaikaStats = get_node("LaikaStats")
	AlienStats = get_node("AlienStats")
	TimeText = get_node("Time")
	HealSound = get_node("HealSound")
	DamageSound = get_node("DamageSound")
	
	FightPopup = Fight.get_popup()
	ItemsPopup = Items.get_popup()
	FightPopup.id_pressed.connect(_Fight)
	ItemsPopup.id_pressed.connect(_Items)
	
	LaikaStats.text = (str(laikaHealth) + "/" + str(laikaMaxHealth) + " HP\n" + str(laikaAttack) + " ATK")
	AlienStats.text = (str(enemyHealth) + "/" + str(enemyMaxHealth) + " HP\n" + str(enemyAttack) + " ATK")
	
	if(learnedStealth == true):
		FightPopup.add_item("Stealth")
	if(learnedLick == true):
		FightPopup.add_item("Lick")
	if(learnedBurn == true):
		FightPopup.add_item("Burn")
		
	if inv.getCount(stick) > 0:
		ItemsPopup.add_item("Stick x" + str(inv.getCount(stick)), 0)
	if inv.getCount(rock) > 0:
		ItemsPopup.add_item("Rock x" + str(inv.getCount(rock)), 1)
	if inv.getCount(metal) > 0:
		ItemsPopup.add_item("Metal x" + str(inv.getCount(metal)), 2)
	if inv.getCount(goo) > 0:
		ItemsPopup.add_item("Goo x" + str(inv.getCount(goo)), 3)
	
	canClick = true

func _process(delta: float) -> void:
	time = GlobalTimer.timer.get_time_left()
	if(time <= 3):
		canClick = false
		Fight.disabled = true
		Defend.disabled = true
		Items.disabled = true
		Flee.disabled = true
		Text.text = "Out of time for today!"
	if(time <= 0):
		get_tree().change_scene_to_file("res://Scenes/Overworld.tscn");
	mins = time / 60
	time -= mins * 60
	secs = time
	TimeText.text = "%02d:%02d" % [mins, secs]
	
func _Fight(id: int) -> void:
	match id:
		0:
			if(sing == true):
				Text.text = ("Laika swings out and misses entirely!");
				burned = false;
			elif(screech > 0 && burned == true):
				Text.text = ("Laika weakly attacks the burnt enemy and deals " + str(laikaAttack) + " damage!");
				alienEffect("damage")
				enemyHealth = enemyHealth - laikaAttack;
				burned = false;
			elif(screech > 0):
				Text.text = ("Laika weakly attacks the enemy and deals " + str(laikaAttack/2) + " damage!");
				alienEffect("damage")
				enemyHealth = enemyHealth - (laikaAttack/2);
			elif(burned == true):
				Text.text = ("Laika attacks the burnt enemy and deals " + str(laikaAttack * 2) + " damage!");
				alienEffect("damage")
				enemyHealth = enemyHealth - (laikaAttack * 2);
				burned = false;
			else:
				Text.text = ("Laika attacks the enemy and deals " + str(laikaAttack) + " damage!");
				alienEffect("damage")
				enemyHealth = enemyHealth - laikaAttack;
			await clicked
			waiting = false;
			afterTurn();
		1:
			if(biteCooldown == 0):
				if(sing == true):
					Text.text = ("Laika swings out and misses entirely!");
					burned = false;
					waiting = false;
					await clicked
					afterTurn();
				else:
					Text.text = ("Laika bites the enemy, dealing " + str(laikaAttack/2) + " damage for the next few turns!");
					alienEffect("damage")
					enemyHealth = enemyHealth - laikaAttack/2;
					poison = 3;
					
					burned = false;
					biteCooldown = 2;
					waiting = false;
					await clicked
					afterTurn();
			else:
				Text.text = ("Bite's cooldown is at " + str(biteCooldown) + "!");
		2:
			if(howlCooldown == 0):
				if(sing == true):
					Text.text = ("Laika tries to howl but fails entirely!")
					burned = false;
					waiting = false;
					await clicked
					afterTurn();
				else:
					Text.text = ("Laika howls, healing herself for " + str(laikaAttack) + " health!");
					laikaEffect("heal")
					if (laikaHealth + laikaAttack <= laikaMaxHealth):
						laikaHealth = laikaHealth + laikaAttack;
					else:
						laikaHealth = laikaMaxHealth;
					
					burned = false;
					howlCooldown = 2;
					waiting = false;
					await clicked
					afterTurn();
			else:
				Text.text = ("Howl's cooldown is at " + str(howlCooldown) + "!");
		3:
			if(stealthCooldown == 0):
				if(sing == true):
					Text.text = ("Laika tries to step back, but fails!")
					burned = false;
					waiting = false;
					await clicked
					afterTurn();
				else:
					Text.text = ("Laika retreats into the darkness, avoiding anything that might hit her...");
					stealth = true;
					
					burned = false;
					stealthCooldown = 3;
					waiting = false;
					await clicked
					afterTurn();
			else:
				Text.text = ("Stealth's cooldown is at " + str(stealthCooldown) + "!");
		4:
			if(lickCooldown == 0):
				if(sing == true):
					Text.text = ("Laika tries to lick the enemy, but misses!");
					burned = false;
					waiting = false;
					await clicked
					afterTurn();
				else:
					Text.text = ("Laika licks the enemy, covering them in spit!");
					if(burned == true):
						Text.text = ("Mmm, cooked... Laika heals " + str(enemyHealth * 2) + " health and weakens the enemy's next attack!");
						laikaEffect("heal")
						if (laikaHealth + (enemyHealth * 2) <= laikaMaxHealth):
							laikaHealth = laikaHealth + (enemyHealth * 2);
						else:
							laikaHealth = laikaMaxHealth;
						burned = false;
					else:
						Text.text = ("Laika heals " + str(enemyHealth/2) + " health and weakens the enemy's next attack!");
						laikaEffect("heal")
						if (laikaHealth + (enemyHealth/2) <= laikaMaxHealth):
							laikaHealth = laikaHealth + (enemyHealth/2);
						else:
							laikaHealth = laikaMaxHealth;
					
					lick = true;
					lickCooldown = 3;
					waiting = false;
					await clicked
					afterTurn();
			else:
				Text.text = ("Lick's cooldown is at " + str(lickCooldown) + "!");
		5:
			if(burnCooldown == 0):
				if(sing == true):
					Text.text = ("Laika tries to set the enemy ablaze, but misses!");
					burned = false;
					waiting = false;
					await clicked
					afterTurn();
				else:
					Text.text = ("Laika releases gas from her oxygen tanks, igniting the very air itself!");
					Text.text = ("Intense fire burns the enemy, dealing " + str(laikaAttack) + " damage- and the burns enhance the effectivity of Laika's next move!");
					alienEffect("damage")
					enemyHealth = enemyHealth - laikaAttack;
					
					burned = true;
					burnCooldown = 5;
					waiting = false;
					await clicked
					afterTurn();
			else:
				Text.text = ("Burn's cooldown is at " + str(burnCooldown) + "!");

func _Defend() -> void:
	if(sing == true):
		Text.text = ("Laika tries to defend herself, but her stance isn't great!");
		waiting = false;
		await clicked
		afterTurn();
	else:
		Text.text = ("Laika stands ready for an attack!")
		defending = true;
		waiting = false;
		await clicked
		afterTurn();

func _Items(id: int) -> void:
	if(sing == true):
		id = -1;
	match id:
		-1:
			Text.text = ("Laika tries to use an item, but she can't reach her pockets!")
			await clicked
		0:
			Text.text = ("Laika throws out a stick, hitting the enemy for 5 damage!")
			alienEffect("damage")
			enemyHealth = enemyHealth - 5
			inv.remove(stick)
			if(inv.getCount(stick) > 0):
				ItemsPopup.set_item_text(ItemsPopup.get_item_index(0), "Stick x" + str(inv.getCount(stick)))
			else:
				ItemsPopup.remove_item(ItemsPopup.get_item_index(0))
			await clicked
		1:
			Text.text = ("Laika throws out a moon rock, hitting the enemy for 10 damage!")
			alienEffect("damage")
			enemyHealth = enemyHealth - 10
			inv.remove(rock)
			if(inv.getCount(rock) > 0):
				ItemsPopup.set_item_text(ItemsPopup.get_item_index(1), "Rock x" + str(inv.getCount(rock)))
			else:
				ItemsPopup.remove_item(ItemsPopup.get_item_index(1))
			await clicked
		2:
			Text.text = ("Laika hits the enemy with scrap metal, hitting the enemy for 15 damage!")
			alienEffect("damage")
			enemyHealth = enemyHealth - 15
			inv.remove(metal)
			if(inv.getCount(metal) > 0):
				ItemsPopup.set_item_text(ItemsPopup.get_item_index(2), "Metal x" + str(inv.getCount(metal)))
			else:
				ItemsPopup.remove_item(ItemsPopup.get_item_index(2))
			await clicked
		3:
			Text.text = ("Laika slathers the enemy in goo, weakening it for some time!")
			alienEffect("damage")
			# Needs to be implemented
			inv.remove(goo)
			if(inv.getCount(goo) > 0):
				ItemsPopup.set_item_text(ItemsPopup.get_item_index(3), "Goo x" + str(inv.getCount(goo)))
			else:
				ItemsPopup.remove_item(ItemsPopup.get_item_index(3))
			await clicked
		4:
			Text.text = ("Laika bites into a lunar lily, healing herself for 15 health!")
			laikaEffect("heal")
			if (laikaHealth + 15 <= laikaMaxHealth):
				laikaHealth = laikaHealth + 15
			else:
				laikaHealth = laikaMaxHealth
			await clicked
		5:
			Text.text = ("Laika uses the mesmerizing effects of the crystal to hypnotize the enemy!")
			alienEffect("damage")
			# Needs to be implemented
			await clicked
		6:
			Text.text = ("Laika fires the superpowered raygun, dealing a major " + str(laikaAttack * 3) + " damage!")
			alienEffect("damage")
			enemyHealth = enemyHealth - (laikaAttack * 3)
			await clicked

	waiting = false;
	afterTurn();

func _Flee() -> void:
	if(sing == true):
		Text.text = ("Laika tries to run, but her legs keep shaking!");
		waiting = false;
		await clicked
		afterTurn();
	else:
		get_tree().change_scene_to_file("res://Scenes/Overworld.tscn");
	
func afterTurn() -> void:
	if(waiting == false):	# If Laika's turn just ended, disables her ability to make another turn
		Fight.disabled = true
		Defend.disabled = true
		Items.disabled = true
		Flee.disabled = true
		
	if(poison == 3): # If poison already equals 3, just decrease it once
		poison = poison - 1
	elif(poison > 0 && waiting == false):	# If poison is greater than 0 and it's no longer Laika's turn, damages enemy
		Text.text = ("Additionally, Laika deals " + str(laikaAttack/2) + " extra damage to the enemy!");
		alienEffect("damage")
		enemyHealth = enemyHealth - (laikaAttack/2);
		poison = poison - 1
		await clicked
	if(acid == 3):	# If acid already equals 3, just decrease it once
		acid = acid - 1;
	elif(acid > 0 && waiting == false):	 # If acid is greater than 0 and it's no longer Laika's turn, damages Laika
		Text.text = ("Ow-! Laika receives " + str(enemyAttack/2) + " damage from excess acid!");
		laikaEffect("damage")
		laikaHealth = laikaHealth - (enemyAttack/2);
		acid = acid - 1;
		await clicked
	if(screech > 0 && waiting == false):	# If Laika's turn has passed, decrements screech until her debuff reaches 0
		screech = screech - 1;
	if(sing == true && waiting == false):	# If Laika's turn has passed, sets sing to false
		sing = false;
	
	# If it's Laika's turn, decrements any cooldowns she may have
	if(biteCooldown > 0 && waiting == true):
		biteCooldown = biteCooldown - 1;
	if(howlCooldown > 0 && waiting == true):
		howlCooldown = howlCooldown - 1;
	if(stealthCooldown > 0 && waiting == true):
		stealthCooldown = stealthCooldown - 1;
	if(lickCooldown > 0 && waiting == true):
		lickCooldown = lickCooldown - 1;
	if(burnCooldown > 0 && waiting == true):
		burnCooldown = burnCooldown - 1;
	
	# Sets both Laika and the alien stats to their current values
	LaikaStats.text = (str(laikaHealth) + "/" + str(laikaMaxHealth) + " HP\n" + str(laikaAttack) + " ATK");
	AlienStats.text = (str(enemyHealth) + "/" + str(enemyMaxHealth) + " HP\n" + str(enemyAttack) + " ATK");
	
	# If the enemy's health gets too low, they die and you win; otherwise, they get to keep moving
	if(enemyHealth <= 0):
		Text.text = ("The alien attacking you falls over, unconscious...")
		await clicked
		Text.text = ("You win!")
		await clicked
		
		Text.text = rewards()
		await clicked
		get_tree().change_scene_to_file("res://Scenes/Overworld.tscn")
	elif(enemyHealth > 0 && waiting == false):
		alienMove();
	
	# If your health gets too low, you collapse and you lose
	if(laikaHealth <= 0):
		Text.text = ("You collapse, the space's endless night consuming you...")
		await clicked
		Text.text = ("Game over!")
		await clicked
		get_tree().change_scene_to_file("res://Scenes/gameover.tscn")
	
	if(waiting == true):	# If the alien's turn just ended, enables Laika's buttons once again
		Text.text = ("[YOUR TURN]");
		Fight.disabled = false
		Defend.disabled = false
		Items.disabled = false
		Flee.disabled = false

func alienMove() -> void:
	var rand : RandomNumberGenerator = RandomNumberGenerator.new()
	var enemyOption : int = 0;
	if(enemyLevel == 1):
		enemyOption = rand.randi_range(0, 5)
	elif(enemyLevel == 2):
		enemyOption = rand.randi_range(0, 10)
	match enemyOption:
		0:	# Screech: 1/6 chance
			Text.text = ("The alien lets out a harrowing screech!");
			await clicked
			if(defending == true):
				Text.text = ("You brace through the sound, going unaffected!");
			elif (stealth == true):
				Text.text = ("Even while in the shadows, the effects of the sound get to you!");
				screech = 3;
			else:
				Text.text = ("You get stunned, and your hits won't be as effective for 3 turns...");
				laikaEffect("damage")
				screech = 3;
			await clicked
		1, 2:	# Acid: 2/6 chance
			if(stealth == true):
				Text.text = ("The alien spits out a gross acid, but it misses!");
			else:
				Text.text = ("The alien spits out a gross acid, dealing " + str(enemyAttack/2) + " damage for the next few turns!");
				laikaEffect("damage")
				laikaHealth = laikaHealth - enemyAttack/2;
				defending = false;
				acid = 3;
			await clicked
		3, 4, 5:	# Pound: 3/6 chance
			Text.text = ("The alien's arms stretch out and attack you!");
			laikaEffect("damage")
			await clicked
			if(defending == true):
				Text.text = ("You defend it, only receiving " + str(enemyAttack - (laikaAttack/2)) + " damage!");
				defending = false;
				laikaHealth = laikaHealth - (enemyAttack - (laikaAttack/2));
			elif (lick == true):
				Text.text = ("Weakened, the enemy only deals " + str(enemyAttack/2) + " damage!");
				lick = false;
				laikaHealth = laikaHealth - (enemyAttack/2);
			else:
				Text.text = ("You receive " + str(enemyAttack) + " damage!");
				laikaHealth = laikaHealth - enemyAttack;
			await clicked
		6, 7, 8:	# Steal: 3/10 chance for Alien 2
			Text.text = ("The alien rummages through your inventory!");
			await clicked
			if(ItemsPopup.get_item_count() > 0):
				var steal = rand.randi_range(0, ItemsPopup.get_item_count() - 1);
				var stealChance = rand.randi_range(0, 1);
				if(stealChance == 0):
					Text.text = ("Your pockets feel a bit lighter...!");
					ItemsPopup.remove_item(steal);
				else:
					Text.text = ("But it didn't find anything...");
			else:
				Text.text = ("But your inventory was already empty!");
			await clicked
		9, 10:
			Text.text = ("The alien whistles a lovely tune...");
			await clicked
			var singChance = rand.randi_range(0, 3);
			if(singChance == 0):
				Text.text = ("You feel a bit woozy...!");
				sing = true;
			else:
				Text.text = ("But it doesn't work!");
			await clicked
	waiting = true;
	afterTurn();

func _input(event) -> void:
	if(event.is_action_pressed("click") && canClick):
		clicked.emit()

func laikaEffect(type: String) -> void:
	if(type == "damage"):
		DamageSound.play()
		LaikaSprite.modulate = Color.RED
		await get_tree().create_timer(0.1).timeout
		LaikaSprite.modulate = Color.WHITE
	if(type == "heal"):
		HealSound.play()
		LaikaSprite.modulate = Color.GREEN
		await get_tree().create_timer(0.5).timeout
		LaikaSprite.modulate = Color.WHITE
		
func alienEffect(type: String) -> void:
	if(type == "damage"):
		DamageSound.play()
		EnemySprite.modulate = Color.RED
		await get_tree().create_timer(0.1).timeout
		EnemySprite.modulate = Color.WHITE
	if(type == "heal"):
		HealSound.play()
		EnemySprite.modulate = Color.GREEN
		await get_tree().create_timer(0.5).timeout
		EnemySprite.modulate = Color.WHITE

func rewards() -> String:
	var rand : RandomNumberGenerator = RandomNumberGenerator.new()
	var gooReceived : int = 0
	var rockReceived : int = 0
	var metalReceived : int = 0
	var crystalReceived : int = 0
	var remaining : int = 0
	var rewardString : String = ""
	if(day == 1):
		gooReceived = 1
	elif(enemyLevel == 1):
		gooReceived = rand.randi_range(0, 1)
		rockReceived = rand.randi_range(0, 2)
		metalReceived = rand.randi_range(0, 1)
	elif(enemyLevel == 2):
		gooReceived = rand.randi_range(0, 2)
		rockReceived = rand.randi_range(1, 3)
		metalReceived = rand.randi_range(0, 2)
		crystalReceived = randi_range(0, 1)
	
	if(gooReceived == 0 && rockReceived == 0 && metalReceived == 0):
		rewardString = "You didn't receive anything..."
		return rewardString
	else:
		rewardString = "You received "
		if(gooReceived > 0):
			if(gooReceived == 1):
				rewardString = rewardString + "1 ball of goo"
			else:
				rewardString = rewardString + str(gooReceived) + " balls of goo"
			remaining = rockReceived + metalReceived + crystalReceived
			if(remaining > 0 && (remaining == rockReceived || remaining == metalReceived || remaining == crystalReceived)):
				rewardString = rewardString + " and "
			elif(remaining > 0):
				rewardString = rewardString + ", "
			
		if(rockReceived > 0):
			if(rockReceived == 1):
				rewardString = rewardString + "1 rock"
			else:
				rewardString = rewardString + str(rockReceived) + " rocks"
			remaining = metalReceived + crystalReceived
			if(remaining > 0 && (remaining == metalReceived || remaining == crystalReceived)):
				rewardString = rewardString + " and "
			elif(remaining > 0):
				rewardString = rewardString + ", "

		if(metalReceived > 0):
			if(metalReceived == 1):
				rewardString = rewardString + "1 scrap of metal"
			else:
				rewardString = rewardString + str(metalReceived) + " scraps of metal"
			if(crystalReceived > 0 && (gooReceived > 0 || rockReceived > 0)):
				rewardString = rewardString + ", and "
			elif(crystalReceived > 0):
				rewardString = rewardString + " and "
		
		if(crystalReceived > 0):
			rewardString = rewardString + "1 crystal"
		
		rewardString = rewardString + "."
		for n in gooReceived:
			inv.insert(goo)
		for n in rockReceived:
			inv.insert(rock)
		for n in metalReceived:
			inv.insert(metal)
		# Need to implement crystals
		
		#LAIKA LEVEL FUCNTION
		var exp = enemyLevel * 10;
		laikaExp += exp;
		if(laikaExp % 50 == 0):
			laikaLevel += 1
			rewardString = rewardString + " You leveled up!"
		
		return rewardString
