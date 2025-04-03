# Soda AudioManager 1.0

*Plugin created and tested exclusively on Godot 4.3 and 4.4.*

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
SodaAudioManager.play_music(sound_path: String, volume: float, loop: bool, fade_in = false, fade_duration: float = 2.0)
```

*Plays background music from a specified file.*

- **sound\_path:** Path to the audio file as a string (e.g., "res\://path/to/music.ogg").
- **volume:** Float value between 0.0 and 1.0 to set the volume.
- **loop:** Determines if the music loops (true/false). Only .ogg and .mp3 formats support looping; .wav files are not supported.
- **fade\_in:** Enables a fade-in effect when starting the audio.
- **fade\_duration:** Sets the fade-in duration in seconds (default is 2.0).

```gdscript
SodaAudioManager.pause_music()
```

*Pauses or resumes the currently playing music.*

```gdscript
SodaAudioManager.stop_music(fade_out: bool, fade_duration: float = 2.0)
```

*Stops the currently playing music.*

- **fade\_out:** If true, applies a fade-out effect before stopping.
- **fade\_duration:** Sets the fade-out duration in seconds (default is 2.0).

### Sound Effects (SFX)

#### Interface SFX

```gdscript
SodaAudioManager.play_interface_sfx(sound_path: String, volume: float)
```

*Plays interface sound effects.*

- **sound\_path:** Path to the audio file as a string.
- **volume:** Float value between 0.0 and 1.0 to set the volume.

#### General SFX

```gdscript
SodaAudioManager.play_sfx(sound_path: String, volume: float)
```

*Plays general sound effects.*

- **sound\_path:** Path to the audio file as a string.
- **volume:** Float value between 0.0 and 1.0 to set the volume.

---

## Tips for Integration

If your game uses a configuration system with settings stored in a file, integrating it with `SodaAudioManager` is simple. When calling audio methods, pass the volume from your global configuration node:

**Example:**

```gdscript
SodaAudioManager.play_music("res://music.ogg", GlobalConfig.volume)
```

This ensures consistency with your game’s audio settings.

---

## Feedback and Contributions

Questions, suggestions, and contributions to improve this plugin are always welcome! Feel free to open discussions and submit issues or pull requests on GitHub!

