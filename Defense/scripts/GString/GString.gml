function GString(_string) constructor
{
	/// funct GString(string)
	/// descr 
	/// param {string} string
	
	content = _string;
	
	static draw = function(_x, _y, _scale_x, _scale_y, _rot, _color, _alpha)
	{
		draw_text_transformed_color(_x, _y, content, _scale_x, _scale_y, _rot, _color, _color, _color, _color, _alpha);
	}
	
	static clean = function()
	{
		
	}
}