repeat(round(global.d_time))
{
	range += (destRange-range)/step;
}

if(drawType = 0)
{
	repeat(round(global.d_time))
	{
		alpha += (destAlpha-alpha)/step;
	}
}
else if(drawType = 1)
{
	repeat(round(global.d_time))
	{
		drawEX += (endX-drawEX)/max(step,1);
		drawEY += (endY-drawEY)/max(step,1);
	}
	
	if(abs(point_distance(startX,startY,endX,endY)-point_distance(drawSX,drawSY,drawEX,drawEY)) < 1)
	{
		repeat(round(global.d_time))
		{
			alpha += (destAlpha-alpha)/step;
		}
	}
}

if(abs(destAlpha-alpha) < 0.001)
{
	instance_destroy();
}