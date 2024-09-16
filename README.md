# Soda AudioManager 0.5
*Plugin created and tested only on Godot 4.3.*

#### Soda AudioManager is a global plugin developed for Godot, focused on managing non-spatial sounds such as interface sound effects, background music, and sounds from the main character. It provides an easy way to play sounds, control music and sound effect volumes globally, as well as define whether a music track should loop or not.

## ---------- Install ----------

### 1.Download

- Download the plugin.
- Extract the contents into your disc.

### 2.Install/Activate

- Copy the addons folder to your project.
- Click on Project and look for the Plugins  tab in the Godot editor.
- Check the box to activate the plugin.

## ---------- How to use ----------

### Functions:
**To use the plugin, call the functions in your code whenever you need to play, stop, or pause an audio.**

#### Music functions:
```
SodaAudioManager.play_music(sndPath, isLoop)
```
+ ***sndPath*** refers to the path of the audio in your project; it is treated as a string, so enclose it in quotation marks.
+ ***isLoop*** defines whether the music will play in a loop or not; use true or false.

```
SodaAudioManager.pause_music()
```
- Pauses the music that is currently playing.

```
SodaAudioManager.unpause_music()
```
- Resumes the music that was playing and was paused earlier.

```
SodaAudioManager.stop_music()
```
- Stop music that is currently playing.
	
#### Ambient Sound Functions
```
SodaAudioManager.play_ambient_sound(sndPath, isLoop)
```
- ***sndPath*** refers to the path of the audio in your project; it is treated as a string, so enclose it in quotation marks.
- ***isLoop*** defines whether the music will play in a loop or not; use true or false.
	
```
SodaAudioManager.stop_ambient_sound()
```
- Stop Ambient audio that is currently playing.

#### Interface SFX
```
SodaAudioManager.play_snd_interface(sndPath)
```
- ***sndPath*** refers to the path of the audio in your project; it is treated as a string, so enclose it in quotation marks.
	
#### Player SFX
 ```
  SodaAudioManager.play_snd_player(sndPath)
 ```
- ***sndPath*** refers to the path of the audio in your project; it is treated as a string, so enclose it in quotation marks.
	
### Volume control
To adjust the volume, simply change value the respective properties(The value type is **float** and will be used by the system as decibels.) :

- musicVolume
- sfxInterfaceVolume
- sfxPlayerVolume
- sfxAmbientVolume

Here's an example:
``` 
SodaAudioManager.musicVolume = 2
```
In this example, musicVolume is set to 2 Db. Adjust the value according to your needs.The change will be applied in real-time.

## ---------- Tips ----------
If you have a settings system in your game where the configurations are stored in a file, integrating it with SodaAudioManager is quite simple. When loading the values, just apply them to the respective properties of the plugin, just as shown earlier.

***Questions, suggestions, and discussions to improve this project are all welcome! Feel free to comment!***
