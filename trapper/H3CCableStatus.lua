-- replace the ip and hostname below to match your device

if trap.host == "192.168.1.60" then
    result.host = "H3C Switch"
end
result.service="Port Status"
result.state=STATE.CRITICAL

port = trap.fields[".1.3.6.1.4.1.25506.8.25.1.2.1.1.49"]
result.message = "cable unplugged at port: " .. port


