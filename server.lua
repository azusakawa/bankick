local bans = {
    'license:',
}

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local identifier = nil
    deferrals.defer()

    for _, id in ipairs(identifiers) do 
        if string.match(id, 'license:') then
            identifier = id
            break
        end
    end

    for _, ban in ipairs(bans) do
        if ban == identifier then
            deferrals.done('還敢調皮阿')
        else
            deferrals.done()
        end
    end
end)