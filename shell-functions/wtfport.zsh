wtfport() {
    if [ -z "$1" ]; then
        echo "Error: Please provide a port number ⚠️"
        echo "Usage: wtfport PORT_NUMBER"
        return 1
    fi
    
    echo "Checking port $1 👀"
    local pids=$(lsof -i :$1 -t | tr '\n' ' ')
    
    if [ -n "$pids" ]; then
        echo "✅ found something using command lsof +c 0 -i :$1"
        lsof +c 0 -i :$1
        
        echo "Using PID to get detailed process info:"
        echo "PID  PPID USER      %CPU %MEM   START     TIME COMMAND"
        echo "---- ---- -------- ----- ----- -------- ------- -------"
        
        for pid in $pids; do
            [ -n "$pid" ] && ps -p "$pid" -o pid,ppid,user,%cpu,%mem,start,time,command | tail -n +2
        done
        echo ""
    else
        echo "Nothing found ¯\_(ツ)_/¯ "
    fi
}
