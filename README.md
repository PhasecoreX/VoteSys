# VoteSys
A new, independent implementation of map vote.

* Unlimited number of presets
* Unlimited number of maps
* Quicker transfer of data to clients

Servers must run at least UT v469b.  
Clients must run at least UT v436.

## Installation
1. Make sure the VoteSys .u and .int files are in the System folder
2. Add VoteSys mutator to URL when starting the server
3. Add VoteSys to list of ServerPackages in INI

## Server Setup

Server settings are split between multiple INI files.
* VoteSys.ini
* VoteSysPresets.ini
* VoteSysMapLists.ini

### VoteSys.ini
```ini
[VoteSys.MutVoteSys]
GameEndedVoteDelay=5
VoteTimeLimit=30
DefaultTimeMessageClass=Botpack.TimeMessage
DefaultPreset=

[VoteSys.VS_DataServer]
LocalAddr=127.0.0.1
```

### VoteSysPresets.ini
```ini
[VS_PresetConfig0]
PresetName=DeathMatch
Abbreviation=DM
Category=DM
Game=Botpack.DeathMatchPlus
MapListName=CustomMapList
Mutators=
Parameters=
GameSettings=

[VS_PresetConfig1]
PresetName=Team DeathMatch
Abbreviation=TDM
Category=DM
Game=Botpack.TeamGamePlus
MapListName=
Mutators=
Parameters=?MaxPlayers=8
GameSettings=bTournament=True
```

### VoteSysMapLists.ini
```ini
[CustomMapList]
Map=DM-Deck16][
Map=DM-Agony
Map=DM-StalwartXL
Map=DM-Morpheus
```

## Build
In order to build this mutator, you need to have UT99 v469b installed.

1. Go to the installation directory of UT99 in a command shell
2. Use `git clone https://github.com/Deaod/VoteSys` to clone the repo
3. Navigate to the newly created directory `VoteSys`
4. Execute `Build.bat`
5. The result of the build process will be available in the `System` folder that is next to `Build.bat`