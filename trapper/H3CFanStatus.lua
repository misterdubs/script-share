-- replace the ip and hostname below to match your device

if trap.host == "192.168.1.175" then
    result.host = "H3C Switch"
end

-- the below service name much match EXACTLY to a predefined service on the host (or hostgroup)
result.service = "Fan Status"

if trap.fields[".1.3.6.1.4.1.25506.8.36.5.1.1.2"] == 2 then
    result.state = STATE.CRITICAL
    result.message = "FAN STATE: CRITICAL"
else 
    result.state = STATE.OK
    result.message = "FAN STATE: OK"
end

