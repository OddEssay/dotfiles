wtfport() {
    if [ $1 ]; then
        echo "Checking port $1 👀"
        if [ $(lsof -i :$1 -t) ]; then
            echo "✅ found something using command lsof +c 0 -i :$1"
            eval "lsof +c 0 -i :$1"
            echo "Using PID to get output from ps $(lsof -i :$1 -t)"
            eval "ps $(lsof -i :$1 -t)"
            echo ""
        else
            echo "Nothing found ¯\_(ツ)_/¯ "
        fi
    fi
}
