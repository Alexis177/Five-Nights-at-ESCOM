global.EnergyBlackout = false;
/// @DnDAction : YoYo Games.Random.Randomize
/// @DnDVersion : 1
/// @DnDHash : 07909E33
randomize();

/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 451B3279
/// @DnDInput : 5
/// @DnDArgument : "expr" "0.1"
/// @DnDArgument : "expr_1" "14400"
/// @DnDArgument : "expr_3" "5"
/// @DnDArgument : "var" "global.rotacionvel"
/// @DnDArgument : "var_1" "global.Bateria"
/// @DnDArgument : "var_2" "global.BatLaser"
/// @DnDArgument : "var_3" "global.BatConteo"
/// @DnDArgument : "var_4" "global.BatCamara"
global.rotacionvel = 0.1;
global.Bateria = 14400;
global.BatLaser = 0;
global.BatConteo = 5;
global.BatCamara = 0;

/// @DnDAction : YoYo Games.Cameras.Get_View_Var
/// @DnDVersion : 1
/// @DnDHash : 7E5108D1
/// @DnDArgument : "target" "global.Camara"
global.Camara = view_get_camera(0);

/// @DnDAction : YoYo Games.Audio.Play_Audio
/// @DnDVersion : 1.1
/// @DnDHash : 0A36BC4A
/// @DnDArgument : "soundid" "snd_BKMusic"
/// @DnDArgument : "loop" "1"
/// @DnDArgument : "gain" "0.6"
/// @DnDSaveInfo : "soundid" "snd_BKMusic"
audio_play_sound(snd_BKMusic, 0, 1, 0.6, undefined, 1.0);