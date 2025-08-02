# Soda AudioManager 1.1

*Plugin created and tested exclusively on Godot 4.3 and 4.4.*
*Created by Alexsander Oliveira de Almeida(CyNoctis)*

## Changes from version 1.1
- Plugin code optimization
- Some function and parameter names have been changed to improve clarity and understandability.
- Error and warning callouts have been added to critical code points. It's now easier to understand when an error occurs due to the plugin.

## Overview

Soda AudioManager is a global plugin for Godot, designed to handle non-spatial sounds, including interface sound effects, background music, and general sound effects. It offers an easy way to manage audio playback, control volumes, apply sound effects, and configure looping.

---

## Installation

### Step 1: Download

- Download the plugin package.
- Extract the contents to a local directory.

### Step 2: Install and Activate

1. Copy the `addons` folder to your project’s root directory.
2. Open your Godot project.
3. Go to **Project -> Project Settings -> Plugins**.
4. Locate the "SodaAudioManager" plugin and enable it by checking the box.

---

## Usage Guide

To use the plugin, call its functions in your scripts whenever you need to play, stop, or pause audio.

### Music Functions

```gdscript
SodaAudioManager.play_music(soundPath: String, loop: bool, fade: bool = false, fade_duration: float = 1.0)
```

*Plays background music from a specified file.*

- **soundPath:** Path to the audio file as a string (e.g., "res\://path/to/music.ogg").
- **loop:** Determines if the music loops (true/false). Only .ogg and .mp3 formats support looping; .wav files are not supported.
- **fade:** Enables a fade-in effect when starting the audio.
- **fade_duration:** Sets the fade-in duration in seconds (default is 1.0).

```gdscript
SodaAudioManager.pause_play_music()
```

*Pauses or resumes the currently playing music.*

```gdscript
SodaAudioManager.stop_music(fade: bool, fade_duration: float = 1.0)
```

*Stops the currently playing music.*

- **fade:** If true, applies a fade-out effect before stopping.
- **fade_duration:** Sets the fade-out duration in seconds (default is 1.0).

### Sound Effects (SFX)

#### Interface SFX

```gdscript
SodaAudioManager.play_ui_sfx(soundPath: String)
```

*Plays interface sound effects.*

- **soundPath:** Path to the audio file as a string.

#### General SFX

```gdscript
SodaAudioManager.play_sfx(soundPath: String)
```

*Plays general sound effects.*

- **soundPath:** Path to the audio file as a string.

```gdscript
SodaAudioManager.update_volume(MusicVolumeGlobal: float, sfxUiVolumeGlobal: float, sfxVolumeGlobal: float)
```

*Updates the volume of the plugin's audio players.*

---

## Tips for Integration

If your game uses a configuration system with settings stored in a file, integrating it with `SodaAudioManager` is simple. Just call the update_volume() function and pass it the volume parameters from your global configuration node or from your game's interface buttons. Below I show an example where you store your game's volume values in a global script called **GlobalConfig**

**Example:**

```gdscript
SodaAudioManager.update_volume(GlobalConfig.musicVolume, GlobalConfig.uiVolume, GlobalConfig.sfxVolume)
```

This ensures consistency with your game’s audio settings.

---

## Feedback and Contributions

Questions, suggestions, and contributions to improve this plugin are always welcome! Feel free to open discussions and submit issues or pull requests on GitHub!

