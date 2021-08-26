if trap.host == "192.168.1.175" then
    result.host = "H3C Switch"
end

result.service = "Inserted Devices"

if trap.oid == '.1.3.6.1.4.1.25506.2.6.2.0.12' then
    result.state=STATE.CRITICAL
    result.message="Unkown Device Inserted"
elseif trap.oid == '.1.3.6.1.4.1.25506.2.6.2.0.13' then
    result.state=STATE.OK
    result.message="No unknown devices found"
end