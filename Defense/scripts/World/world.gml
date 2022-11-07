function World(_file) constructor {
    information = undefined;
    rule = undefined;
    
    map_definitions = [];
    enemy_definitions = [];
    ally_definitions = [];
    
    map = undefined;
    
    pattern = undefined;
	
	Parse(_file);
	
    static Parse = function(_file) {
        var _data = datafile_load(_file);
        var _key = "";
        
        var _pkey = "information";
        var _keys = datafile_data_get_keys(datafile_data_get(_data, _pkey));
        var _information = new WorldInformation();
        while(array_length(_keys) > 0) {
            _key = array_pop(_keys);
            variable_struct_set(_information, _key, datafile_data_get(_data, _pkey + "." + _key));
        }
        information = _information;
        
        _pkey = "definition.map";
        _keys = datafile_data_get_keys(datafile_data_get(_data, _pkey));
        var _world_definition = undefined;
        while(array_length(_keys) > 0) {
            _key = array_pop(_keys);
            
            _world_definition = new WorldDefinitionMap(
                _key,
                datafile_data_get(_data, _pkey + "." + _key + "." + "type"),
                datafile_data_get(_data, _pkey + "." + _key + "." + "id")
            );
            
            array_push(map_definitions, _world_definition);
        }
        
        _pkey = "definition.enemy";
        _keys = datafile_data_get_keys(datafile_data_get(_data, _pkey));
        var _enemy_definition = undefined;
        while(array_length(_keys) > 0) {
            _key = array_pop(_keys);
            
            _enemy_definition = new WorldDefinitionEnemy(
                _key,
                datafile_data_get(_data, _pkey + "." + _key + "." + "type"),
                datafile_data_get(_data, _pkey + "." + _key + "." + "id")
            );
            
            //_enemy_definition.
            
            array_push(enemy_definitions, _enemy_definition);
        }
        
        //_pkey = "definition.ally";
        //_keys = datafile_data_get_keys(datafile_data_get(_data, _pkey));
        //var _ally_definition = undefined;
        //while(array_length(_keys) > 0) {
        //    _key = array_pop(_keys);
            
        //    _ally_definition = new WorldDefinitionAlly(
        //        _key,
        //        datafile_data_get(_data, _pkey + "." + _key + "." + "type"),
        //        datafile_data_get(_data, _pkey + "." + _key + "." + "id")
        //    );
            
        //    array_push(enemy_definitions, _enemy_definition);
        //}
        
        //_pkey = "pattern";
        //_keys = datafile_data_get_keys(datafile_data_get(_data, _pkey));
        //var _pattern = new WorldPattern();
        //while(array_length(_keys) > 0) {
        //    _key = array_pop(_keys);
        //    variable_struct_set(_pattern, _key, datafile_data_get(_data, _pkey + "." + _key));
        //}
        //pattern = _pattern;
        
        _pkey = "map";
        var _map = datafile_data_get(_data, _pkey);
        
        var _line = [];
        var _length = string_length(_map);
        var _mxlength = 0;
        
        var _i = 1;
        var _s = "";
        var _r = "";
        repeat(_length) {
            _s = string_char_at(_map, _i++);
            
            if(_s == " ") {
                
            }
            else if(_s == "\n" or _i + 1 == _length) {
                _mxlength = max(_mxlength, string_length(_r));
                
                array_push(_line, _r);
                _r = "";
            }
            else {
                _r += _s;
            }
        }
        
        map = new WorldMap(_mxlength, array_length(_line), _line);
    }
}

function WorldInformation() constructor {
    id = "";
    title = "";
    subtitle = "";
    description = "";
    difficulty = "";
    author = "";
    created = "";
    modified = "";
}

function WorldDefinition(_class, _name, _type, _id) constructor {
    class = _class;
    
    name = _name;
    type = _type;
    id = _id;
}

function WorldDefinitionMap(_name, _type, _id): WorldDefinition("map", _name, _type, _id) constructor {
    name = _name;
    type = _type;
    id = _id;
}

function WorldDefinitionEnemy(_name, _type, _id): WorldDefinition("enemy", _name, _type, _id) constructor {
    name = _name;
    type = _type;
    id = _id;
}

function WorldDefinitionAlly(_name, _type, _id): WorldDefinition("ally", _name, _type, _id) constructor {
    name = _name;
    type = _type;
    id = _id;
}

function WorldMap(_width, _height, _data) constructor {
    size_width = _width;
    size_height = _height;
    
    cells = array_create(size_height);
    
    var _i = 0;
    repeat(size_height) {
        cells[_i++] = array_create(size_width);
    }
}

function WorldRule() constructor {
    movement = undefined;
    movement_cost = undefined;
}

function WorldPattern() constructor {
    
}

function GridInfomation(_pos_x = -1, _pos_y = -1) constructor {
	select = false;
	
	pos_x = _pos_x;
	pos_y = _pos_y;
	
	color = c_white;
	
	alpha = 0;
	alpha_target = 0;
	
	type = gi_types.GI_NONE;
	instance = noone;
	solid = false;
}
