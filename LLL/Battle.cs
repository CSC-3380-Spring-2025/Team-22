using Godot;
using System;

public partial class Battle : Node2D
{
	public static int laikaAttack = 6;
	public static int laikaMaxHealth = 20;
	public static int laikaHealth = laikaMaxHealth;
	public static int enemyAttack = 4;
	public static int enemyMaxHealth = 15;
	public static int enemyHealth = enemyMaxHealth;
	
	public static int poison = 0;
	public static bool defending = false;
	public static bool waiting = true;
	
	[Export]
	MenuButton Fight;
	Button Defend;
	MenuButton Items;
	Button Flee;
	
	public override void _Ready() {
		Fight = GetNode<MenuButton>("Fight");
		PopupMenu FightPopup = Fight.GetPopup();
		FightPopup.Connect("id_pressed", new Callable(this, "_Fight"));
		
		Items = GetNode<MenuButton>("Items");
		PopupMenu ItemsPopup = Items.GetPopup();
		ItemsPopup.Connect("id_pressed", new Callable(this, "_Items"));
	}
	
	public void _Fight(int index) {
		GD.Print("Fighting!");
		switch(index) {
			case 0:
				GD.Print("Laika attacks the enemy and deals ", laikaAttack, " damage!");
				enemyHealth = enemyHealth - laikaAttack;
				break;
			case 1:
				GD.Print("Laika bites the enemy, dealing ", laikaAttack/2, " damage for the next few turns!");
				enemyHealth = enemyHealth - laikaAttack/2;
				poison = 3;
				break;
			case 2:
				GD.Print("Laika howls, healing herself for ", laikaAttack, " health!");
				if (laikaHealth + laikaAttack <= laikaMaxHealth) {
					laikaHealth = laikaHealth + laikaAttack;
				}
				else {
					laikaHealth = laikaMaxHealth;
				}
				break;
		}
		waiting = false;
		afterTurn();
	}

	public void _Defend() {
		GD.Print("Defending!");
		defending = true;
		waiting = false;
		afterTurn();
	}
	
	public void _Items(int index) {
		GD.Print("Iteming!");
		switch(index) {
			case 0:
				GD.Print("Laika throws out a moon rock, hitting the enemy for 10 attack!");
				enemyHealth = enemyHealth - 10;
				break;
			case 1:
				GD.Print("Laika swings a rod, hitting the enemy for ", laikaAttack * 2, " attack!");
				enemyHealth = enemyHealth - (laikaAttack * 2);
				break;
			case 2:
				GD.Print("Laika eats a treat, healing herself for 10 health");
				if (laikaHealth + 10 <= laikaMaxHealth) {
					laikaHealth = laikaHealth + 10;
				}
				else {
					laikaHealth = laikaMaxHealth;
				}
				break;
		}
		waiting = false;
		afterTurn();
	}
	
	public void _Flee() {
		GD.Print("Fleeing!");
		alienMove();
	}
	
	public void afterTurn() {
		if(poison == 3) {
			poison--;
		}
		else if(poison > 0) {
			GD.Print("Additionally, Laika deals ", laikaAttack/2, " extra damage to the enemy!");
			enemyHealth = enemyHealth - (laikaAttack/2);
			poison--;
		}
		
		GD.Print("\nLaika: ", laikaHealth, "/", laikaMaxHealth, "HP, ", laikaAttack, " ATK");
		GD.Print("Alien: ", enemyHealth, "/", enemyMaxHealth, "HP, ", enemyAttack, " ATK\n");
		
		if(enemyHealth <= 0) {
			GD.Print("The alien attacking you falls over, unconscious...");
			GD.Print("You win!");
		}
		else if(enemyHealth > 0 && waiting == false) {
			alienMove();
		}
		
		if(laikaHealth <= 0) {
			GD.Print("You collapse, the space's endless night consuming you...");
			GD.Print("Game over!");
		}
	}
	
	public void alienMove() {
		Random rand = new Random();
		int enemyOption = rand.Next(1, 6);
		switch(enemyOption) {
			case 0:
				GD.Print("The alien stares at you mysteriously.");
				break;
			case 1: case 2:
				GD.Print("The alien takes a bite of a sweet, delicious moon rock and heals ", enemyAttack, " health!");
				if (enemyHealth + enemyAttack <= enemyMaxHealth) {
					enemyHealth = enemyHealth + enemyAttack;
				}
				else {
					enemyHealth = enemyMaxHealth;
				}
				break;
			case 3: case 4: case 5:
				if(defending == true) {
					GD.Print("The alien attacks you, but you defend it and only receive ", enemyAttack - (laikaAttack/2),  " damage!");
					defending = false;
					laikaHealth = laikaHealth - (enemyAttack - (laikaAttack/2));
				}
				else {
					GD.Print("The alien attacks you for ", enemyAttack, " damage!");
					laikaHealth = laikaHealth - enemyAttack;
				}
				break;
		}
		waiting = true;
		afterTurn();
		return;
	}
}
