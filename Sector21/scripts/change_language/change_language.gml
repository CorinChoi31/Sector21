function change_language(argument0) {
	var _arg0 = argument0;

	if(!variable_global_exists("lang"))
	{
		global.lang = ds_map_create();	
	}

	global.lang[?"stathym_default"] = "Stathym";
	global.lang[?"stathym_large"] = "STATHYM";
	global.lang[?"stathym_small"] = "stathym";

	global.lang[?"company"] = "CoRs Soft.";

	global.lang[?"language"] = string_upper(_arg0);

	switch(global.lang[?"language"])
	{
		default:
		case "KR-KO":
		case "KO-KR":
		#region Menu
			global.lang[?"menu.back"] = "뒤로가기";
		
			global.lang[?"menu.intro.alret-first"] = "밝은 장소에서 즐겨주시기 바랍니다.";
			global.lang[?"menu.intro.alret-second"] = "특정한 빛 패턴, 깜빡임 등에\n발작 등의 질환을 일으킬 수 있습니다.";
		
			global.lang[?"menu.intro.alret-recommend"] = "Best Experience with Earphone";
		
			global.lang[?"menu.main.gamemode"] = "공허 속으로";
			global.lang[?"menu.main.setting"] = "설정";
			global.lang[?"menu.main.information"] = "정보";
			#region Gamemode
				global.lang[?"menu.gamemode.title"] = "갈림길";
				global.lang[?"menu.gamemode.arcade"] = "휴식";
				global.lang[?"menu.gamemode.story"] = "회상";
			
					global.lang[?"menu.gamemode.game.musicinfo"] = "곡 정보";
					global.lang[?"menu.gamemode.game.musicinfo.albumtitle"] = "앨범 제목";
					global.lang[?"menu.gamemode.game.musicinfo.composer"] = "작곡가";
					global.lang[?"menu.gamemode.game.musicinfo.time.min"] = "분";
					global.lang[?"menu.gamemode.game.musicinfo.time.sec"] = "초";
			
					global.lang[?"menu.gamemode.game.patterninfo"] = "패턴 정보";
					global.lang[?"menu.gamemode.game.patterninfo.designer"] = "패턴 제작가";
					global.lang[?"menu.gamemode.game.patterninfo.note"] = "노트";
					global.lang[?"menu.gamemode.game.patterninfo.notexists"] = "패턴이 존재하지 않습니다.";
			
					global.lang[?"menu.gamemode.game.record"] = "최고기록";
					global.lang[?"menu.gamemode.game.record.notexists"] = "플레이 기록 없음";
			#endregion
			#region Settings
				global.lang[?"menu.setting.save"] = "저장";
			
				global.lang[?"menu.setting.modify"] = "변경";
				global.lang[?"menu.setting.off"] = "꺼짐";
				global.lang[?"menu.setting.on"] = "켜짐";
				global.lang[?"menu.setting.apply"] = "적용";
				global.lang[?"menu.setting.all"] = "전체";
				global.lang[?"menu.setting.part"] = "일부";
				global.lang[?"menu.setting.none"] = "없음";
				global.lang[?"menu.setting.reset"] = "초기화";
				global.lang[?"menu.setting.prev"] = "이전";
				global.lang[?"menu.setting.next"] = "다음";
			
				global.lang[?"menu.setting.need_restart"] = "게임을 재시작하면 적용됩니다.";
				global.lang[?"menu.setting.save_success"] = "성공적으로 저장되었습니다.";
		
				global.lang[?"menu.setting.gameplay"] = "게임 플레이";
				global.lang[?"menu.setting.gameplay_description"] = "게임 플레이 관련 설정";
				global.lang[?"menu.setting.arcade"] = "아케이드";
				global.lang[?"menu.setting.arcade_description"] = "아케이드 모드 ~휴식~ 관련 설정";
				global.lang[?"menu.setting.story"] = "스토리";
				global.lang[?"menu.setting.story_description"] = "스토리 모드 ~회상~ 관련 설정";
				global.lang[?"menu.setting.video"] = "영상";
				global.lang[?"menu.setting.video_description"] = "영상(그래픽) 관련 설정";
				global.lang[?"menu.setting.audio"] = "소리";
				global.lang[?"menu.setting.audio_description"] = "소리 관련 설정";
				global.lang[?"menu.setting.debug"] = "디버그";
				global.lang[?"menu.setting.debug_description"] = "디버그 관련 설정";
				global.lang[?"menu.setting.settingreset"] = "설정 초기화";
				global.lang[?"menu.setting.settingreset_description"] = "게임의 설정을 초기화합니다.";
		
					global.lang[?"menu.setting.gameplay.notesync"] = "음악-노트 싱크";
					global.lang[?"menu.setting.gameplay.notesync_description"] = "음악과 노트의 간격을 조절합니다.\n높을수록 노트가 늦게 떨어집니다.";
						global.lang[?"menu.setting.gameplay.notesync.current"] = "현재 싱크";
						global.lang[?"menu.setting.gameplay.notesync.test"] = "싱크 시험";
					global.lang[?"menu.setting.gameplay.interface"] = "게임 인터페이스";
					global.lang[?"menu.setting.gameplay.interface_description"] = "판정선의 기본 높이, 정확도 및 콤보 표기의\n위치를 조절합니다.";
						global.lang[?"menu.setting.gameplay.interface.textheight"] = "글자 높이";
						global.lang[?"menu.setting.gameplay.interface.textscale"] = "글자 크기";
						global.lang[?"menu.setting.gameplay.interface.perfectionlineheight"] = "판정선 높이";
					global.lang[?"menu.setting.gameplay.screenmagnify"] = "화면 확대";
					global.lang[?"menu.setting.gameplay.screenmagnify_description.off"] = "노트를 판정하면 화면이 확대되지 않습니다.";
					global.lang[?"menu.setting.gameplay.screenmagnify_description.on"] = "노트를 판정하면 화면이 확대됩니다.";
					global.lang[?"menu.setting.gameplay.showperfection"] = "정확도 표기";
					global.lang[?"menu.setting.gameplay.showperfection_description.all"] = "노트를 판정할 때, 모든 노트의 정확도를 보여줍니다.";
					global.lang[?"menu.setting.gameplay.showperfection_description.part"] = "노트를 판정할 때, 롱 노트의 정확도를 보여줍니다.";
					global.lang[?"menu.setting.gameplay.showperfection_description.none"] = "노트를 판정할 때, 정확도를 보여주지 않습니다.";
					global.lang[?"menu.setting.gameplay.language"] = "언어";
					global.lang[?"menu.setting.gameplay.language_description"] = "게임의 언어를 변경합니다.";
					global.lang[?"menu.setting.gameplay.tutorial"] = "기본기 익히기";
					global.lang[?"menu.setting.gameplay.tutorial_description"] = "{find|stathym_default}을 즐기기 위한 기본을 배웁니다.";
					global.lang[?"menu.setting.gameplay.tutorial.play"] = "시작";
				
					global.lang[?"menu.setting.arcade.recordreset"] = "기록 초기화";
					global.lang[?"menu.setting.arcade.recordreset_description"] = "아케이드의 기록을 초기화 합니다. (복구 불가능)";
				
					global.lang[?"menu.setting.story.recordreset"] = "기록 초기화";
					global.lang[?"menu.setting.story.recordreset_description"] = "스토리의 진행도를 초기화 합니다. (복구 불가능)";
				
					global.lang[?"menu.setting.video.displaysize"] = "화면 크기";
					global.lang[?"menu.setting.video.displaysize_description.off"] = "게임 실행시, 화면비를 자동으로 맞추지 않습니다.";
					global.lang[?"menu.setting.video.displaysize_description.on"] = "게임 실행시, 화면비를 자동으로 맞춥니다.";
					global.lang[?"menu.setting.video.displaysize_description.off.content.width"] = "화면 가로 길이를 입력";
					global.lang[?"menu.setting.video.displaysize_description.off.content.height"] = "화면 세로 길이를 입력";
					global.lang[?"menu.setting.video.pixelinterpolation"] = "픽셀 보간";
					global.lang[?"menu.setting.video.pixelinterpolation_description.off"] = "계단 현상을 방지하기 위한 설정입니다.\n픽셀 보간을 적용하지 않습니다.";
					global.lang[?"menu.setting.video.pixelinterpolation_description.on"] = "계단 현상을 방지하기 위한 설정입니다.\n픽셀 보간을 적용합니다.";
				
					global.lang[?"menu.setting.video.effect"] = "효과 설정";
					global.lang[?"menu.setting.video.effect_description"] = "게임 플레이 중, 보여줄 효과 인스턴스를 선택합니다.\n인스턴스가 적을 수록 성능이 향상됩니다.";
					global.lang[?"menu.setting.video.effect.test"] = "효과 시험";
						global.lang[?"menu.setting.video.effect.screenflash"] = "화면 번쩍임";
						global.lang[?"menu.setting.video.effect.screenflash_description"] = "효과의 밝기를 조절합니다. (Legendary 패턴 전용)";
						global.lang[?"menu.setting.video.effect.screenglitch"] = "화면 색수차";
						global.lang[?"menu.setting.video.effect.screenglitch_description"] = "효과의 밝기를 조절합니다.";
						global.lang[?"menu.setting.video.effect.combo"] = "콤보 강조";
						global.lang[?"menu.setting.video.effect.combo_description"] = "효과의 밝기를 조절하고 유형을 선택합니다.";
							global.lang[?"menu.setting.video.effect.combo.left"] = "왼쪽";
							global.lang[?"menu.setting.video.effect.combo.center"] = "중앙";
							global.lang[?"menu.setting.video.effect.combo.right"] = "오른쪽";
							global.lang[?"menu.setting.video.effect.combo.bar"] = "막대";
							global.lang[?"menu.setting.video.effect.combo.bloom"] = "폭발";
							global.lang[?"menu.setting.video.effect.combo.text"] = "글자";
						global.lang[?"menu.setting.video.effect.perfector"] = "터치 판정";
						global.lang[?"menu.setting.video.effect.perfector_description"] = "효과의 밝기를 조절합니다.";
						global.lang[?"menu.setting.video.effect.noteline"] = "노트 판정 - 막대";
						global.lang[?"menu.setting.video.effect.noteline_description"] = "효과의 밝기를 조절합니다.";
						global.lang[?"menu.setting.video.effect.notebloom"] = "노트 판정 - 폭발";
						global.lang[?"menu.setting.video.effect.notebloom_description"] = "효과의 밝기를 조절하고 유형을 선택합니다.";
						global.lang[?"menu.setting.video.effect.noteslide"] = "노트 판정 - 잔상";
						global.lang[?"menu.setting.video.effect.noteslide_description"] = "효과의 밝기를 조절하고 유형을 선택합니다.";
							global.lang[?"menu.setting.video.effect.note.touch"] = "터치";
							global.lang[?"menu.setting.video.effect.note.touch_connect"] = "커넥트";
							global.lang[?"menu.setting.video.effect.note.long"] = "롱";
							global.lang[?"menu.setting.video.effect.note.drag"] = "드래그";
							global.lang[?"menu.setting.video.effect.note.slide"] = "슬라이드";
				
					global.lang[?"menu.setting.video.frame"] = "영상 재생 속도";
					global.lang[?"menu.setting.video.frame_description"] = "프레임 수를 조절합니다.\n값이 클수록 부드러우나 성능이 감소합니다.";
				
					global.lang[?"menu.setting.audio.backgroundmusic"] = "배경 음악 음량";
					global.lang[?"menu.setting.audio.backgroundmusic_description"] = "메뉴 화면에서의 배경음악 크기를 조절합니다.";
					global.lang[?"menu.setting.audio.gamemusic"] = "게임 음악 음량";
					global.lang[?"menu.setting.audio.gamemusic_description"] = "게임 플레이 중에서의 음악 크기를 조절합니다.";
					global.lang[?"menu.setting.audio.storymusic"] = "스토리 음악 음량";
					global.lang[?"menu.setting.audio.storymusic_description"] = "스토리 진행 중에서의 음악 크기를 조절합니다.";
					global.lang[?"menu.setting.audio.effect"] = "효과 음량";
					global.lang[?"menu.setting.audio.effect_description"] = "효과 음량 크기를 조절합니다.";
				
					global.lang[?"menu.setting.debug.development"] = "개발자용 디버깅";
					global.lang[?"menu.setting.debug.development_description.off"] = "디버그 모드를 사용하지 않습니다.";
					global.lang[?"menu.setting.debug.development_description.on"] = "디버그 모드를 사용합니다.";
					global.lang[?"menu.setting.debug.development.frame"] = "프레임";
			#endregion
			#region Information
				global.lang[?"menu.main.information.privacy"] = "개인정보 처리 방침";
				global.lang[?"menu.main.information.privacy_description"] = "확인하려면 '연결' 클릭";
				global.lang[?"menu.main.information.privacy.button_link"] = "연결";
			
				global.lang[?"menu.main.information.update"] = "업데이트 내역";
				global.lang[?"menu.main.information.update_description"] = "확인하려면 '연결' 클릭";
				global.lang[?"menu.main.information.update.button_link"] = "연결";
			#endregion
		#endregion
		#region Music
			global.lang[?"music.nowplaying"] = "현재 재생 중";
			global.lang[?"music.random_suffle"] = "무작위 재생";
			global.lang[?"music.off"] = "끄기"
			global.lang[?"music.on"] = "켜기";
		#endregion
		#region Game
			global.lang[?"game.arcade.button_start"] = "시작";
		
			global.lang[?"game.arcade.button_pause"] = "PAUSE";
			global.lang[?"game.arcade.game_speed"] = "노트 속력";
		
			global.lang[?"game.arcade.result.game_result"] = "게임 결과";
			global.lang[?"game.arcade.result.notes"] = "노트";
			global.lang[?"game.arcade.result.fullycharged"] = "완전 충전";
			global.lang[?"game.arcade.result.patternmaster"] = "패턴 마스터";
			global.lang[?"game.arcade.result.continue"] = "계속하기";
			global.lang[?"game.arcade.result.retry"] = "재시도";
		
			global.lang[?"game.arcade.pause.paused"] = "일시정지";
			global.lang[?"game.arcade.pause.game_speed"] = "노트 속력";
			global.lang[?"game.arcade.pause.resume"] = "계속 재생";
			global.lang[?"game.arcade.pause.restart"] = "다시 재생";
			global.lang[?"game.arcade.pause.backtomenu"] = "재생 중지";
		#endregion
		#region Story
			global.lang[?"story.chapter"] = "막";
				global.lang[?"story.reality.page.first"] = "첫번째 장";
		#endregion
			break;
		case "EN-US":
		#region Menu
			global.lang[?"menu.back"] = "Back";
		
			global.lang[?"menu.intro.alret-first"] = "Please Enjoy In Bright Places.";
			global.lang[?"menu.intro.alret-second"] = "Specific light patterns, flicker, etc.\ncan cause seizures and other diseases.";
		
			global.lang[?"menu.intro.alret-recommend"] = "Best Experience with Earphone";
		
			global.lang[?"menu.main.gamemode"] = "Step to Abyss";
			global.lang[?"menu.main.setting"] = "Settings";
			global.lang[?"menu.main.information"] = "Information";
			#region Gamemode
				global.lang[?"menu.gamemode.title"] = "Waypoint";
				global.lang[?"menu.gamemode.arcade"] = "Stay for a Rest";
				global.lang[?"menu.gamemode.story"] = "Read the Memory";
			
					global.lang[?"menu.gamemode.game.musicinfo"] = "Music Information";
					global.lang[?"menu.gamemode.game.musicinfo.albumtitle"] = "Album Title";
					global.lang[?"menu.gamemode.game.musicinfo.composer"] = "Composed By";
					global.lang[?"menu.gamemode.game.musicinfo.time.min"] = "min.";
					global.lang[?"menu.gamemode.game.musicinfo.time.sec"] = "sec.";
			
					global.lang[?"menu.gamemode.game.patterninfo"] = "Pattern Information";
					global.lang[?"menu.gamemode.game.patterninfo.designer"] = "Designed By";
					global.lang[?"menu.gamemode.game.patterninfo.note"] = "Notes";
					global.lang[?"menu.gamemode.game.patterninfo.notexists"] = "Pattern doesn't Exists!";
			
					global.lang[?"menu.main.gamemode.game.record"] = "Your Best Records";
					global.lang[?"menu.main.gamemode.game.record.notexists"] = "Not Played";
			#endregion
			#region Settings
				global.lang[?"menu.setting.save"] = "Save";
			
				global.lang[?"menu.setting.modify"] = "Modify";
				global.lang[?"menu.setting.off"] = "OFF";
				global.lang[?"menu.setting.on"] = "ON";
				global.lang[?"menu.setting.apply"] = "APPLY";
				global.lang[?"menu.setting.all"] = "ALL";
				global.lang[?"menu.setting.part"] = "PART";
				global.lang[?"menu.setting.none"] = "NONE";
				global.lang[?"menu.setting.reset"] = "Reset";
				global.lang[?"menu.setting.prev"] = "PREV";
				global.lang[?"menu.setting.next"] = "NEXT";
			
				global.lang[?"menu.setting.need_restart"] = "Applied when you restart the game.";
				global.lang[?"menu.setting.save_success"] = "Successfully Saved.";
		
				global.lang[?"menu.setting.gameplay"] = "Gameplay";
				global.lang[?"menu.setting.gameplay_description"] = "Gameplay related settings";
				global.lang[?"menu.setting.arcade"] = "Arcade";
				global.lang[?"menu.setting.arcade_description"] = "Arcade ~Stay for a Rest~ related settings";
				global.lang[?"menu.setting.story"] = "Story";
				global.lang[?"menu.setting.story_description"] = "Story ~Read the Memory~ related settings";
				global.lang[?"menu.setting.video"] = "Video";
				global.lang[?"menu.setting.video_description"] = "Video(Graphic) related settings";
				global.lang[?"menu.setting.audio"] = "Audio";
				global.lang[?"menu.setting.audio_description"] = "Audio related settings";
				global.lang[?"menu.setting.debug"] = "Debug";
				global.lang[?"menu.setting.debug_description"] = "Debug related settings";
				global.lang[?"menu.setting.settingreset"] = "Reset Settings";
				global.lang[?"menu.setting.settingreset_description"] = "Reseting game settings";
			
					global.lang[?"menu.setting.gameplay.notesync"] = "Note Synchronization";
					global.lang[?"menu.setting.gameplay.notesync_description"] = "Adjust the spacing between music and notes.\nThe higher value, The slower note will be.";
						global.lang[?"menu.setting.gameplay.notesync.current"] = "Current Sync";
						global.lang[?"menu.setting.gameplay.notesync.test"] = "Test Sync";
					global.lang[?"menu.setting.gameplay.interface"] = "Game Interface";
					global.lang[?"menu.setting.gameplay.interface_description"] = "Adjust the judge line height,\naccuracy text height, and scale.";
						global.lang[?"menu.setting.gameplay.interface.textheight"] = "Text Height";
						global.lang[?"menu.setting.gameplay.interface.textscale"] = "Text Scale";
						global.lang[?"menu.setting.gameplay.interface.perfectionlineheight"] = "Line Height";
					global.lang[?"menu.setting.gameplay.screenmagnify"] = "Screen Magnifying";
					global.lang[?"menu.setting.gameplay.screenmagnify_description.off"] = "If you judge a note,\nthe screen will not be enlarged.";
					global.lang[?"menu.setting.gameplay.screenmagnify_description.on"] = "If you judge a note,\nthe screen will be enlarged.";
					global.lang[?"menu.setting.gameplay.showperfection"] = "Showing Accuracy";
					global.lang[?"menu.setting.gameplay.showperfection_description.all"] = "Showing accuracy\nwhen you judging any notes.";
					global.lang[?"menu.setting.gameplay.showperfection_description.part"] = "Showing accuracy\nwhen you judging long notes.";
					global.lang[?"menu.setting.gameplay.showperfection_description.none"] = "No showing accuracy.";
					global.lang[?"menu.setting.gameplay.language"] = "Language";
					global.lang[?"menu.setting.gameplay.language_description"] = "Changing the game language.";
					global.lang[?"menu.setting.gameplay.tutorial"] = "Tutorial";
					global.lang[?"menu.setting.gameplay.tutorial_description"] = "Learning the way to play {find|stathym_default} well.";
					global.lang[?"menu.setting.gameplay.tutorial.play"] = "Play";
				
					global.lang[?"menu.setting.arcade.recordreset"] = "Record Reset";
					global.lang[?"menu.setting.arcade.recordreset_description"] = "Resetting records of the arcade.\n(Unable to Recovery)";
				
					global.lang[?"menu.setting.story.recordreset"] = "Record Reset";
					global.lang[?"menu.setting.story.recordreset_description"] = "Resetting records of the story.\n(Unable to Recovery)";
				
					global.lang[?"menu.setting.video.displaysize"] = "Display Size";
					global.lang[?"menu.setting.video.displaysize_description.off"] = "When playing the game,\nthe aspect ratio is not automatically adjusted.";
					global.lang[?"menu.setting.video.displaysize_description.on"] = "When playing the game,\nthe aspect ratio is automatically adjusted.";
					global.lang[?"menu.setting.video.displaysize_description.off.content.width"] = "Enter display width";
					global.lang[?"menu.setting.video.displaysize_description.off.content.height"] = "Enter display height";
					global.lang[?"menu.setting.video.pixelinterpolation"] = "Pixel Interpolation";
					global.lang[?"menu.setting.video.pixelinterpolation_description.off"] = "It is set to prevent aliasing.\nDoes not apply pixel interpolation.";
					global.lang[?"menu.setting.video.pixelinterpolation_description.on"] = "It is set to prevent aliasing.\nDoes apply pixel interpolation.";
				
					global.lang[?"menu.setting.video.effect"] = "Effect Instances";
					global.lang[?"menu.setting.video.effect_description"] = "게임 플레이 중, 보여줄 효과 인스턴스를 선택합니다.\n인스턴스가 적을 수록 성능이 향상됩니다.";
					global.lang[?"menu.setting.video.effect.test"] = "Test Effect";
						global.lang[?"menu.setting.video.effect.screenflash"] = "화면 번쩍임";
						global.lang[?"menu.setting.video.effect.screenflash_description"] = "효과의 밝기를 조절합니다. (Only In Legendary)";
						global.lang[?"menu.setting.video.effect.screenglitch"] = "화면 색수차";
						global.lang[?"menu.setting.video.effect.screenglitch_description"] = "효과의 밝기를 조절합니다.";
						global.lang[?"menu.setting.video.effect.combo"] = "콤보 강조";
						global.lang[?"menu.setting.video.effect.combo_description"] = "효과의 밝기를 조절하고 유형을 선택합니다.";
							global.lang[?"menu.setting.video.effect.combo.left"] = "Left";
							global.lang[?"menu.setting.video.effect.combo.center"] = "Center";
							global.lang[?"menu.setting.video.effect.combo.right"] = "Right";
							global.lang[?"menu.setting.video.effect.combo.bar"] = "Bar";
							global.lang[?"menu.setting.video.effect.combo.bloom"] = "Bloom";
							global.lang[?"menu.setting.video.effect.combo.text"] = "Text";
						global.lang[?"menu.setting.video.effect.perfector"] = "터치 판정";
						global.lang[?"menu.setting.video.effect.perfector_description"] = "효과의 밝기를 조절합니다.";
						global.lang[?"menu.setting.video.effect.noteline"] = "노트 판정 - 막대";
						global.lang[?"menu.setting.video.effect.noteline_description"] = "효과의 밝기를 조절합니다.";
						global.lang[?"menu.setting.video.effect.notebloom"] = "노트 판정 - 폭발";
						global.lang[?"menu.setting.video.effect.notebloom_description"] = "효과의 밝기를 조절하고 유형을 선택합니다.";
						global.lang[?"menu.setting.video.effect.noteslide"] = "노트 판정 - 잔상";
						global.lang[?"menu.setting.video.effect.noteslide_description"] = "효과의 밝기를 조절하고 유형을 선택합니다.";
							global.lang[?"menu.setting.video.effect.note.touch"] = "Touch";
							global.lang[?"menu.setting.video.effect.note.touch_connect"] = "Connect";
							global.lang[?"menu.setting.video.effect.note.long"] = "Long";
							global.lang[?"menu.setting.video.effect.note.drag"] = "Drag";
							global.lang[?"menu.setting.video.effect.note.slide"] = "Slide";
				
					global.lang[?"menu.setting.video.frame"] = "Game Frame Speed";
					global.lang[?"menu.setting.video.frame_description"] = "Adjust the number of frames.\nLarger values are smoother, but performance is reduced.";
				
					global.lang[?"menu.setting.audio.backgroundmusic"] = "Background Music Volume";
					global.lang[?"menu.setting.audio.backgroundmusic_description"] = "Adjusts the volume of background music.";
					global.lang[?"menu.setting.audio.gamemusic"] = "Game Music Volume";
					global.lang[?"menu.setting.audio.gamemusic_description"] = "Adjusts the volume of the music during gameplay.";
					global.lang[?"menu.setting.audio.storymusic"] = "Story Music Volume";
					global.lang[?"menu.setting.audio.storymusic_description"] = "Adjusts the volume of the music in the story.";
					global.lang[?"menu.setting.audio.effect"] = "Effect Sound Volume";
					global.lang[?"menu.setting.audio.effect_description"] = "Adjusts the volume of effect sound.";
				
					global.lang[?"menu.setting.debug.development"] = "Developer's Debug Mode";
					global.lang[?"menu.setting.debug.development_description.off"] = "Disable debug mode.";
					global.lang[?"menu.setting.debug.development_description.on"] = "Enable debug mode.";
					global.lang[?"menu.setting.debug.development.frame"] = "Frame";
			#endregion
			#region Information
				global.lang[?"menu.main.information.privacy"] = "Privacy Policy";
				global.lang[?"menu.main.information.privacy_description"] = "Click 'Link' to check.";
				global.lang[?"menu.main.information.privacy.button_link"] = "LINK";
			
				global.lang[?"menu.main.information.update"] = "Update Note";
				global.lang[?"menu.main.information.update_description"] = "Click 'Link' to check.";
				global.lang[?"menu.main.information.update.button_link"] = "LINK";
			#endregion
		#endregion
		#region Music
			global.lang[?"music.nowplaying"] = "Now Playing";
			global.lang[?"music.random_suffle"] = "Random Suffle";
			global.lang[?"music.off"] = "OFF"
			global.lang[?"music.on"] = "ON";
		#endregion
		#region Game
			global.lang[?"game.arcade.button_pause"] = "PAUSE";
			global.lang[?"game.arcade.game_speed"] = "Note Speed";
		
			global.lang[?"game.arcade.result.game_result"] = "GAME RESULT";
			global.lang[?"game.arcade.result.notes"] = "Notes";
			global.lang[?"game.arcade.result.fullycharged"] = "Fully Charged";
			global.lang[?"game.arcade.result.patternmaster"] = "Pattern Master";
			global.lang[?"game.arcade.result.continue"] = "Continue";
			global.lang[?"game.arcade.result.retry"] = "Retry";
		
			global.lang[?"game.arcade.pause.paused"] = "Pause";
			global.lang[?"game.arcade.pause.game_speed"] = "Note Speed";
			global.lang[?"game.arcade.pause.resume"] = "Resume";
			global.lang[?"game.arcade.pause.restart"] = "Replay";
			global.lang[?"game.arcade.pause.backtomenu"] = "Back to Menu";
		#endregion
		#region Story
			global.lang[?"story.chapter"] = "chapter";
				global.lang[?"story.reality.page.first"] = "First Page";
		#endregion
			break;
	}


}
