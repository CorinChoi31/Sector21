///@function tower_init
function tower_init() {
	if(!variable_global_exists("tower_info"))
	{
		global.tower_info = noone;
	}

	if(!ds_exists(global.tower_info,ds_type_map))
	{
		global.tower_info = ds_map_create();
	
	#region 0 Solo Attack
		tower_define(0, 0, c_orange, 90, 0,
			10, 1, 0.333, 0, 6, 30,
			5, 5, -0.033, 0, 1);
			global.tower_info[? "0,0"+"."+"description"] = "단일 대상";
		
		tower_define(0, 1, c_orange, 45, 0,
			12, 15, 1.5, 0, 7, 20,
			5, 5, -0.125, 0.5, 1);
			global.tower_info[? "0,1"+"."+"description"] = "단일 대상";
		
		tower_define(0, 2, c_red, 120, 90,
			10, 6, 1.25, 0, 5, 30,
			3, 3, -0.05, 0, 1);
			global.tower_info[? "0,2"+"."+"description"] = "다수 대상";
		
		tower_define(0, 3, c_red, 60, 0,
			15, 5, 1.5, 0, 5, 30,
			4, 2, -0.05, 0, 0.5);
			global.tower_info[? "0,3"+"."+"description"] = "단일 대상 | 3회 연속";
		
		tower_define(0, 4, c_red, 30, 0,
			20, 4, 1.75, 0, 6, 25,
			6, 1, -0.125, 0, 0.5);
			global.tower_info[? "0,4"+"."+"description"] = "다수 대상 | 3회 연속";
	#endregion
	
	#region 1 Area Attack
		tower_define(1, 0, c_yellow, 45, 0,
			12, 6, 1.5, 1, 5, 20,
			6, 2, -0.1, 0.2, 1);
			global.tower_info[? "1,0"+"."+"description"] = "단일 대상 | 광역 피해";
	
		tower_define(1, 1, c_yellow, 60, 0,
			14, 10, 2, 3, 6, 25,
			5, 3, -0.1, 0.1, 0.5);
			global.tower_info[? "1,1"+"."+"description"] = "단일 대상 | 광역 피해";
	
		tower_define(1, 2, c_yellow, 45, 0,
			10, 1, 1.25, 2, 7, 30,
			6, 2, -0.05, 0, 1);
			global.tower_info[? "1,2"+"."+"description"] = "다수 대상 | 광역 피해";
	#endregion
	
	#region 2 Penetrait Attack
		tower_define(2, 0, c_lime, 90, 45,
			18, 0.1, 2, 0, 4, 0,
			10, 0.1, 0, 0, 1);
			global.tower_info[? "2,0"+"."+"description"] = "사거리 내 | 방어력 감소";
		
		tower_define(2, 1, c_green, 90, 0,
			15, 1, 1, 0, 5, 0,
			10, 1, 0, 0, 0.75);
			global.tower_info[? "2,1"+"."+"description"] = "사거리 내 | 방어력 무시 피해";
		
		tower_define(2, 2, c_lime, 120, 90,
			30, 0, 10, 0, 3, 0,
			5, 0, -0.2, 0, 1);
			global.tower_info[? "2,2"+"."+"description"] = "사거리 내 | 이로운 효과 해제";
		
		tower_define(2, 3, c_lime, 120, 270,
			25, 0, 6, 0, 5, 0,
			5, 0, -0.25, 0, 1);
			global.tower_info[? "2,3"+"."+"description"] = "사거리 내 | 이로운 효과 해제 - 이동 방해 효과 시";
		
		tower_define(2, 4, c_lime, 45, 0,
			15, 0.125, 1, 0, 8, 15,
			5, 0.25, 0, 0, 0.2);
			global.tower_info[? "2,4"+"."+"description"] = "단일 대상 | 방어력 감소";
	#endregion
	
	#region 3 Debuff Attack
		tower_define(3, 0, c_aqua, 60, 90,
			5, 2, 2.5, 2.5, 10, 15,
			5, 2, -0.25, 0.25, 0);
			global.tower_info[? "3,0"+"."+"description"] = "단일 대상 | 광역 피해 | 광역 둔화";
		
		tower_define(3, 1, c_blue, 45, 90,
			7, 2, 2, 1, 7, 25,
			5, 2, -0.125, 0.5, 0.75);
			global.tower_info[? "3,1"+"."+"description"] = "단일 대상 | 광역 피해 | 광역 기절";
		
		tower_define(3, 2, c_aqua, 120, 90,
			5, 2, 2, 0, 5, 20,
			4, 1, 0, 0, 0.5);
			global.tower_info[? "3,2"+"."+"description"] = "사거리 내 | 둔화";
		
		tower_define(3, 3, c_blue, 90, 90,
			10, 5, 5, 10, 1.5, 0,
			5, 2, -0.2, 2, 0.25);
			global.tower_info[? "3,3"+"."+"description"] = "사거리 내에 적이 있을 경우 광역 피해 및 기절";
	#endregion
	
	#region 4 Reinforce
		tower_define(4, 0, c_fuchsia, 72, -90,
			20, 0.125, 5, 0, 2, 0,
			15, 0.075, 0, 0, 0.375);
			global.tower_info[? "4,0"+"."+"description"] = "공격력 향상";
		tower_define(4, 1, c_fuchsia, 60, 90,
			20, 0.05, 5, 0, 3, 0,
			12, 0.05, 0, 0, 0.25);
			global.tower_info[? "4,1"+"."+"description"] = "공격속도 향상 | 사거리 향상 - 3단계 강화 이후";
		tower_define(4, 2, c_fuchsia, 45, 45,
			20, 0.1, 5, 0, 3, 0,
			10, 0.1, 0, 0, 0.5);
			global.tower_info[? "4,2"+"."+"description"] = "광역 범위 향상 | 투사체 속력 상승 - 3단계 강화 이후";
		tower_define(4, 3, c_fuchsia, 60, 0,
			20, 0.05, 5, 0, 3, 0,
			16, 0.05, 0, 0, 0.25);
			global.tower_info[? "4,3"+"."+"description"] = "방어 관통 추가";
		tower_define(4, 4, c_purple, 90, 45,
			20, 0.05, 1, 0, 5, 0,
			16, 0.125, 0, 0, 0.25);
			global.tower_info[? "4,4"+"."+"description"] = "주위 적 공격력에 비례해 공격력 향상";
	#endregion
	}


}
