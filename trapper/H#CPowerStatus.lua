-- replace the ip and hostname below to match your device

if trap.host == "192.168.1.60" then
    result.host = "H3C Switch"
end

PowerSupplyNum = trap.fields[".1.3.6.1.4.1.25506.8.25"]
-- the below service names much match EXACTLY to predefined services on the host (or hostgroup)
if PowerSupplyNum == 1 then
    result.service = "Power Supply 1"
elseif PowerSupplyNum == 2 then
    result.service = "Power Supply 2"
elseif PowerSupplyNum == 3 then
    result.service = "Power Supply 3"
elseif PowerSupplyNum == 4 then
    result.service = "Power Supply 4"
else
    result.service = "Unknown Power Supply"   
end

if trap.fields[".1.3.6.1.4.1.25506.8.36.4.1.1.2"] == 3 then
    result.state=STATE.CRITICAL
    result.message = "Power Supply is DOWN"
else 
    result.state=STATE.OK
    result.message = "Power Supply is UP"
end


