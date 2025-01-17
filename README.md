# bcc-legendaries

## Description
> The Legendary Hunting Script is a comprehensive and immersive addition to your gaming experience, designed to bring the thrill of hunting legendary animals to life. This script introduces a variety of legendary creatures, each with unique characteristics, behaviors, and rewards, making every hunt a memorable adventure.

## Features

- #### Diverse Legendary Animals:
  - The script includes a wide range of legendary animals, from the elusive Legendary Pronghorn to the formidable Legendary Golden Spirit Bear. Each animal has its own unique model, health attributes, and spawn coordinates, ensuring a varied and challenging hunting experience.

- #### Detailed Hunt Configurations:
  - Each legendary animal comes with a detailed configuration that includes:
    - Name: The unique name of the hunt.
    - Location: The specific shop or area where the hunt can be initiated.
    - Level: The trust level required to start the hunt.
    - Currency: The type and amount of currency needed to begin the hunt.
    - Health: The health points of the legendary animal.
    - Spawn Coordinates: The exact location where the animal will spawn.
    - Rewards: The items and quantities awarded upon a successful hunt.

- #### Enemy NPCs and Secondary Animals:
  - To add an extra layer of challenge, the script includes enemy NPCs that players must defeat to progress in the hunt. These NPCs have their own models, blip coordinates, and hint boxes to guide players.
  - Secondary animals are also spawned to assist the legendary animal, making the hunt more dynamic and unpredictable.

- #### Hint Boxes and Blips:
  - Hint boxes provide initial clues to help players locate the legendary animal. Additional hint boxes become available after defeating enemy NPCs, guiding players deeper into the hunt.
  - Blips on the map help players navigate to the locations of enemy NPCs and hint boxes, ensuring they stay on track during the hunt.

- #### Rewards System:
  - Successfully completing a hunt rewards players with valuable items, such as legendary skins, antlers, and other rare materials. These rewards are unique to each legendary animal and can be used for crafting or selling.

- #### Cooldown Period:
  - Each legendary animal has a cooldown period before it can be hunted again, adding a strategic element to the game. Players must plan their hunts carefully to maximize their rewards and avoid waiting periods.

## How to Use:
- #### Initiate a Hunt:
  - Players can start a hunt by visiting the designated shop or location and selecting the legendary animal they wish to pursue.
  - Ensure they have the required trust level and currency to begin the hunt.

- #### Follow the Clues:
  - Use the initial hint box and blip coordinates to navigate to the legendary animal's spawn location.
  - Defeat any enemy NPCs along the way to unlock additional hint boxes and progress in the hunt.

- #### Engage the Legendary Animal:
  - Once the legendary animal is located, players must use their hunting skills to take it down. Be prepared for a challenging battle, as these animals have enhanced health and behaviors.

- #### Claim the Rewards:
  - Upon successfully defeating the legendary animal, players will receive their rewards. These can be used for various in-game purposes, such as crafting or selling for profit.

## Commands
 - `/hunterLevel` Players can check their current level

## Dependencies
- [vorp_core](https://github.com/VORPCORE/vorp-core-lua)
- [vorp_inventory](https://github.com/VORPCORE/vorp_inventory-lua)
- [bcc-utils](https://github.com/BryceCanyonCounty/bcc-utils)
- [feather-menu](https://github.com/FeatherFramework/feather-menu/releases)

## Installation
- Make sure dependencies are installed/updated and ensured before this script
- Add `bcc-legendaries` folder to your resources folder
- Add ensure 'bcc-legendaries' to your resources.cfg
- Run the included database file `legendaries.sql`
- Restart server

## Side notes
- Credit to vorp_hunting that is where i pulled the skinned.js and skinned.lua from and modified it to do what I want here.
- If you are adding new hunts in the config.lua please only use Legendary Animal models otherwise it could lead to duping bug
- This has a built in skinning system so if you have legendary animals setup in your hunting script remove them from the hunting script
- I really hope you enjoy the script thanks for trying it!
- I have optimized this code quite alot, but if you see any code that can be optimized further please open a pull request and I will take a look if it works I will merge it. Or just tell me lol.
- You can edit the code obviously. All I ask is that you release the edits to the community freely.

## GitHub
- https://github.com/BryceCanyonCounty/bcc-legendaries