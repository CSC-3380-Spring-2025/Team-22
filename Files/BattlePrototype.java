import java.util.Scanner;
import java.util.Random;
//Note: This is NOT THE FINAL CODE FOR THE BATTLE!! This is a prototype made in Java before implementation in Godot, to help with a majority of the script/mapping out ideal functionality.
public class BattlePrototype {

	
	static int laikaAttack = 6;
	static int laikaMaxHealth = 20;
	static int laikaHealth = laikaMaxHealth;
	static String[] laikaOptions = {"Scratch", "Bite", "Howl"};
	static String[] laikaItems = {"Rock", "Rod", "Dog Treat", null, null, null, null, null, null, null};
	static int enemyAttack = 4;
	static int enemyMaxHealth = 15;
	static int enemyHealth = enemyMaxHealth;
	
	static int poison = 0;
	static boolean defending = false;
	
	public static void main(String[] args) {
		System.out.println("Starting battle...\n");
		boolean fighting = true;
		while(fighting == true) {
			System.out.printf("Laika: %d/%d HP, %d ATK\n", laikaHealth, laikaMaxHealth, laikaAttack);
			System.out.printf("Alien: %d/%d HP, %d ATK\n\n", enemyHealth, enemyMaxHealth, enemyAttack);
			laikaTurn();
			enemyTurn();
		}

	}
	
	public static void laikaTurn() {
		Scanner scan = new Scanner(System.in);
		boolean waiting = true;
		System.out.println("What will you do?");
		System.out.println("[Attack]  [Defend]  [Items]  [Flee]");
		while(waiting == true) {
			String input = scan.nextLine();
			System.out.println("");
			switch(input) {
				case "Attack":
					System.out.println("Which attack will you use?");
					for(int i = 0; i < laikaOptions.length; i++) {
						System.out.printf("[%s]  ", laikaOptions[i]);
					}
					input = scan.nextLine();
					switch(input) {
						case "Scratch":
							System.out.printf("Laika attacks the enemy and deals %d damage!\n", laikaAttack);
							enemyHealth = enemyHealth - laikaAttack;
							waiting = false;
							break;
						case "Bite":
							System.out.printf("Laika bites the enemy, dealing %d damage for the next few turns!\n", laikaAttack/2);
							enemyHealth = enemyHealth - laikaAttack/2;
							poison = 3;
							waiting = false;
							break;
						case "Howl":
							System.out.printf("Laika howls, healing herself for %d health!\n", laikaAttack);
							if (laikaHealth + laikaAttack <= laikaMaxHealth) {
								laikaHealth = laikaHealth + laikaAttack;
							}
							else {
								laikaHealth = laikaMaxHealth;
							}
							waiting = false;
							break;
						default:
							System.out.println("Input didn't match an option! Returning...");
							break;
					}
					break;

				case "Defend":
					System.out.printf("Laika defends herself and reduces %d damage!\n", laikaAttack/2);
					defending = true;
					waiting = false;
					break;
					
				case "Items":
					System.out.println("Which item will you use?");
					for(int i = 0; i < laikaItems.length; i++) {
						if(laikaItems[i] != null) {
							System.out.printf("[%s]  ", laikaItems[i]);
						}
					}
					input = scan.nextLine();
					switch(input) {
						case "Rock":
							System.out.println("Laika throws out a moon rock, hitting the enemy for 10 attack!");
							enemyHealth = enemyHealth - 10;
							waiting = false;
							for(int i = 0; i < laikaItems.length; i++) {
								if(laikaItems[i] == "Rock") {
									laikaItems[i] = null;
								}
							}
							break;
						case "Rod":
							System.out.printf("Laika swings a rod, hitting the enemy for %d attack!", laikaAttack * 2);
							enemyHealth = enemyHealth - (laikaAttack * 2);
							waiting = false;
							for(int i = 0; i < laikaItems.length; i++) {
								if(laikaItems[i] == "Rod") {
									laikaItems[i] = null;
								}
							}
							break;
						case "Dog Treat":
							System.out.println("Laika eats a treat, healing herself for 10 health!");
							if (laikaHealth + 10 <= laikaMaxHealth) {
								laikaHealth = laikaHealth + 10;
							}
							else {
								laikaHealth = laikaMaxHealth;
							}
							waiting = false;
							for(int i = 0; i < laikaItems.length; i++) {
								if(laikaItems[i] == "Dog Treat") {
									laikaItems[i] = null;
								}
							}
							break;
						default:
							System.out.println("Input didn't match an option! Returning...");
							break;
					}
					break;
					
				case "Flee":
					System.out.println("Laika runs away!");
					waiting = false;
					System.exit(0);
					break;
					
				default: 
					System.out.println("Invalid input!");
					break;
			}
		}
		if(poison == 3) {
			poison--;
		}
		else if(poison > 0) {
			System.out.printf("Additionally, Laika deals %d extra damage to the enemy!\n", laikaAttack/2);
			enemyHealth = enemyHealth - (laikaAttack/2);
			poison--;
		}
		System.out.println("");
		if(enemyHealth <= 0) {
			System.out.println("The alien attacking you falls over, unconscious...");
			System.out.println("You win!");
			scan.close();
			System.exit(0);
		}
		return;
	}
	
	public static void enemyTurn() {
		Random rand = new Random();
		int enemyOption = rand.nextInt(6);
		switch(enemyOption) {
			case 0:
				System.out.println("The alien stares at you mysteriously.");
				break;
			case 1, 2, 3:
				System.out.printf("The alien takes a bite of a sweet, delicious moon rock and heals %d health!\n", enemyAttack);
				if (enemyHealth + enemyAttack <= enemyMaxHealth) {
					enemyHealth = enemyHealth + enemyAttack;
				}
				else {
					enemyHealth = enemyMaxHealth;
				}
				break;
			case 4, 5:
				if(defending == true) {
					System.out.printf("The alien attacks you, but you defend it and only receive %d damage!\n", enemyAttack - (laikaAttack/2));
					defending = false;
					laikaHealth = laikaHealth - (enemyAttack - (laikaAttack/2));
				}
				else {
					System.out.printf("The alien attacks you for %d damage!\n", enemyAttack);
					laikaHealth = laikaHealth - enemyAttack;
				}
				break;
		}
		if(laikaHealth <= 0) {
			System.out.println("You collapse, the space's endless night consuming you...");
			System.out.println("Game over!");
			System.exit(0);
		}
		System.out.println("");
		return;
	}
}
