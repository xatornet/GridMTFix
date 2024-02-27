# GridMTFix
A Race Driver: Grid Multithread Fix, for Windows OS

## A little insight
The game was launched on 2008, just prior to Intel's Sandy Bridge Core microarchitecture , which more or less marked a milestone on multithreading as we all know it nowadays.
So given that circunstance, the game already has support for 2 and 4 cores CPU, mostly from the Dual and Quad Core era. It even has a non-working 8 core support implemented (in fact, the 8 core worker map file is there, but the game won't make use of it on modern hardware and implements it weirdly).

EGO engine it has been vastly used on several titles from Codemasters, so I did a little investigation on other EGO 1.0 and 1.5 titles, and came up with a fix for that 8 core workermap.
Upon testing, I realized that the workermap could be extrapolated to more cores, so I made several other worker map files to support 8, 12, 16, 20, 24, 28 and 32 cores. I don't really know how much better the game will perform, but at least It won't hurt as much as being only using 4 cores max.

Also, this method fixes several other hardware detection problems as:
- Improper resolution detection
- Improper system internal rating
- Adds more granularity on the graphics settings

## What exactly does this fix?
Well, it copies my fix xml files to your game's system folder, and then using a template, will detect your CPU's logical cores, and create a personalized hardware restriction file, to make your the game uses the most amount of cores possible.

### * GOG Release / DRMless releases / Zoom Release
~~Gog release is already DRMless, so you only have to apply the 4GB LAA Patch. Use [NTCore's 4GB Patch tool](https://ntcore.com/?page_id=371) to patch the exe file and you are good to continue with the other steps of this document. I will later on update the releases with an automated one for GOG. Use version v0.1 till the new automated version arrives.~~

Use the v0.2.1 release now, be sure to select the GOG exe. It will automatically patch the exe file with the NTCore 4GB patch, and apply the MTFix.

### * Steam Release
~~Steam release has DRM, so if you apply the 4GB LAA Patch to it, it will fail. You have to remove it's DRM using [atom0s Steamless tool](https://github.com/atom0s/Steamless) and then, use the [NTCore's 4GB Patch tool](https://ntcore.com/?page_id=371) to patch the exe file. It's mandatory doing it in this exact order. Then, continue with this instructions.~~

Use the v0.2.1 release now, be sure to select de Steam exe, it will automatically patch the exe to remove DRM and apply the MTFix.

## How to apply the fix
If you already have the requirements above done, the fix is easy to apply.

### 1-Download the fix 
You can download the fix as is, but in order for Windows to be able to execute powershell scripts, you have to enable it through the admin powershell console. And it's tedious. That's why I've compiled with PS2exe the script into an EXE file. 

Download the file "GridMTFix_XXX.exe" (being XXX your selected flavour) and paste it on the main Race Driver Grid folder, just near the grid.exe file.

[Releases](https://github.com/xatornet/GridMTFix/releases)

### 2-Execute GridMTFix_XXX.exe
Let it do its things

### 3-Run the game and reconfigure it.
Your settings should be gone. Set them up again.

### If everything works, you can now play Race Driver: Grid making the most out of your hardware.

### * Strong Recommendation
I really encourage you to pair this fix with [DXVK from Doitsujin](https://github.com/doitsujin/dxvk) if your GPU is Vulkan capable. On my system I go from 180fps in race with D3D9 to 285fps with Vulkan. Give it a try!! 

