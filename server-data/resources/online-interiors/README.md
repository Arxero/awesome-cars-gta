# Online Interiors

This repository is a FiveM resource created by Cloudy that adds ipl/map edits, teleports, and blips to the world of GTA 5.

This fork adds a fix for Franklin's mansion after the mpsecurity update, (courtesy of GTA5Mods member, katsutosh) as well as adds teleporters and blips for Diamond Casino & Resort, Los Santos Tuners, and The Contract (aka mpsecurity).

----------------------

## Information - Cloudy

- I basically did all the work of coordinates and ipl interior editing so you don't have to.
- Please make sure to read the whole README for everything to work correctly.
- Since the last update, I have removed the map edits folder. To get the map edits go here: <https://github.com/cloudy-develop/online-interiors-maps>
- Online Interior Map Edits will remove some annoying obstructions around a few of the interiors.

----------------------

## How to Install

1. Run CMD in your "resources" folder and type "git clone <https://github.com/TayMcKenzieNZ/online-interiors.git>".

Alternatively, you can download the **zip** folder from above and put the files in your **"resources"** folder.

2. Download the latest version of "bob74_ipl" from "https://github.com/Bob74/bob74_ipl/releases" and place the folder in the "resources" folder. 

If any of the interiors clash or flicker, comment them out of bob74_ipl, as I have already configured them.

**(MUST BE NAMED "bob74_ipl" AND BE DIRECTLY IN RESOURCES FOLDER)**

3. Download the latest recommended artifacts [for Windows](https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/) **or** [for Linux](https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/)

4. Enforce the Gamebuild to 2545 [How To Enforce Gamebuild [Tutorial]](https://forum.cfx.re/t/tutorial-forcing-gamebuild-to-casino-cayo-perico-or-tuners-update/4784977)

5. Ensure "bob74_ipl" and "online_interiors" in your "server.cfg". **("bob74_ipl" MUST BE STARTED BEFORE "online_interiors")**

7. Enjoy your interiors.

----------------------

## Resource List

```cfg
ensure bob74_ipl
ensure online_interiors
```

----------------------

### Note from Cloudy

- I wanted to do this because I've never really seen something with Teleports and Blips, without relying on ESX, VRP or other frameworks.
- I hope you can enjoy, I put in a lot of hours to complete this.
- Also, I put in a lot of work so please don’t go around saying you did all of this stuff, because you didn’t.

----------------------

### Note from TayMcKenzieNZ

I admire Cloudy and Bob's efforts and by no means do I take any credit. I have simply continued their legacy in updating this resource for use with interiors featured in the Contracts DLC aka mpsecurity / 2545, as well as added fixes and additional props.

These fixes and additions include:

- Fixed Franklin's couch at his mansion, courtesy of [katsutosh](https://www.gta5-mods.com/maps/fix-franklin-interior-after-mpsecurity-update)

- Fixed collisions and windows at Therapist Office, courtesty of [LBCustoms](https://forum.cfx.re/u/lbcustoms/summary)

- Comedy Club Collision fix, courtesy of [Nowimps8](https://github.com/Nowimps8)

- Added  additional chairs inside Franklin and MP Agency Offices

- Removed obstructing object from a TV prop on 2nd floor of Agencies, allowing players visible access when rendering videos to the screen via [pmms by Kibook](https://github.com/kibook/pmms) or other scripts.

- Changed sunlounger prop on music studio rooftop to work alongside [fivem scenarios script](https://github.com/kibook/fivem-scenarios)

- Replaced small TV in studio smoke room (with logos covering screen) with a better tv prop, allowing players visible access when rendering videos to the screen via hypnonema or other scripts

- Fixed Tuners exterior garage door from opening 

- Removed obstructing collisions from Tuners Car Meet interior

- Removed gates from Tuners Car Meet interior for vehicle access

- Removed annoying doors from penthouse office and penthouse cinema as they do not open and close correctly

- Removed tables and their respective collisions from agency 2nd floor living room and replaced with better table and props, allowing access to sit down and actually watch rendered content on the TV prop

- Added Lucky Wheel prop to Casino

- Configured Casino Vault entitysets and removed doors leading to it


- Added breakable glass on FIB rooftop

----------------------

# Bahama Mamas Club 🍸

I have added a map blip for this club, however by default, you can't enter it; this was done by Rockstar Games themselves.

There as no teleports as I didn't think this was necessary, plus there are a ton of paid and free MLO resources for this club.

You can however add a folder to the `stream` folder and add access to the club using this resource here:

[Bahaha Mamas - Add Doors](https://github.com/TayMcKenzieNZ/nw_bahamaMama)

- Grab all the files from the `nw_bahamaMama/stream` folder

- Create a new folder inside online-interiors `stream` folder and name it `Bahama Mamas`

- Paste the copied files inside this folder

You're all set 😃

----------------------

# Arcade 🕹️

Due to the original arcade location being difficult to customize and codewalker not loading it, I was unable to configure it and get it working, therefore I have not added any teleporters or blips. 

You can however find arcade related MLOs that won't clash with this resource, for example:

[MLO Arcade Bar Interior by kiiya](https://www.gta5-mods.com/maps/arcade-bar-interior-mlo-fivem-sp).

There does not appear to be a basement for this MLO, however it will at least add the arcade to your server.

# FAQ 

**Q When I visit a particular location, it loads, however it flickers through different walls and floors etc?**

**A:** Check the `online-interiors/client/maps/` as I have configured and provided IPLs and entitysets for some locations, which could be clashing with your copy of bob74_IPL. 

You can simply set it up how you prefer, or comment it out of the fxmanifest.

----------------------

**Q: I have custom MLOs in my server, can I use this resource to add map blips for them?**

**A:** You most certainly can. You may use this resource ***in it's entirety*** to open `online-interiors/client/blips.lua` and add it after the last one in the list like so:

```lua

-- Custom MLO Name Here

    {text = "Custom MLO Name Here", color = X, sprite = XXX, coord = vector3(XXX.XX, XXX.XX, XX.XX)},
```

Enter a name for the MLO / location then provide a [color and sprite number](https://docs.fivem.net/docs/game-references/blips/) and the coordinates.

----------------------

**Q: I have an MLO that has an elevator, can I use this resource to teleport between them?**

**A:** You may use this resource ***in it's entirety*** to add teleports if you wish to.

Open `online-interiors/client/teleports.lua` and have a look at how I have done the Casino Elevators. This should give you a rough idea of how it's done.

----------------------

**Q: How can I enable or restrict vehicle access to / from a location?**

**A:** You can add `, veh = false` to the end of your teleport locations in the `online-interiors/client/teleports.lua`.

Example:

```lua
[XX] = {text = "Helipad", dest = {XX, XX, XX, X}, coord = vector3(XX.XX, XX.XX, XX.XX), h = XXX.XX, veh = false},
```

Players can access the teleporter on foot but will be denied if they are in / on a vehicle.

----------------------

## Thanks 🙏

**Huge thanks to:**

- [AvaN0x](https://github.com/AvaN0x)

- The community over at [the FiveM forums](https://forum.cfx.re/t/the-contract-infos-build-2545/4792123)

- [Cloudy](https://github.com/cloudy-develop)

- [Bob74](https://github.com/Bob74)

- [katsutosh](https://www.gta5-mods.com/users/katsutosh)

- [LBCustoms](https://forum.cfx.re/u/lbcustoms/summary)

- [Nowimps8](https://github.com/Nowimps8)

