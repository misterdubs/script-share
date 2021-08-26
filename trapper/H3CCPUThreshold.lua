-- replace the ip and hostname below to match your device
if trap.host == "10.0.1.175" then
	result.host = "H3C Switch"
end

-- the below service name much match EXACTLY to a predefined service on the host (or hostgroup)
result.service = "H3C Switch CPU Threshold"

hh3cEntityExtCpuUsageThreshold = trap.fields[".1.3.6.1.4.1.25506.2.6.1.1.1.1.7"]

if trap.fields[".1.3.6.1.4.1.25506.2.6.1.1.1.1.6"] > hh3cEntityExtCpuUsageThreshold then
	result.state = STATE.CRITICAL
	result.message = "CPU usage is high, above CPU threshold"
else
	result.state = STATE.OK
	result.message = "CPU usage is OK"
end

