/// @function value_normalize(value, normalize)
/// @param value
/// @param normalize

function value_normalize(_value, _normalize)
{
	return max(ceil(_value*_normalize)/_normalize, 0);
}
