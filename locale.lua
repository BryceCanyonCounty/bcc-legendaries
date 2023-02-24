Locales = {}

function _(str, ...) -- Translate string

	if Locales[Language] ~= nil then

		if Locales[Language][str] ~= nil then
			return string.format(Locales[Language][str], ...)
		else
			return 'Translation [' .. Language .. '][' .. str .. '] does not exist'
		end

	else
		return 'Locale [' .. Language .. '] does not exist'
	end

end

function _U(str, ...) -- Translate string first char uppercase
	return tostring(_(str, ...):gsub("^%l", string.upper))
end