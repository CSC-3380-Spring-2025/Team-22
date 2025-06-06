
![Screenshot 2025-05-07 135129](https://github.com/user-attachments/assets/c765aa37-abe1-40b8-8bcd-5829c38530f0)

# Lunar Landar Laika
# Team 22

# Members
Project Manager: **Emery Jones** [elj174]

Communications Lead: **Caleb Wycoff** [crusewycoff1]

Git Master: **Khoa Vu** [kvu21]

Design Lead: **Katherine Winchester** [kwinch]

Quality Assurance Tester: **Christian Frazier** [cfraz18]

# About Our Software

Survival Turn-based RPG Game based on the historical events of Laika, the first animal to orbit the Earth. Stranded on the moon, fight your way through aliens and build a base to survive until you make it home.
Laika is able to collect resources from her environment and from defeated aliens throughout her journey, then craft the raw resources into weapons and tools. As she defeats more aliens, she will gain more HP and learn new moves until she is strong enough to take on the toughest alien in space.

## Platforms Tested on
- Windows

## Technologies Used
- **Godot Engine** with **GDScript**
-  **Jira** for task management and planning
-  **Piskel** for pixel art creation

# Important Links
- **Kanban Board:** [Jira](https://3108team22.atlassian.net/jira/software/projects/LLL/boards/1?atlOrigin=eyJpIjoiYjFkYzc5NmEwNGNjNDkwMTk4OWQyNTNiOTc4MWJjNDgiLCJwIjoiaiJ9)
- **Design Outline:** [link](https://lsumail2-my.sharepoint.com/:w:/r/personal/kwinch3_lsu_edu/Documents/Spring%202025/CSC%203380/Design%20Outline.docx?d=wb067e339ce00470aa6096ef1205f7dcb&csf=1&web=1&e=XQcuNl)

### Downloading Dependencies
You can download Godot from the download tab on the official website. It is optimized for use in 4.4.1: [https://godotengine.org/download/windows/]

## Dependencies
- Godot 4.4.1

# How to Run Game
1] **Install Godot**
	- You can download Godot from the download tab on the official website. 
 It is optimized for use in 4.4.1: [ https://godotengine.org/download/windows/ ] 

2] **Clone the repository** [ https://github.com/CSC-3380-Spring-2025/Team-22.git ] or download the zip folder and extract all files.
![Screenshot 2025-05-07 201041](https://github.com/user-attachments/assets/37f19008-5aeb-4ee9-8e9f-cfa200d364f4)


3] **Launch Godot Game Engine**
	- Click "import" in the Project Manager and navigate to the unzipped folder or cloned folder and select the folder labeled **LLL**. Inside LLL, select the **project.godot** file. 
  	- Click **"Import & Edit"** to open the project.godot file.
   
![Screenshot 2025-05-07 125948](https://github.com/user-attachments/assets/73adf2c2-f280-4821-952f-79c8c9803874)



4] Once loaded, in the editor in the top right of the editor there is a white play button. Click the **play** button (or F5 on the keyboard) to run the project. If you wish to play a scene independent of other scenes, select the scene in the FileSystem on the left side of the editor and click the Run Current Scene button (or F6 on the keyboard).


![Screenshot 2025-05-07 130129](https://github.com/user-attachments/assets/ff034434-0f3c-4d39-b310-05abc03ae4bd)


## Directions for the Game
- Once launched following directions from above, the game begins with the main menu scene. This is where you can read a brief tutorial and turn the music on or off. When ready to play, click the play button. This begins the game on Day 1 out of 10. Each day has different resources and aliens that spawn on the tilemap.
  
- To check which resources the player has collected, press the **Tab** key on the keyboard. Once the player has collected all resources and battled all enemies, they can click the den and Laika will sleep. Each time Laika sleeps, the next day begins. It is not necessary to fight all the aliens each day, but the player might choose to spend the extra time to become stronger. By the final the day, she should be strong enough to fight and defeat the final boss, which if defeated, will win the game.

- The player can battle enemies that appear on the map! Click an alien with your mouse to initiate a battle with them. You must also click the den to sleep, which will increment to the next day. When you wake up, there will be a fresh set of aliens to battle and items to collect. 
