# GridMTFix
A Race Driver: Grid Multithread Fix, for SteamOS or Linux

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

## Important Requirement
This scripts is expecting that you use Grid from Steam, and also, It expect you are using a DRMLess exe with a 4GB LAA patch applied.

It also expects that you already have Git installed.

If you have another release of the game, for instance, GOG release, you'll have to change the destination_folder and output_file paths to your liking before running the script.

## How to apply the fix
If you already have the requirements above done, the fix is easy to apply.

### 1-Download the fix to your home folder
```
git clone https://github.com/xatornet/GridMTFix.git
```

### 2-Set executable attributes to the script
```
cd GridMTFix/
chmod +x GridMTFix.sh
```

### 3-Execute the script
```
sh GridMTFix.sh
```
### If everything works, you can now play Race Driver: Grid making the most out of your hardware.
