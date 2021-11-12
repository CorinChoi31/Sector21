global.display = 0;
global.displayAuto = false;

if(os_type == os_android)
{
	ini_open("Display.s21");
	if(ini_key_exists("Display","Auto"))
	{
		if(ini_read_real("Display","Auto",true) = true)
		{
			ini_write_real("Display","Currected",true);
			global.displayAuto = true;
		}
	}
	else
	{
		ini_write_real("Display","Auto",true);
		ini_write_real("Display","Currected",true);
		global.displayAuto = true;
	}
	ini_close();
	
	global.display = display_correction("Display.s21","Display",["Currected","Width","Height"],1920,1080,Room_Main);
}
else
{
	room = Room_Main;
}