if (global.EnergyBlackout) exit;
/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 73B05938
/// @DnDArgument : "var" "global.Hora"
/// @DnDArgument : "value" "8"
if(global.Hora == 8)
{
	/// @DnDAction : YoYo Games.Instances.Set_Sprite
	/// @DnDVersion : 1
	/// @DnDHash : 15E7B9F5
	/// @DnDApplyTo : {obj_Clock}
	/// @DnDParent : 73B05938
	/// @DnDArgument : "spriteind" "spr_6AM"
	/// @DnDSaveInfo : "spriteind" "spr_6AM"
	with(obj_Clock) {
	sprite_index = spr_6AM;
	image_index = 0;
	}

	/// @DnDAction : YoYo Games.Rooms.Go_To_Room
	/// @DnDVersion : 1
	/// @DnDHash : 4868743F
	/// @DnDParent : 73B05938
	/// @DnDArgument : "room" "Win"
	/// @DnDSaveInfo : "room" "Win"
	room_goto(Win);
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 2FDB9C35
else
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 14A4F8C1
	/// @DnDParent : 2FDB9C35
	/// @DnDArgument : "expr" "global.Hora+1"
	/// @DnDArgument : "var" "global.Hora"
	global.Hora = global.Hora+1;

	/// @DnDAction : YoYo Games.Switch.Switch
	/// @DnDVersion : 1
	/// @DnDHash : 05CAE8DF
	/// @DnDParent : 2FDB9C35
	/// @DnDArgument : "expr" "global.Hora"
	var l05CAE8DF_0 = global.Hora;
	switch(l05CAE8DF_0)
	{
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 1CC06BC7
		/// @DnDParent : 05CAE8DF
		case 0:
			/// @DnDAction : YoYo Games.Instances.Set_Sprite
			/// @DnDVersion : 1
			/// @DnDHash : 3E58EED7
			/// @DnDApplyTo : {obj_Clock}
			/// @DnDParent : 1CC06BC7
			/// @DnDArgument : "spriteind" "spr_10PM"
			/// @DnDSaveInfo : "spriteind" "spr_10PM"
			with(obj_Clock) {
			sprite_index = spr_10PM;
			image_index = 0;
			}
		
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 038A804C
			/// @DnDParent : 1CC06BC7
			break;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 3FE2CE07
		/// @DnDParent : 05CAE8DF
		/// @DnDArgument : "const" "1"
		case 1:
			/// @DnDAction : YoYo Games.Instances.Set_Sprite
			/// @DnDVersion : 1
			/// @DnDHash : 4A77FF7B
			/// @DnDApplyTo : {obj_Clock}
			/// @DnDParent : 3FE2CE07
			/// @DnDArgument : "spriteind" "spr_11PM"
			/// @DnDSaveInfo : "spriteind" "spr_11PM"
			with(obj_Clock) {
			sprite_index = spr_11PM;
			image_index = 0;
			}
		
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 7A4A8C5A
			/// @DnDParent : 3FE2CE07
			break;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 692DFFF1
		/// @DnDParent : 05CAE8DF
		/// @DnDArgument : "const" "2"
		case 2:
			/// @DnDAction : YoYo Games.Instances.Set_Sprite
			/// @DnDVersion : 1
			/// @DnDHash : 4E418F49
			/// @DnDApplyTo : {obj_Clock}
			/// @DnDParent : 692DFFF1
			/// @DnDArgument : "spriteind" "spr_12AM"
			/// @DnDSaveInfo : "spriteind" "spr_12AM"
			with(obj_Clock) {
			sprite_index = spr_12AM;
			image_index = 0;
			}
		
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 6155729C
			/// @DnDParent : 692DFFF1
			break;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 10627461
		/// @DnDParent : 05CAE8DF
		/// @DnDArgument : "const" "3"
		case 3:
			/// @DnDAction : YoYo Games.Instances.Set_Sprite
			/// @DnDVersion : 1
			/// @DnDHash : 3A02A131
			/// @DnDApplyTo : {obj_Clock}
			/// @DnDParent : 10627461
			/// @DnDArgument : "spriteind" "spr_1AM"
			/// @DnDSaveInfo : "spriteind" "spr_1AM"
			with(obj_Clock) {
			sprite_index = spr_1AM;
			image_index = 0;
			}
		
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 7ED1703A
			/// @DnDParent : 10627461
			break;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 5FA04705
		/// @DnDParent : 05CAE8DF
		/// @DnDArgument : "const" "4"
		case 4:
			/// @DnDAction : YoYo Games.Instances.Set_Sprite
			/// @DnDVersion : 1
			/// @DnDHash : 560286B3
			/// @DnDApplyTo : {obj_Clock}
			/// @DnDParent : 5FA04705
			/// @DnDArgument : "spriteind" "spr_2AM"
			/// @DnDSaveInfo : "spriteind" "spr_2AM"
			with(obj_Clock) {
			sprite_index = spr_2AM;
			image_index = 0;
			}
		
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 25F22F53
			/// @DnDParent : 5FA04705
			break;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 779915FA
		/// @DnDParent : 05CAE8DF
		/// @DnDArgument : "const" "5"
		case 5:
			/// @DnDAction : YoYo Games.Instances.Set_Sprite
			/// @DnDVersion : 1
			/// @DnDHash : 17B72596
			/// @DnDApplyTo : {obj_Clock}
			/// @DnDParent : 779915FA
			/// @DnDArgument : "spriteind" "spr_3AM"
			/// @DnDSaveInfo : "spriteind" "spr_3AM"
			with(obj_Clock) {
			sprite_index = spr_3AM;
			image_index = 0;
			}
		
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 38071245
			/// @DnDParent : 779915FA
			break;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 72226545
		/// @DnDParent : 05CAE8DF
		/// @DnDArgument : "const" "6"
		case 6:
			/// @DnDAction : YoYo Games.Instances.Set_Sprite
			/// @DnDVersion : 1
			/// @DnDHash : 1CC8D1D8
			/// @DnDApplyTo : {obj_Clock}
			/// @DnDParent : 72226545
			/// @DnDArgument : "spriteind" "spr_4AM"
			/// @DnDSaveInfo : "spriteind" "spr_4AM"
			with(obj_Clock) {
			sprite_index = spr_4AM;
			image_index = 0;
			}
		
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 7B81A013
			/// @DnDParent : 72226545
			break;
			break;
	
		/// @DnDAction : YoYo Games.Switch.Case
		/// @DnDVersion : 1
		/// @DnDHash : 3A3BED25
		/// @DnDParent : 05CAE8DF
		/// @DnDArgument : "const" "7"
		case 7:
			/// @DnDAction : YoYo Games.Instances.Set_Sprite
			/// @DnDVersion : 1
			/// @DnDHash : 276AAE81
			/// @DnDApplyTo : {obj_Clock}
			/// @DnDParent : 3A3BED25
			/// @DnDArgument : "spriteind" "spr_5AM"
			/// @DnDSaveInfo : "spriteind" "spr_5AM"
			with(obj_Clock) {
			sprite_index = spr_5AM;
			image_index = 0;
			}
		
			/// @DnDAction : YoYo Games.Loops.Break
			/// @DnDVersion : 1
			/// @DnDHash : 5D160164
			/// @DnDParent : 3A3BED25
			break;
			break;
	}

	/// @DnDAction : YoYo Games.Instances.Set_Alarm
	/// @DnDVersion : 1
	/// @DnDHash : 0BCF5A5D
	/// @DnDParent : 2FDB9C35
	/// @DnDArgument : "steps" "3600"
	alarm_set(0, 3600);
}