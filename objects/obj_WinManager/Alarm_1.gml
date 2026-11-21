/// @DnDAction : YoYo Games.Audio.Stop_All_Audio
/// @DnDVersion : 1
/// @DnDHash : 66872912
audio_stop_all();

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 63E3DAD8
/// @DnDArgument : "code" "credits_music = audio_play_sound(snd_TY, 0, true);"
credits_music = audio_play_sound(snd_TY, 0, true);

/// @DnDAction : YoYo Games.Sequences.Sequence_Create
/// @DnDVersion : 1
/// @DnDHash : 22362D63
/// @DnDArgument : "xpos" "640"
/// @DnDArgument : "ypos" "360"
/// @DnDArgument : "var" "SecWin"
/// @DnDArgument : "sequenceid" "sqn_TY"
/// @DnDArgument : "layer" ""Secuencia""
/// @DnDSaveInfo : "sequenceid" "sqn_TY"
SecWin = layer_sequence_create("Secuencia", 640, 360, sqn_TY);

/// @DnDAction : YoYo Games.Instances.Set_Alarm
/// @DnDVersion : 1
/// @DnDHash : 4E229780
/// @DnDArgument : "steps" "60"
/// @DnDArgument : "alarm" "2"
alarm_set(2, 60);
