-- Add an event handler for the 'chatMessage' event
AddEventHandler( 'chatMessage', function( s, n, msg )  
    msg = string.lower(msg)
    if (msg == "/tow") then 
        CancelEvent() 
        TriggerClientEvent('wk:spawnTow', s)
	elseif (msg == "/canceltow") then 
        CancelEvent() 
        TriggerClientEvent('wk:cancelTow', s)
	end
end)