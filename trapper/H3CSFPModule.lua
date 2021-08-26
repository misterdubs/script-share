-- replace the ip and hostname below to match your device

if trap.host == "192.168.1.175" then
    result.host = "H3C Switch"
end

-- the below service name much match EXACTLY to a predefined service on the host (or hostgroup)
result.service = "SFP Module Status"

if trap.oid == '.1.3.6.1.4.1.25506.2.6.2.0.9' then
    result.state = STATE.CRITICAL
    error = trap.fields[".1.3.6.1.4.1.25506.2.6.1.1.1.1.19"]
    if error == 3 then result.message = "postFailure"
    elseif error == 4 then result.message = "entityAbsent"
    elseif error == 11 then result.message = "poeError"
    elseif error == 21 then result.message = "stackError"
    elseif error == 22 then result.message = "stackPortBlocked"
    elseif error == 23 then result.message = "stackPortFailed"
    elseif error == 31 then result.message = "sfpRecvError"
    elseif error == 32 then result.message = "sfpSendError"
    elseif error == 33 then result.message = "sftpBothError"
    elseif error == 41 then result.message = "fanError"
    elseif error == 51 then result.message = "psuError"
    elseif error == 61 then result.message = "rpsError"
    elseif error == 71 then result.message = "moduleFaulty"
    elseif error == 81 then result.message = "sensorError"
    elseif error == 91 then result.message = "hardwareFaulty"
    else result.message = "UNKNOWN ERROR"
    end

elseif trap.oid == '.1.3.6.1.4.1.25506.2.6.2.0.10' then
    result.state = STATE.OK
    result.message = "SFP Module: OK"

else result.state = STATE.WARNING
    result.message = "UNKNOWN STATUS"
end


