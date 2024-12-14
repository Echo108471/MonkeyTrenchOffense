# Monkey Trench Offense #

## Summary ##

In our game you play as a balloon trying to escape evil monkeys that have trapped you and your fellow balloons. You must dodge the projectile attacks from numerous monkeys like bomb monkeys that throw TNT with huge explosions at you, dart monkeys that throw multiple needle sharp darts, and ice monkeys that hurl freezing icicles. With no ability to fight back, your only options are to run, dash, and outmaneuver the relentless attacks. The further you progress, the more challenging the enemies and obstacles become as you strive for freedom. There are special abilities you must use to overcome the oppression of the monkeys.

## Project Resources

[Itch IO](https://benyoung32.itch.io/monkey-trench-offense) 

[Trailer](https://youtu.be/i8l6JdhSNFc?si=5tn6Pdlufj88c8pC)  
[Press Kit](https://ryanffrench.github.io/MonkeyTrenchOffense-PressKit/)  
[Proposal](https://docs.google.com/document/d/1XfRfDoN-Fm2vW_cJ7vQpI7-b4w9EeZ0zoOBdrwvnYzk/edit?tab=t.0#heading=h.i3tv2mxf7h7z)  

## Gameplay Explanation ##

Your goal is to dodge projectiles and obstacles as you navigate through the levels to reach freedom. The controls are simple:

## Controls:
- **Arrow Keys / WASD**: Use these keys to move your balloon in any direction. 
  - **Up / W**: Move Up
  - **Down / S**: Move Down
  - **Left / A**: Move Left
  - **Right / D**: Move Right
- **Spacebar**: Use the spacebar to dash quickly in the direction you're moving. This will help you evade incoming attacks, but use it wisely, as the dash has a cooldown period.
- **P**: Use to Activate Black-Hole Balloon's Absorption Ability 
- **E**: Cycle Through Upgrades (Only Available When Cheat Mode is On, Toggleable In Main Menu)
  
## Gameplay Strategy:
1. **Dodge and Dash**: Your main defense is your ability to move and dash. Keep an eye on the approaching enemies and their projectiles. Time your dash carefully to avoid explosions, arrows, and icicles.
2. **Enemy Patterns**: Different monkeys throw different types of projectiles, each with its own behavior. Bomb monkeys will throw large TNT that explode after a short delay, dart monkeys will shoot fast arrows in predictable patterns, and ice monkeys will throw icicles that slow you down. Learn their patterns and use your dash strategically to evade them.
3. **Positioning**: Always keep an eye on the terrain and use it to your advantage. Some areas may provide more room to maneuver, while others might be more dangerous due to tight spaces and numerous enemies.
4. **Use the Dash Sparingly**: The dash is a powerful tool, but it has a cooldown period. Use it when you absolutely need to escape or quickly change direction. Overusing it may leave you vulnerable.
5. **Level Progression**: Each level gets progressively more difficult with additional enemies and faster projectiles. Stay alert and adapt your strategy as the challenges increase.
6. **Collect Special Powerups**: There are powerup coins in each level that grant you the choice between 3 unique powerups: Beast Balloon, Lead Balloon, and Black-Hole Balloon. The Beast Balloon boasts an unbeatable movement speed and no dash cooldown, so you can rush past any towers but it is easily popped by any projectile. The Lead Balloon's thick meal exterior can tank many hits from sharp projectiles so as long as there is no bomb nearby you'll be just fine, but beware that this balloon is weighed down and thus slower. The Black-Hole Balloon grants you a unique absorption ability that will absorb any projectile for 5 seconds and regenerates your lost health for each projectile absorbed up to max health, but it will go on cooldown for 10 seconds after and force you to stop as the balloon 'digests' the projectiles for 3 seconds after the ability is finished. While absorbing your movement speed is also reduced to 50%. You will need specific abilities to overcome certain level sections, so choose wisely!
   
Good luck, and may you escape the monkeys’ clutches!





**Add it here if you did work that should be factored into your grade but does not fit easily into the prescribed roles! Please include links to resources and descriptions of game-related material that does not fit into roles here.**
- Our main roles and subroles that we ended up working on throughout the project development differ somewhat from what this template lays out since we felt for our game there was a different way to split the work fairly with the highest efficiency and structure. 
Our Main roles and Subroles were as follows:

Eugene Cho - Main Role: Map Design/Level Design, Subrole: Level Feel

Ben Young - Main Role: Movement/Physics, Subrole: Gameplay Feel

Minji Yun - Main Role: Animation/Visuals, Subrole: Narrative Design

Ryan Ffrench - Main Role: Producer, Subrole: Audio/SFX & Presskit/Trailer (Chose two subroles since the main role was a little lighter)

Nathan Kotni - Main Role: Tower/Balloon Upgrades Planning & Powerups Coding, Subrole: User Interface

Richard Shi - Main Role: Entity/Tower Programming, Subrole: Gameplay Testing

*NOTE: Obviously, it would be a little ridiculous to say that each person only contributed to their own role and subrole, there was a lot of collaboration and overlap between roles but it is roughly true that each person contributed more to their listed role than any others. 


# External Code, Ideas, and Structure #

- We had strong intellectual guidance from Balloons Tower Defense. Making a direct parody helped everyone have a unified vision. It is, however, an entirely different game. The assets, SFX, maps, power-ups, etc. are all new. The gamplay is entirely different, it is not a tower defense game at all since you are playing as the balloon. Our game is more akin to a Bullet Hell style game or a Dungeon Crawler to an extent.

- We looked at the Godot documentation for guidance and consulted various online forums like Reddit, Stack Exchange, and the Godot Forums for debugging difficult errors that arose (usually through Google searching the error message).



# Main Roles #

## Producer - Ryan Ffrench

My group was amazing which made my role as a producer go smoothly. We came up with an idea that is simple to understand which allowed us to easily come to a consensus on what our game should look and feel like. One of the judges at the game jam even said that it was smart we made a game that was a spin on a preexisting game because so many design decisions had already been made. We were behind going into the first progress report, but this was due to it being Thanksgiving. Understandably people did not get as much work done as expected. We quickly got back on track and have been working very well together. I ensured everyone was on track by constently checking in with the group asking for brief progress updates. Communication was great. When people had bugs or other issues the entire group did their best to help. The biggest issue we faced as a group was issues with Godot's (nonexistent) Git integration specifically with merge conflicts. We minimized this by using pull requests/different branches initially, and later by pushing only when a significant amount of work had been done and with warning to the rest of the team. I specifically commited my changes late at night with hours of advanced notice. Another notable thing I did was formulate our approach to the Final Festival. We felt that we had the bones of a great game, but that getting the judges to see that was going to be a challenge. I prepared a elevator pitch that enthusiastically and quickly got the idea of our game across, and guided players through the best parts of our game. Overall, because our team worked so well together, this role was easier than anticipated which is why I ended up taking two sub-roles (see below).


## Entity Programming - Richard Shi
My role was to lay the groundwork and code the foundational behaviors and organizational hierarchy of the three main types of entities in our game: player, towers, and projectiles. Parts of these were later expanded upon by other team members working on specific systems that rely on first having basic functional entities (eg. upgrades, movement physics, sound, etc.). See commit history of richardBranch and main for details.

*Player:* The first thing I coded was a [player entity](https://github.com/Echo108471/MonkeyTrenchOffense/blob/9d3d79b015ef8b90aad342d511616c91e4f7395c/monkeytrenchoffense/Scenes/player/player.gd#L1) that had all the basic properties of a collision hull, hitbox (or is called a hurtbox???), sprite, basic movement physics (later overwritten and improved by team), health, etc. I implemented a framework for communicating damage and status effects to the player and implemented a basic slowdown effect from the slow tower. Regrettably, given the scope of the game and available time, this was not used to its fullest extent. This part of my role had the most significant overlap with other team members' work since the game is so heavily centered around the player entity and so many later additions, such as sound or game feel or ui, directly built on it.

*Towers:* I created a [base tower class](https://github.com/Echo108471/MonkeyTrenchOffense/blob/9d3d79b015ef8b90aad342d511616c91e4f7395c/monkeytrenchoffense/Scenes/turrets/turretBase/turret_base.gd#L1) and scene from which the others are derived. The three types of towers ([projectile](https://github.com/Echo108471/MonkeyTrenchOffense/blob/9d3d79b015ef8b90aad342d511616c91e4f7395c/monkeytrenchoffense/Scenes/turrets/projectileTurret/projectileTurret.gd#L1), [slow](https://github.com/Echo108471/MonkeyTrenchOffense/blob/9d3d79b015ef8b90aad342d511616c91e4f7395c/monkeytrenchoffense/Scenes/turrets/slowTurret/slowTurret.gd#L1), and [bomb](https://github.com/Echo108471/MonkeyTrenchOffense/blob/9d3d79b015ef8b90aad342d511616c91e4f7395c/monkeytrenchoffense/Scenes/turrets/bombTurret/bombTurret.gd#L1)) all inherit the core properties of a tower from this parent class (most represented by a list of member variables that can be customized as needed by other game systems such as tower upgrades). This part of my role had relatively notable overlap with other team members given that other systems would need to use/alter behavior of the towers through member variables. Additional note: the vector math for making the projectile turret's customizable spreadshot was particularly challenging when I began to consider making it as robust a solution as possible.

*Projectiles:* I first created a [basic bullet](https://github.com/Echo108471/MonkeyTrenchOffense/blob/9d3d79b015ef8b90aad342d511616c91e4f7395c/monkeytrenchoffense/Scenes/projectiles/bulletBase.gd#L1) to serve as reference. It has the basic functionality of aiming, flying, seeking, damaging, etc. and other such basic behaviors for a projectile. The [bomb bullet](https://github.com/Echo108471/MonkeyTrenchOffense/blob/9d3d79b015ef8b90aad342d511616c91e4f7395c/monkeytrenchoffense/Scenes/projectiles/bulletBomb.gd#L1) inherits from it, though adding/altering timers, signals, the hitbox, and fuse/explosion animations in order to make it blow up in addition to just flying forward like a normal projectile. Also, another team member later helped create a separate icicle bullet using the basic bullet as a template, although in hindsight a more elegant implementation would have been to simply initialize and configure it with a different sprite instead of making a whole new class. This part of my role had relatively little overlap with other team members given that most information would be passed through the turret when calling the configure function.


## Movement/Physics -- Ben Young

*Movement* - While I was designing the movement system, I tried to balance control versus fluidity. In a bullethell-esque game, controlling your character to avoid projectiles is really important. In some games, your character moves exactly with your inputs and carries no momentum. In other games, unwieldy movement mechanics **are** the challenge, like ice levels in platformers or games like QWOP where the player is a floppy mess. For this game, I wanted the movement 

The main idea behind our movement system is _"floaty"_-ness to mimic the feeling of a balloon. To implement this idea I created a 2nd order movement system in [_handle_movement_inputs](https://github.com/Echo108471/MonkeyTrenchOffense/blob/2e86806a0769620226b464a5874b5285bddb5dd5/monkeytrenchoffense/Scenes/player/player.gd#L106): Player inputs create an acceleration, which increments velocity, which finally increments the player's position using Godot's built-in **move_and_slide** function. When there are no inputs, there is a _drag_ acceleration which slowly brings the player to stop.

Using the built-in **move_and_slide** saved a ton of headache implementing collision checks and handling, as this function simply adds the objects velocity to its position, checks for collisions several times along the way, and does a simple collision handling which redirects the players velocity along the collision point. One drawback of using this function is that the player can actually move faster by pressing diagonally against the wall, as the orthagonal component of their velocity is added to the parallel component. Ideally, the player would not be encouraged to press as hard against every wall as they can, although it adds an interesting wrinkle to the map design.

Because our game's player has no attack, movement is the only option to deal with enemy fire. To help the player avoid enemy attacks, they have access to a dash using the space key. This dash gives a burst of speed, and can help accelerate the player to full speed faster, but comes with a cost. After the dash, the player is slowed for a small amount of time while they recover. The risk/reward aspect of this mechanic makes engaging with turrets fun.  

*Power up integration with player* - The base movement mechanics are further supplemented through the game's powerups in [apply_power_up](https://github.com/Echo108471/MonkeyTrenchOffense/blob/ab6c1c7dbcd23f790b4e8def95486a48109ecc82/monkeytrenchoffense/Scenes/player/player.gd#L148), which modify attributes of the player. For example, the _beast_ powerup greatly increases the players movement speed and dash duration, and decreases the dash recovery period. These attributes are designed to be easily modifiable, and are relative to each other. The dash speed is set as a multiplier of the maximum movement speed, so that you don't accidentally end up with a dash slower than the movement speed if you forget to increase the dash multiplier.

Using the assets created by Minji, I also implemented some of the animation spritesheets and animation switching code within this function. 

The enemy's can affect the player's movement speed as well. The ice turrets add a [negative multiplier](https://github.com/Echo108471/MonkeyTrenchOffense/blob/ab6c1c7dbcd23f790b4e8def95486a48109ecc82/monkeytrenchoffense/Scenes/player/player.gd#L100) to the player's speed, which is factored in after the players intrinsic movement multipliers so that they always stack correctly.

## Animation and Visuals -- Minji Yun

**List your assets, including their sources and licenses.**
Assets Used:
- Map Tiles, small animations, decorations: [Tiny Swords](https://pixelfrog-assets.itch.io/tiny-swords) - Creative Commons Zero License
*Inspiration Taken From BTD Games

- Created character visuals and sprite sheets. Animated them using animation tree and animation player.
- Visual components:
  - All visuals were created using Procreate
  - Player - Balloon (6 variations)
  - Towers - Monkeys (3 variations)
  - Projectiles - Darts (2 variations)
  - Start menu background, defeat/win screen
  - Nail trap (ended up not using)
- Character animation descriptions:
  - Balloons:
    - Idle: All balloons have a simple floating animation that bobs up and down.
    - Beast Balloon: It has a shiny particle appearing and disappearing effect to give it a reflective metalice feel
    - Lead Balloon: It has metal spikes shooting out and disappearing after it gets hit by a sharp projectile
    - Black hole Balloon: Its core is in the middle and there’s a purple aura swirling around
    - Each balloon animation has at least 5 frames
    - Popping effect on death: 15 frames, only shows red balloon since that is the last balloon state after downgrading from taking damage
  - Monkeys:
    - Idle: They are not moving when the player is not inside the detection radius. They only activate once the player steps in
    - Active: They move their right hands up and down, giving it a throwing motion
  - Projectile:
    - They have no animation, only static visual since it’s already flying straight out
    - Regular dart and icicle
- All visuals are original, no licenses. I painted them one by one, frame by frame. Lead Balloon, Beast Balloon, and Black Hole Balloon designs made by Nathan (Upgrades Planner).
- Balloons:
![redBalloon1](https://github.com/user-attachments/assets/68f6acab-627d-484e-8f53-fb8edc43aff2)
![2](https://github.com/user-attachments/assets/5df0fb5e-9ada-4d23-a385-1873ee4c6dc9)
![1](https://github.com/user-attachments/assets/ce9011f2-6c40-470c-b5c0-722d64558afd)
![2](https://github.com/user-attachments/assets/25295d28-8bca-4c8f-93d9-aec2bac8dbbd)
![4](https://github.com/user-attachments/assets/f6596da5-c28b-452e-b14a-24cbd0e556af)
![1](https://github.com/user-attachments/assets/2651e92a-63ee-42ce-83ba-dc48e34cb0e9)
- Monkeys:
![33](https://github.com/user-attachments/assets/aeaf08cc-cf15-4a8c-a18e-37b85e4a14fc)
![image](https://github.com/user-attachments/assets/6ca76794-a0be-4327-a253-c88997d686f4)
![image](https://github.com/user-attachments/assets/58335372-3cfb-4187-b01c-0650605651b2)
- Projectiles:
![Untitled_Artwork](https://github.com/user-attachments/assets/4430b2b8-5b67-4a16-8321-3491d9696699)
![image](https://github.com/user-attachments/assets/b1ef6a80-263d-4f8d-aeae-2fe70a9b6179)

- Start/Win/Lose Screen
![image](https://github.com/user-attachments/assets/f0aa0089-d739-44dd-a492-b3b7df8b40f5)
![image](https://github.com/user-attachments/assets/8b1c6b1f-2455-4ab0-8831-0f6bd6fdadc4)
![image](https://github.com/user-attachments/assets/248f06a0-f7dc-4600-b7fc-46f0d1ca1aae)


## Tower/Balloon Upgrades Planning & Powerups Coding -- Nathan Kotni

### Initial Designs & Brainstorming
My first task for my role was to decide on unique and fun Balloon upgrades and for our game to be exciting for players to explore, and so my idea for that was to maintain the look and feel of the original Bloons Tower Defense games but invent new powerups for the Balloon that the player is playing as. Through this thought process, I came up with a Balloon upgrade system that was doable to create within the timeframe available to us for project development while still being nuanced. The result of this is the following upgrade chart: 
![](https://github.com/Echo108471/MonkeyTrenchOffense/blob/030b4f9a9d286b7b1559015365539e40f27c467d/example_images/bloonUpgradesChart.png). 
I designed all of the special upgrades sprites myself (using Minji's Red Balloon design as a base for the Lead Balloon and Black Hole Balloon) and I did this using Piskel, a free online pixel sprite editor. In the above chart you can see that I pulled inspiration from BTD but made unique powerups for the Beast Balloon and Black Hole Balloon that adds a new twist to the classic upgrades that the Balloons recieve while keeping some of the iconic powerups from the similar like the Lead Balloon. There was also the basic upgrades for the Balloon which precedes the special upgrades, so Red for the base balloon with Blue and Green after it. 

For the Towers, I thought it would be fun to implement some of the most popular towers from BTD as villains in this game since most players would have an association with them as heroes, so this would highlight the narrative gimmick of our game that the Monkey Towers were actually the villains all along. Here is the tower chart that I made for our game including the changes we made during development: 
![](https://github.com/Echo108471/MonkeyTrenchOffense/blob/030b4f9a9d286b7b1559015365539e40f27c467d/example_images/towerUpgradesChart.png).

## Code Implementation
After these Balloon upgrades and towers were decided on, I gave direction to team members that were tasked with implementing the towers or player movement. For example, I would give specific details about the vision I had for the tower attacks to Richard, who was in charge of entity progamming, which the towers fall under. Then came the task of implementing the powerup structure for the player within the code, which Ben began as he expanded upon the movement code within [player.gd](https://github.com/Echo108471/MonkeyTrenchOffense/blob/4f90c21c5a030a34739715adad88d2b8609dcc19/monkeytrenchoffense/Scenes/player/player.gd) and I completed the code and changed to the appropriate animations that Minji for made when each powerup was equipped.

The specific code implementation for the powerups involved a Power enum that includes constants for every powerup possible along with a constant for DEAD. The way this system functions is that there is a variable of type Power that represents the current powerup that it equipped on the Balloon and another variable of type Power to represent the next state in the line after the current powerup. So when the Balloon takes a hit and the current hitpoints fall equal to or below 0, it changes the current powerup stored in the variable to the next-in-line powerup, and a new next-in-line powerup is assigned based on the new current power up. This allows for a Balloon to be able to have multiple layers until it finally dies at the red Balloon because the next-in-line powerup assigned to red is DEAD, and when DEAD becomes the current powerup by way of the previous layer (RED) popping, the popping animation is triggered and after a timer to allow the popping animation to play fully, the game over code is triggered. Then, when the powerup is switched either by gaining it through collecting a powerup coin, or by popping the previous layer, the relevant attributes are set to unlock the Balloon's abilities, like extreme tankiness for the Lead Balloon, fast movement speed and no dash recharge for the Beast Balloon, or enabling the input for the Black Hole Balloon's ability to aborb incoming projectiles, as well as setting slightly different stats for each of the colored Balloon layers. 

I also created code for the Black Hole Balloon's ability by only handling user input for the 'P' key only when the current powerup is BLACK_HOLE, and the ability would have a duration and cooldown period much like the dash ability that Ben created but while it is active it does not allow the Balloon to be injured by enemy projectiles, and instead handles their collisions by increasing it's own health by their damage amounts up to the max hitpoints for the Black Hole Balloon of 5 hitpoints. This ability lasts for 5 seconds with movement slowed to 50% for all that time and goes on cooldown for 10 seconds after with the first 3 seconds of cooldown still having slowed movement.

I also created the sprite and nodes for the Balloon Powerup Coin which when the player collects it by their collision boxes intersecting, grants the user either an extra layer of basic Balloon (color change) or once the color is at Green, allows the user to choose between any of the 3 special powerups. This choice essentially pauses the game and uses Godot containers like CanvasLayer to display it as a popup on the screen.



## Map and Level Design (Eugene Cho)

### Initial Design
When I was first thinking about the level and map design, I first thought about what kind of level I wanted to design. The theme of our game is to escape a bunch of monkey towers as a balloon, with special abilities. Due to this reversal of the genre, while there are many examples of high-quality tower defense games, such as the Bloons TD games as well as the Kingdom Rush games, many of the map layouts and game design choices, while brilliant for the tower defense genre, are not as applicable in our game, which favors player movement and choice. Especially the Kingdom Rush series, I really admired the creators, Ironhide Games, for their level design. However, design choices such as having multiple branching paths with different spawn points of enemies make for a much more engaging tower defense game, but not so much a reverse tower defense.

Here are some examples of BTD and Kingdom Rush maps below:

![](./example_images/kingdom_rush.png)
![](./example_images/btd6.png)

Due to this, I began searching through other genres for maps, focusing on games and genres that emphasized movement and map design focused on a single entity. I found inspiration for maps in another one of Ironhide's games, a mobile-focused RTS called *Iron Marines*. *Iron Marines* is unique for an RTS—it’s a single-player campaign-only game, and due to its identity as a mobile-focused game, the design of the levels leans more towards strategic location and map design rather than actions per minute (APM).

Some of my first map designs looked like this:
![](./example_images/map1_1.png)
![](./example_images/map1_2.png)

While these were interesting initial designs, the team felt they diverged too far from the original idea of a trench escape game and leaned too much towards a dungeon-crawler-like design. So, including one design that a teammate came up with, I created two levels: one as a simple introductory level to guide the player through the mechanics of the game, and another more complex, mazelike map intended for players to explore on consecutive attempts.

Initial Designs:
![](./example_images/initial_design_map2_1.png)
![](./example_images/initial_design_map2_2.png)

Final Maps:
![](./example_images/main_map1.png)
![](./example_images/main_map2.png)
![](./example_images/main_map2_physics.png)

**Map 1:** The first map was intended to be a beginner level one, with only two split paths, with varying difficulty for each path. The goal is to make a simple, easy to understand goal for the player: get from the start to the end without dying. The entire map is made with a single asset package, called "tiny swords" which is linked in the asset sections of this page. Additionally, I intended the towns to act as a checkpoint for the player, allowing them to heal or buy upgrades to act as a progression system for the player. Decoration wise, I organized the map into a forested area near the top as a form of decoration and scenery. Initially, the intention was to create another path at the top of the map as well, but the layout wasn't working out, so I decided to go with simplicity. Decoration wise, I additionally added two signs into each of the paths to indicate the player in the correct direction, as well as a X sign near the end of the map if the player decides to start going the opposite direction. While these are small details that are likely to go unnoticed, I believe that they tie into guiding the player in the correct direction.

**Map 2:** The second map is much larger and more complex. With more experience after designing the first map, I was able to organize the layout and save time. The design emphasizes a maze-like structure, offering players multiple paths with varying difficulty. I also aimed to create the impression of different biomes on the map. The biomes include:
- **Desert biome:** The starting area, with sparse plants and a barren plain.
- **Cliff biome:** A region representing cliffs by the ocean.
- **Mountain biome:** A higher elevation area meant to serve as a high mountaintop
- **Valley biome:** The bottom of the map, reflecting a valley featuring lakes, wildlife, and a town at the very end.

Additionally, on this map I created a dedicated physics layer to draw out the bounds of the entire tilemap. In my previous map, I achieved it by automatically marking outer tiles as physics layers, but I found that having a dedicated tilemaplayer for physics was nice and made it much easier to debug. There is not as much intention behind the decorations, but I did choose certain decorations to be more memorable for the player to remember. Instead of making a bunch of trees scattered around for example, I created a mushroom patch near the bottom right of the map to serve aesthetic and almost as a mental checkpoint.

---

### Technical Components

These maps were created using a tileset from an asset pack called *Tiny Swords* to construct a tilemap in Godot. The `TileMapLayer` node was used to design the map layers, allowing for the stacking of multiple layers to create depth and structure. For example, by layering specific tiles (like walls, grass, and objects) on different `TileMapLayer` nodes, you can simulate visual depth and proper overlap for structures and environmental features. This technique is essential for creating a polished look in 2D maps, where different parts of the scene need to interact visually, such as stairs and shadows.

![](./ExampleImages/tilemaplayerimage.png)

Notably, the original `TileMap` node in Godot was deprecated about three months ago as part of an update. This update introduced the `TileMapLayer` node, which added new functionality for managing multiple layers within a single tilemap structure. However, this change created challenges for the project: much of the information available online was outdated and inconsistent, as many tutorials and resources still referenced the old `TileMap` workflow. As a result, learning how to properly implement the new system required additional time and experimentation to align with the updated documentation.

Part of the way through development, I started using a tool called the autotiler. The autotiler is a feature in Godot that simplifies the tile placement process by automatically connecting and aligning tiles based on predefined rules. For example, when creating terrain like grass, paths, or walls, the autotiler can determine which tile variant to use (e.g., corners, edges, or center pieces) without requiring manual selection for each placement. This tool is very helpful for drawing tilemaps, and significantly reduced the time required to align specific squares to each other. However, while functional, my tilemap did not work super well until Ben, a member on my team helped me realize that the tile size needs to be the size of the entire tile.

![](./example_images/tile_map.mp4)

For animations, Godot has a way to create an animation tilemap, where by creating individual tiles to every single frame and setting a time period to each frame, you can create an animation with a tileset and add moving scenery into the layer

![](./example_images/tile_animation.png)

Finally, for my physics layer, I implemented it by creating a new independent `TileMapLayer` solely focused on defining the physics boundaries. Previously, I defined physics boundaries by assigning them to every border tile in the tileset. While functional, this approach becomes tedious for larger maps and layers. Exceptions (e.g., where players can cross certain borders) are also harder to handle. By creating a dedicated boundary layer, I simplified the process for defining the play space and made debugging more efficient.




## Game Logic

Because our game is a simple 2D top-down adventurish game, we didn't need much overhead management for the game state. Each entity keeps track of their own state and actions, and has their own sound players as well. Interaction between the player and enemy projectiles is handled completely collision area signals. 

To transition between levels, we used an area trigger to teleport the player to the next area. A trigger is placed at the end of game to trigger the victory screen. 


# Sub-Roles


## User Interface -- Nathan Kotni

**Describe your user interface and how it relates to gameplay. This can be done via the template.**
The main user interface consists of the main menu, gameplay using WASD or arrow keys, HUD while playing the gamne including a pause button, game over menu, and game won screen. I implemented the code for all of these elements, which frankly took as much if not more time than my main role took. Note: I didn't mention it but I customized most labels and buttons in the following UI designs I will talk about in order for them to have outlines, shadows, and/or unique colors so they pop more and look more polished.

Boot Splash - I made a simple Boot Splash image that replaces the normal Godot loading screen as the project loads up when you run it. I also made the game load into a fullscreen window by default upon running. Here is an image of the Boot Splash.
![](https://github.com/Echo108471/MonkeyTrenchOffense/blob/0ce5e284ad22ef14171ae7adcc24a8d17ee0766c/example_images/boot_splash.png)

Main Menu - This was the first UI element that I created and figuring our how to do it took some time because it involved having many nested container nodes in order to get all of the design specifications I wanted like a blurred but transparent menu panel with an image in the background and vertically ordered items with the whole panel centered on the screen. That involved using a CenterContainer, TextureRect, ColorRect, and VBoxContainer as nested Godot nodes containing the buttons and labels inside. The background image displayed was drawn by Minji, who is in charge of visuals. To have this Main Menu be the first thing that shows up when the project is loaded up, I set this Main Menu scene as the root scene and made it a completely separate scene from the World scene which the main game is contained in. The buttons on the main menu allow the user to 'Start Game' by switching the scene to the wWrld scene or 'Quit' by quitting from the scene tree and toggle cheat mode, which allows the user to change their powerup by pressing the 'E' key. Here is an image of the completed main menu: 
![](https://github.com/Echo108471/MonkeyTrenchOffense/blob/9a0d1d1c02f230ed4d1fc5dfca3f54617bcf2bcb/example_images/mainMenu.png)

HUD - The HUD for the gameplay was another feature that I added which included a Pause button on the upper right part of the screen that pauses everything in the game and opens a Pause Menu. This Pause Menu is structured similarly to the Main Menu in terms of nodes but it uses a CanvasLayer to always stayed centered on the screen even when the player moves, and these nodes live in the World scene for gameplay. The pause menu includes a 'Resume' button that resumes the game, there is also a 'Menu' button that takes you back to the Main Menu, and a 'Quit' button that quits from the game. I also made a red horizontal textured progress bar on the upper left side of the screen that indicates the current health of the current Balloon layer, a label that displays how many layers of the Balloon remain, and a blue vertical textured progress bar that indicates the dash energy of the player currently as it gets used up and refills. I created the textures for the health and dash bars myself, pizel-by-pixel using Piskel, a free online pixel art editor. Here are images of the HUD as it appears during gameplay and the Pause Menu: 
![](https://github.com/Echo108471/MonkeyTrenchOffense/blob/d3492b2621ee954224fcc2129d852cfbb1c48465/example_images/HUDExample.png)
![](https://github.com/Echo108471/MonkeyTrenchOffense/blob/d3492b2621ee954224fcc2129d852cfbb1c48465/example_images/pauseMenu.png)

Level Titles - Another UI implementation I made was creating gold-colored titles when each level begins that show at the center of the screen and linger for a second before fading over the course of a second after that. Figuring out how to do this using a Timer and then using a tween object to transition the opacity of the title from fully opaque to transparent was difficult the first time and for the first level it could be accomplished just by doing so in _ready() but for level two we needed to send a signal from the level two trigger area nodes to the scripts for the level two title label. This is how the labels look when displaying for Level 1 and Level 2: 
![](https://github.com/Echo108471/MonkeyTrenchOffense/blob/d3492b2621ee954224fcc2129d852cfbb1c48465/example_images/levelOne.png)
![](https://github.com/Echo108471/MonkeyTrenchOffense/blob/d3492b2621ee954224fcc2129d852cfbb1c48465/example_images/levelTwo.png)

Game Over/Game Won Screens - The final major UI components I made were the Game Over Screen and Game Won Screen. The Game Over Screen was like a simplified version of the Main Menu since we just needed to add some buttons to the center and display them over a background image, which was once again drawn by Minji, and so we didn't need to worry about having a blurred panel this time, so we could cut out the ColorRect node from the structure used in the Main Menu. The buttons on the Game Over Screen include 'Main Menu', 'Restart', and 'Quit'. The Game Won Screen was even simpler as it used just an image in the background drawn by Minji and then a label for 'GAME WON' at the bottom. These were also kept as scenes separate from the World scene used for gameplay, and the player dying triggers the scene switching to the Game Over scene while the player reaching the golden finish line at the end of level 2 triggers the scene switching to the Game Won scene. I also made the images for the finish lines of level 1 and level 2 by connecting different colored squares together to form a black/white and gold/white checkered patterns. Here are images for the Game Over Screen, Game Won Screen, and golden finish line:
![](https://github.com/Echo108471/MonkeyTrenchOffense/blob/d3492b2621ee954224fcc2129d852cfbb1c48465/example_images/gameOverScreen.png)
![](https://github.com/Echo108471/MonkeyTrenchOffense/blob/0ce5e284ad22ef14171ae7adcc24a8d17ee0766c/example_images/gameWon.png)
![](https://github.com/Echo108471/MonkeyTrenchOffense/blob/0ce5e284ad22ef14171ae7adcc24a8d17ee0766c/example_images/finish_line_final.png)

**Describe the default input configuration.**
**Add an entry for each platform or input style your project supports.**


## Audio -- Ryan Ffrench

**List your assets, including their sources and licenses.**
Game Music: "[Mystic Forest](https://youtu.be/sSmseFKxw1I?si=59ohjdtooL_0dEvV)" By HeatleyBros - Free for non commercial use

Title Screen Music: "[8 Bit Beginning](https://www.youtube.com/watch?v=ptlYSrZU_ZU&list=LL&index=2)" By HeatleyBros - Free for non comercial use

Game Over Music: "[8 Bit Evil](https://www.youtube.com/watch?v=sVCeqYmRwJ0&list=LL&index=3)" By HeatleyBros - Free for non comercial use

Game Win Music: "[Level Up Theme Song](https://www.youtube.com/watch?v=TiE9Vvmlxew&list=LL&index=4)" By HeatleyBros - Free for non comercial use

Dart Monkey Sound: "[Dart Sound Effects](https://www.youtube.com/watch?v=FqLYIUOYVgw)" By Sound Effects Store - Copyright Free

Lead Balloon Hit: "[Bullet Hits Metal Ricochet Free Sound Effects](https://www.youtube.com/watch?v=1QUcxXGGRPA&list=LL&index=7)" By Isolation Music - Copyright Free

Balloon Hit: "[Balloon rubbing with hands sound effect stereo HQ 96kHz](https://www.youtube.com/watch?v=Z5EKTfx0GdE&list=LL&index=5)" By Picture to Sound  - Copyright Free

Slow Zone: "[Pop Sound Effects](https://www.youtube.com/watch?v=BYPqS0YPxh8) By Creator Assets - Copyright Free

Bomb Explosion: "[8-Bit Explosion Sound Effects](https://www.youtube.com/watch?v=EA4h8l2zZ1g&list=LL&index=1)" By Creator Assets - Copyright Free

Bomb Fuse: "[Hot Sizzling Sound Effect](https://www.youtube.com/watch?v=viVDNzFZ0GE&list=LL&index=2)" By copyright free sound-effect - Copyright Free

Dash: "[Wind Sound FX](https://www.youtube.com/watch?v=KwGYAfh0K3w)" By Sound FX - Copyright Free

Balloon Pop: "[Balloon Pop Sound Effect](https://www.youtube.com/watch?v=W6dIocG78U8) By Sound Effects Download - Copyright Free

Collectible: "[8-Bit Powerup Sound Effects](https://www.youtube.com/watch?v=SoZhpnTuQBo)" By Creator Assets - Copyright Free

**Describe the implementation of your audio system.**
Implementing the audio system for the game was harder and more time consuming than it should have been. I initially had an audio system using signals and a SoundManager class similar to exercise #3, but baffling errors resulted in me pivoting to a scene based implementation where every scene has the relevant audio nodes attatched. I added a large number of sound effects and a few music tracks. I made sure to pay attention to small details for example, having a different damage sound when the player is the lead balloon. As for creation, I primarly downloaded royalty free SFX and music tracks I liked from Youtube, and modified them (sometimes extensively) in Audacity.

**Document the sound style.** 
Sound effects are important to our gameplay. If a player cannot hear the projectiles being thrown at them it is much harder to avoid them. With this in mind I designed the sound effects to be distinct from each other so that each tower has its own sound profile. I also picked background music that is more ambient and mellow, so the sound effects are not drowned out. For the soundfont I was inspired by an indie game I like called Golf Story. It has mostly chiptune music, but regular SFX which helps the SFX have contrast with the music.


## Gameplay Testing - Richard Shi

Due to the tight schedule, our game was not in a state to gather meaningful feedback during the GDAC event. Consequently, I collected feedback from a number of friends, classmates, and roommates during the development process, which contributed to many changes that made their way into the game.

Listed below are some of the most prominent feedback with visible effects on the final product:

Janky movement: Early feedback commented on the "janky" feeling of player movement, mostly while using my initial unrefined movement physics and early iterations of the current system. Consequently, much attention went into the acceleration/decceleration of the player, dash speed and cooldowns, etc. in order to create a player entity that felt like an extension of the player. The presence of a team member dedicated primarily to handling the movement behaviors of the player proved highly valuable.

Screen size: One problem we had was towers shooting from far off-screen, which eventually led to a full readjustment of entity scales across the board once the maps were largely finished and proper testing around the levels could begin. Initial settings were too zoomed in and various entities (namely some towers compared to the player) were disproportionate in size, which has since been adjusted significantly. Things look mostly proportional now.

Tower range visibility: An early complaint that went hand in hand with the screen size issue was the uncertainty of tower range. Once visible debug collision shapes were turned off, there was no clear indicator of being within range of a tower other than it swivelling to face the player, or simply being shot by the tower. As a result, I added a visible dark gray circle around towers, scaled to the size of their range, as an indicator. Further feedback prompted me to make the range indicators only appear once the player entered the range of a tower so as to remove clutter from the screen and not give away off-screen towers too much.

Lack of UI: An early complaint was that the game lacked any kind of UI or end screen (since the game simply quit on death during early development). This has since been alleviated by the introduction of UI and an end screen and no longer quitting on death.

Bomb telegraphing: The bomb tower is particularly devastating due to its unique AOE attack, which led to feedback requesting clearer telegraphing. The initial bomb projectile had poor indication of its explosion behavior. This has since been fixed by two measures. First, I refined the timing of the hitboxes for the explosion to more closely match the visible animation. Second, I added an animated pointlight2d to the bomb which burns down the length of the fuse prior to detonation. This latter effect is subtle but was received positively by those who broached the feedback. Together these two changes made the bomb tower much easier to read for players.

Getting stuck: Some locations, such as parts of the far right side of map1, had certain gaps that made it possible to get stuck. Small map adjustments and later placements of finishing points and towers made these issue significantly less pressing.

Hitbox size: Initially, the player's hitbox and collision hull were both scaled exactly to the size of the balloon sprite. However, in practice, this led to the feedback of being unfairly hit by certain projectiles. As a result, there was work in scaling down these boxes in order to improved the perceived fairness of hitreg.


## Narrative Design -- Minji Yun
- After thorough discussion with the team members, we decided to take the classic Bloons TD and put a spin on it. Now the player is the balloon and the towers are monkeys. We also decided to go with non-pixelated, smooth visuals, as Bloons TD does the same.
- Characters:
  - Balloons: Red, Blue, Green, Beast, Lead, Black Hole
  - Monkeys: Multishot, Ice, TNT
- Each monkey type has different tails. Normal monkey has an initial M in its tail, Ice monkey has an initial I in its tail, TNT monkey has TNT in its tail.
  - TNT monkey is holding a TNT on its left hand to give it a more unique look.
  - Normal monkey has the default monkey color, Ice monkey is blue, TNT monkey is red.
- Base storyline/Ideas behind the game:
  - The original Bloons TD is described from the monkeys' point of view, and sees the balloons as mere poppable objects. We wanted to deliver how scary that game situation is in balloons’ point of view. 
  - The monkeys are mad at the balloon, and the balloon has to escape with some help from upgrade items and extra layers given for itself.
  - The start menu screen suggests that there is an active war, while also portraying how perplexed the balloon feels about the situation. The tension is strong.
  - Win screen: The balloon is happy that it escaped successfully.
  - Defeat screen: The dart popped the balloon and it deflated due to that. There is a  monkey grim reaper standing near, waiting to take the balloon’s soul with them.
- Message behind the game:
  - Don’t mess with the monkeys!



## Press Kit and Trailer -- Ryan Ffrench

[Trailer](https://youtu.be/i8l6JdhSNFc?si=5tn6Pdlufj88c8pC) - Resources used linked in video description and in endcard.
[Press Kit](https://ryanffrench.github.io/MonkeyTrenchOffense-PressKit/)  

**Describe how you showcased your work. How did you choose what to show in the trailer? Why did you choose your screenshots?**
Creating the press kit and trailer was straightforward but time-consuming. For the trailer, I knew I wanted an over-the-top, exaggerated style with so many cuts it almost makes you ill. I came up with a script, toned it down to make it less ridiculous, and then ran it through a text-to-speech website. From there, I took the most visually engaging parts of our game: the action sequences where the player has to dodge projectiles and mashed them together with stock footage of people playing video games. I did my best to make the game look fun and engaging. The trailer is meant to be ligthhearted, our game is a parody after all. For the press kit I was confused as to how to implement the resource linked. I don't have a webserver that I can run php on, so I made a basic website (HTML, CSS) and hosted it on GitHub pages. My methodology for what to feature was largely the same as the trailer. I tried to make the screenshots visually interesting by capturing scenes where many projectiles/enemies are on screen. I found some of the examples from prior years greatly helpful for figuring out how I wanted to format everything and what information to include.



## Game Feel and Polish

### Ben Young

*Bomb Tower "launching"* - Using a bezier curve (found in [GDscript documentation](https://docs.godotengine.org/en/stable/tutorials/math/beziers_and_curves.html)), I was able to simulate a parabolic trajectory for the bomb projectile, [adjusting the scale](https://github.com/Echo108471/MonkeyTrenchOffense/blob/ab6c1c7dbcd23f790b4e8def95486a48109ecc82/monkeytrenchoffense/Scenes/projectiles/bulletBomb.gd#L21) of the sprite to simulate depth in our otherwise 2D game. I also adjusted the movement of the projectile so that it targets the player's position, rather than flying in the direction of the player for a set amount of time, which often resulted in the bomb missing the player completely. This change differentiated the bomb tower and made it more threatening to the player.

*Reducing Player hurtbox* - In many bullet hell games, or even platformers, the characters hurtbox is significantly smaller than the sprite would make it seem. This is to minimize the risk of "how did that hit me ?!" moments, and increase the "phew, can't believe I made it!" moments. Because it's just a singleplayer game, fairness is not really a concern, so it's best to err in the favor of the player. In some games, the hurtbox is as small as a single pixel. For our game, I adjusted it to be about half the size of the sprite, to have some fairness but not confuse the player with projectiles passing right through them.  

*Tutorial Text* - I added a simple tutorial text using a [keyboard tilemap](https://gerald-burke.itch.io/geralds-keys) to show the player the controls without a popup interrupting the game. I felt this simple approach was good enough since the controls for our game are mostly straightforward

![In-game Tutorial](https://github.com/Echo108471/MonkeyTrenchOffense/blob/main/example_images/tutorial.png)

*Code improvements* - I tweaked many features in the code of our game to make it more extensible and easier to integrate with new features. For the turrets and projectiles, I adjusted the OOP framework setup by Richard to give more power to the base class, and reduce the amount of repeated code in the subclasses (used above for the launching animation for example). This helped during development a lot as there was often changes which should apply to all subclasses. I also set up the scene defaults to make use of [Godot's export tag](https://github.com/Echo108471/MonkeyTrenchOffense/blob/ab6c1c7dbcd23f790b4e8def95486a48109ecc82/monkeytrenchoffense/Scenes/turrets/turretBase/turret_base.gd#L6), which exposes scene properties inside the editor. This was important for our game since we have many copies of each tower which we may want to adjust individually, rather than applying the same properties to all instances of that scene.

*Map improvements* - I was able to reconfigure the TileMap we had implemented to properly reflect the size of our tile assets, which made the workflow much smoother and consistent. Without the proper tile size, the textures do not tile and there is visible edges between subtiles. This is a tradeoff however, as Eugene was able to make some awesome maps using these smaller subtiles which is not possible using full sized tiles    

In general, scripts became much shorter by removing duplicated code, increasing the density of meaningful code which helps make changes faster. 


## Level Feel (Eugene Cho)



To enhance the level feel of the game, I developed several power-ups and obstacles that players can encounter while traversing the map. These elements aim to add dynamic gameplay interactions and create variety in the player experience.



### 1. **Speed Coin**

The **Speed Coin** is a power-up that temporarily increases the player's movement speed upon collection. It incentivizes exploration and rewards players for venturing into certain areas of the map. The script works by creating a simple one shot timer that multiplies `player.movement_speed` - the maximum movement speed by a certain amount until the timer ends, where the player speed boost is removed and the node then deleted. Notably, while the speed boost is active, the node just turns invisible, and deletes itself at the end of the timer to avoid giving the player an infinite speed boost.



- **Scripts**:

  - [Speed Coin `.gd` file](https://github.com/Echo108471/MonkeyTrenchOffense/blob/main/monkeytrenchoffense/Scenes/projectiles/power_up_coin.gd)

- **Scene**:

  - [Speed Coin `.tscn` file](https://github.com/Echo108471/MonkeyTrenchOffense/blob/main/monkeytrenchoffense/Scenes/projectiles/power_up_coin.tscn)



---



### 2. **Slow Area**

The **Slow Area** is an obstacle that reduces the player's movement speed when they enter its range. This mechanic introduces strategic planning to avoid slowing down in critical moments, adding a layer of challenge to navigation. The slow area works very similarly to the speed boost coin, where instead of speeding, it slows down the player whenever they enter the `Area2D`.



- **Scripts**:

  - [Slow Area `.gd` file](https://github.com/Echo108471/MonkeyTrenchOffense/blob/main/monkeytrenchoffense/Scenes/projectiles/slow_area.gd)

- **Scene**:

  - [Slow Area `.tscn` file](https://github.com/Echo108471/MonkeyTrenchOffense/blob/main/monkeytrenchoffense/Scenes/projectiles/slow_area.tscn)



---



### 3. **TNT**

The **TNT** obstacle is an explosive hazard that can explode and damage the player after a countdown if a player comes near. It adds tension and forces careful movement in areas where TNT is placed. The TNT is a simple one shot timer, that starts when the player enters a certain area around the TNT. After the timer is over, the TNT calculates the distance from the player, and if the distance is within a certain amount, the player receives damage.



- **Scripts**:

  - [TNT `.gd` file](https://github.com/Echo108471/MonkeyTrenchOffense/blob/main/monkeytrenchoffense/Scenes/projectiles/tnt.gd)

- **Scene**:

  - [TNT `.tscn` file](https://github.com/Echo108471/MonkeyTrenchOffense/blob/main/monkeytrenchoffense/Scenes/projectiles/tnt.tscn)

---

### 4. **Map Teleporter**

I additionally implemented a map teleporter that teleports the player automatically to the next stage when the player enters a certain zone. This works almost exactly like the cutscene starter from the command exercise, where the player is automatically teleported to a certain position.


- **Scripts**:

  - [second_level_trigger `.gd` file](https://github.com/Echo108471/MonkeyTrenchOffense/blob/main/monkeytrenchoffense/Scripts/second_level_trigger.gd)




