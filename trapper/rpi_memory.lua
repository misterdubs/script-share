result.service="Memory Trap"
trap.host = result.host
metric = trap.fields[".1.3.6.1.4.1.25506.8.36.5.1.1.2"]
result.message="OK | metric=" .. metric .. "%;;;;"
result.state=STATE.OK

if trap.fields[".1.3.6.1.4.1.25506.8.36.5.1.1.2"] > 3000 then
	result.state = STATE.CRITICAL
	result.message = "Memory usage is CRITCIAL"
else
	result.state = STATE.OK
	result.message = "CPU usage is OK"
end


