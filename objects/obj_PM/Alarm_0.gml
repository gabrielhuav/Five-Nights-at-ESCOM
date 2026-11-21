/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 38BB2B57
/// @DnDArgument : "var" "global.PMMov"
/// @DnDArgument : "value" "1"
if(global.PMMov == 1)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 25733781
	/// @DnDInput : 2
	/// @DnDParent : 38BB2B57
	/// @DnDArgument : "expr_1" "clamp(global.PMIA, 0, 20)"
	/// @DnDArgument : "var" "PMComp"
	/// @DnDArgument : "var_1" "PMProb"
	PMComp = 0;
	PMProb = clamp(global.PMIA, 0, 20);

	/// @DnDAction : YoYo Games.Common.Execute_Code
	/// @DnDVersion : 1
	/// @DnDHash : 4B847A64
	/// @DnDParent : 38BB2B57
	/// @DnDArgument : "code" "PMComp = irandom(19);"
	PMComp = irandom(19);

	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 64AC58A7
	/// @DnDParent : 38BB2B57
	/// @DnDArgument : "var" "PMProb"
	/// @DnDArgument : "op" "2"
	/// @DnDArgument : "value" "PMComp"
	if(PMProb > PMComp)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 298A5C91
		/// @DnDParent : 64AC58A7
		/// @DnDArgument : "var" "global.PMMov"
		global.PMMov = 0;
	
		/// @DnDAction : YoYo Games.Instances.Set_Alarm
		/// @DnDVersion : 1
		/// @DnDHash : 4985A34E
		/// @DnDParent : 64AC58A7
		/// @DnDArgument : "steps" "1"
		/// @DnDArgument : "alarm" "1"
		alarm_set(1, 1);
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 2A16C665
	/// @DnDParent : 38BB2B57
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 148786EB
		/// @DnDParent : 2A16C665
		/// @DnDArgument : "var" "global.PMMov"
		global.PMMov = 0;
	
		/// @DnDAction : YoYo Games.Instances.Set_Alarm
		/// @DnDVersion : 1
		/// @DnDHash : 1C126186
		/// @DnDParent : 2A16C665
		/// @DnDArgument : "steps" "1"
		/// @DnDArgument : "alarm" "2"
		alarm_set(2, 1);
	}
}
