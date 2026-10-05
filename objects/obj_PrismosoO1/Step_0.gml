if (global.EnergyBlackout) exit;
/// @DnDAction : YoYo Games.Switch.Switch
/// @DnDVersion : 1
/// @DnDHash : 40E6CC3D
/// @DnDArgument : "expr" "global.PMPos"
var l40E6CC3D_0 = global.PMPos;
switch(l40E6CC3D_0)
{
	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 796CAA67
	/// @DnDParent : 40E6CC3D
	/// @DnDArgument : "const" "20"
	case 20:
		/// @DnDAction : YoYo Games.Common.If_Variable
		/// @DnDVersion : 1
		/// @DnDHash : 224FB842
		/// @DnDParent : 796CAA67
		/// @DnDArgument : "var" "global.Laser"
		/// @DnDArgument : "value" "1"
		if(global.Laser == 1)
		{
			/// @DnDAction : YoYo Games.Audio.Play_Audio
			/// @DnDVersion : 1.1
			/// @DnDHash : 6DACBAC2
			/// @DnDParent : 224FB842
			/// @DnDArgument : "soundid" "snd_Electricidad"
			/// @DnDSaveInfo : "soundid" "snd_Electricidad"
			audio_play_sound(snd_Electricidad, 0, 0, 1.0, undefined, 1.0);
		
			/// @DnDAction : YoYo Games.Common.Variable
			/// @DnDVersion : 1
			/// @DnDHash : 63989000
			/// @DnDParent : 224FB842
			/// @DnDArgument : "expr" "18"
			/// @DnDArgument : "var" "global.PMPos"
			global.PMPos = 18;
		
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 7588FDE9
			/// @DnDParent : 224FB842
			break;
		}
	
		/// @DnDAction : YoYo Games.Common.Else
		/// @DnDVersion : 1
		/// @DnDHash : 7D27D717
		/// @DnDParent : 796CAA67
		else
		{
			/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
			/// @DnDVersion : 1
			/// @DnDHash : 1C9B46DF
			/// @DnDParent : 7D27D717
			image_alpha = 1;
		}
		break;

	/// @DnDAction : YoYo Games.Switch.Case
	/// @DnDVersion : 1
	/// @DnDHash : 71C7828B
	/// @DnDParent : 40E6CC3D
	/// @DnDArgument : "const" "21"
	case 21:
		/// @DnDAction : YoYo Games.Audio.Stop_All_Audio
		/// @DnDVersion : 1
		/// @DnDHash : 3BC61489
		/// @DnDParent : 71C7828B
		audio_stop_all();
	
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 2D90248F
		/// @DnDParent : 71C7828B
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "var" "global.JSBy"
		global.JSBy = 1;
	
		/// @DnDAction : YoYo Games.Rooms.Go_To_Room
		/// @DnDVersion : 1
		/// @DnDHash : 642AF435
		/// @DnDParent : 71C7828B
		/// @DnDArgument : "room" "GameOver"
		/// @DnDSaveInfo : "room" "GameOver"
		room_goto(GameOver);
		break;

	/// @DnDAction : YoYo Games.Switch.Default
	/// @DnDVersion : 1
	/// @DnDHash : 576D48B0
	/// @DnDParent : 40E6CC3D
	default:
		/// @DnDAction : YoYo Games.Instances.Sprite_Image_Alpha
		/// @DnDVersion : 1
		/// @DnDHash : 607B7618
		/// @DnDParent : 576D48B0
		/// @DnDArgument : "alpha" "0"
		image_alpha = 0;
		break;
}