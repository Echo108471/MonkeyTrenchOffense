# Monkey Trench Offense #

## Summary ##

In our game you play as a balloon trying to escape evil monkeys that have trapped you and your fellow balloons. You must dodge the projectile attacks from numerous monkeys like bomb monkeys that throws massive amounts of TNT at you, dart monkeys that throw needle sharp arrows, and ice mokeys that hurl freezing icicles. With no ability to fight back, your only options are to run, dash, and outmaneuver the relentless attacks. The further you progress, the more challenging the enemies and obstacles become as you strive for freedom.

## Project Resources

[Web-playable version of your game.](https://itch.io/)  
[Trailor](https://youtube.com)  
[Press Kit](https://dopresskit.com/)  
[Proposal: make your own copy of the linked doc.](https://docs.google.com/document/d/1XfRfDoN-Fm2vW_cJ7vQpI7-b4w9EeZ0zoOBdrwvnYzk/edit?tab=t.0#heading=h.i3tv2mxf7h7z)  

## Gameplay Explanation ##

**In this section, explain how the game should be played. Treat this as a manual within a game. Explaining the button mappings and the most optimal gameplay strategy is encouraged.**
Your goal is to dodge projectiles and obstacles as you navigate through the levels to reach freedom. The controls are simple:

## Controls:
- **Arrow Keys / WASD**: Use these keys to move your balloon in any direction. 
  - **Up / W**: Move Up
  - **Down / S**: Move Down
  - **Left / A**: Move Left
  - **Right / D**: Move Right
  - **E**: Cycle Through Upgrades (test input)
- **Spacebar**: Use the spacebar to dash quickly in the direction you're moving. This will help you evade incoming attacks, but use it wisely, as the dash has a cooldown period.

## Gameplay Strategy:
1. **Dodge and Dash**: Your main defense is your ability to move and dash. Keep an eye on the approaching enemies and their projectiles. Time your dash carefully to avoid explosions, arrows, and icicles.
2. **Enemy Patterns**: Different monkeys throw different types of projectiles, each with its own behavior. Bomb monkeys will throw large TNT that explode after a short delay, dart monkeys will shoot fast arrows in predictable patterns, and ice monkeys will throw icicles that slow you down. Learn their patterns and use your dash strategically to evade them.
3. **Positioning**: Always keep an eye on the terrain and use it to your advantage. Some areas may provide more room to maneuver, while others might be more dangerous due to tight spaces and numerous enemies.
4. **Use the Dash Sparingly**: The dash is a powerful tool, but it has a cooldown period. Use it when you absolutely need to escape or quickly change direction. Overusing it may leave you vulnerable.
5. **Level Progression**: Each level gets progressively more difficult with additional enemies and faster projectiles. Stay alert and adapt your strategy as the challenges increase.

Good luck, and may you escape the monkeys’ clutches!

**Add it here if you did work that should be factored into your grade but does not fit easily into the prescribed roles! Please include links to resources and descriptions of game-related material that does not fit into roles here.**

# External Code, Ideas, and Structure #

If your project contains code that: 1) your team did not write, and 2) does not fit cleanly into a role, please document it in this section. Please include the author of the code, where to find the code, and note which scripts, folders, or other files that comprise the external contribution. Additionally, include the license for the external code that permits you to use it. You do not need to include the license for code provided by the instruction team.

If you used tutorials or other intellectual guidance to create aspects of your project, include reference to that information as well.

# Main Roles #

Your goal is to relate the work of your role and sub-role in terms of the content of the course. Please look at the role sections below for specific instructions for each role.

Below is a template for you to highlight items of your work. These provide the evidence needed for your work to be evaluated. Try to have at least four such descriptions. They will be assessed on the quality of the underlying system and how they are linked to course content. 

*Short Description* - Long description of your work item that includes how it is relevant to topics discussed in class. [link to evidence in your repository](https://github.com/dr-jam/ECS189L/edit/project-description/ProjectDocumentTemplate.md)

Here is an example:  
*Procedural Terrain* - The game's background consists of procedurally generated terrain produced with Perlin noise. The game can modify this terrain at run-time via a call to its script methods. The intent is to allow the player to modify the terrain. This system is based on the component design pattern and the procedural content generation portions of the course. [The PCG terrain generation script](https://github.com/dr-jam/CameraControlExercise/blob/513b927e87fc686fe627bf7d4ff6ff841cf34e9f/Obscura/Assets/Scripts/TerrainGenerator.cs#L6).

You should replay any **bold text** with your relevant information. Liberally use the template when necessary and appropriate.

## Producer - Ryan Ffrench

**Describe the steps you took in your role as producer. Typical items include group scheduling mechanisms, links to meeting notes, descriptions of team logistics problems with their resolution, project organization tools (e.g., timelines, dependency/task tracking, Gantt charts, etc.), and repository management methodology.**
My group was amazing which made my role as a producer go smoothly. We came up with an idea that is simple to understand, and allowed us to easily come to a consensus on what our game should look and feel like. One of the judges at the game jam even said that it was smart we made a game that was a spin on a preexisting game because so many design decisions had already been made. We were behind going into the first progress report, but this was due to it being Thanksgiving. Understandably people did not get as much work done over this time period as expected. I ensured everyone was on track by checking in with the group in a team group chat. Communication was great. When people had bugs or other issues the entire group did their best to help. The biggest issue we faced as a group was issues with Godot's (nonexistent) Git integration specifically with merge conflicts. We minimized this by using pull requests/different branches initially, and later by pushing only when a significant amount of work had been done and with warning to the rest of the team. I specifically commited my changes late at night with hours of advanced notice. Another notable thing I did was formulate a good quick pitch for our project and come up with a way to present our game in an engaing way that showed off its strengths during the Final Festival. 

## User Interface and Input

**Describe your user interface and how it relates to gameplay. This can be done via the template.**
**Describe the default input configuration.**

**Add an entry for each platform or input style your project supports.**

## Movement/Physics

**Describe the basics of movement and physics in your game. Is it the standard physics model? What did you change or modify? Did you make your movement scripts that do not use the physics system?**

## Animation and Visuals

**List your assets, including their sources and licenses.**

**Describe how your work intersects with game feel, graphic design, and world-building. Include your visual style guide if one exists.**

## Game Logic

**Document the game states and game data you managed and the design patterns you used to complete your task.**

# Sub-Roles

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
Implementing the audio system for the game was harder and more time consuming than it should have been. I initially had an audio system using signals and a SoundManager class similar to exercise #3, but baffling errors resulted in me pivoting to a scene based implementation where every scene has relevant audio nodes attatched. I added a large number of sound effects and a few music tracks. I made sure to pay attention to small details like having a different damage sound when the player is the lead balloon. As for creation, I primarly downloaded royalty free SFX and music tracks I liked from Youtube, and modified them in Audacity.

**Document the sound style.** 
Sound effects are important to our gameplay. If a player cannot hear the projectiles being thrown at them it is much harder to avoid them. With this in mind I designed the sound effects to be distinct from each other so that each tower had its own sound profile. I also picked background music that is more ambient and mellow, so the sound effects are not drowned out. For the soundfont I was inspired by an indie game I like called Golf Story. It has mostly chiptune music, but regular SFX which helps the SFX have contrast with the music.


## Gameplay Testing

**Add a link to the full results of your gameplay tests.**

**Summarize the key findings from your gameplay tests.**

## Narrative Design

**Document how the narrative is present in the game via assets, gameplay systems, and gameplay.** 

## Press Kit and Trailer -- Ryan Ffrench

**Include links to your presskit materials and trailer.**

**Describe how you showcased your work. How did you choose what to show in the trailer? Why did you choose your screenshots?**
For the screenshots and the trailer, I chose the parts of the game that are the coolest. Specifically, I made sure to show off the Bomb Monkey and Ice Monkey. I tried to go for an over the top funny editing style, because it fits with our game well.

## Game Feel and Polish

**Document what you added to and how you tweaked your game to improve its game feel.**
