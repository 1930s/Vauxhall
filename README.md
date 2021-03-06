# Vauxhall

## How To Play
1) Enter the directory containing the Vauxhall binary file
2) Run it using "./Vauxhall Name Mode" (Substituting "Name" for your players name, and "Mode" for ascii or unicode)

Ex: ```./Vauxhall Henning ascii```

Play with your Terminal window in fullscreen to avoid rendering issues

## Keys
* wasd - movement
* , - picks up item currently standing on
* o + a direction key - opens door in specified direction
* c + a direction key - closes door in specified direction
* i - Displays your current inventory (press another key to close)
* < or > - Goes up or down a floor (respectively) if you are standing on that character
* f - Displays your characters stats
* r - Rests and heals your character
* z - Drinks a potion (healing you) if you have any potions
* space bar - Interacts with a dialogue tile you are standing on, which is marked by a '?' on the map
* 'b' - like ',' but used to buy items in a shop instead of picking them up
* k + a direction key - Kick in given direction (damages enemy and pushes them in opposite direction)
* S (shift + s) - Save your game
* ? - display help screen

# Screenshots

Beginning of the game:

![](screenshots/mainMenu.png)

Picking a class:

![](screenshots/pickingClass.png)

Enter the first level:

![](screenshots/firstLevel.png)

Checking our stats:

![](screenshots/checkingStats.png)

Down to the second level:

![](screenshots/secondLevel.png)

When you die or quit:

![](screenshots/deathScreen.png)

## Dependancies
* [ANSI Terminal](https://hackage.haskell.org/package/ansi-terminal) - Used for rendering game.