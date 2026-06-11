#!/usr/bin/env fish

# Start HiFi API server and launch tuifi

function orfeu
    set HIFI_DIR "$HOME/hifi-api"
    set TUIFI_DIR "$HOME/tuifi"
    set API_URL "http://localhost:8000"

    # Check if directories exist
    if not test -d "$HIFI_DIR"
        echo "Error: HiFi API directory not found at $HIFI_DIR"
        exit 1
    end

    if not test -d "$TUIFI_DIR"
        echo "Error: tuifi directory not found at $TUIFI_DIR"
        exit 1
    end

    # Start HiFi API server in background
    echo "Starting HiFi API server..."
    cd "$HIFI_DIR"
    ./venv/bin/python main.py > /tmp/hifi-api.log 2>&1 &
    set HIFI_PID (jobs -p)

    # Wait for server to be ready
    echo "Waiting for HiFi API to start..."
    set attempts 0
    set max_attempts 30
    while test $attempts -lt $max_attempts
        if curl -s -f "$API_URL" > /dev/null 2>&1
            echo "HiFi API is ready at $API_URL"
            break
        end
        sleep 1
        set attempts (math $attempts + 1)
    end

    if test $attempts -eq $max_attempts
        echo "Error: HiFi API failed to start within $max_attempts seconds"
        kill $HIFI_PID 2>/dev/null
        exit 1
    end

    # Launch tuifi
    echo "Launching tuifi..."
    cd "$TUIFI_DIR"
    ./tuifi --api "$API_URL"

    # Cleanup: kill HiFi API server when tuifi exits
    echo "Stopping HiFi API server..."
    kill $HIFI_PID 2>/dev/null
end
