function record-screen --description 'Record the screen with audio from the default sink'
    if test (count $argv) -eq 0
        set output "$HOME/revelations/screen-record-(date +%Y-%m-%d_%H-%M-%S).mp4"
    else
        set output $argv[1]
    end

    echo "Recording to: $output"
    gpu-screen-recorder -w screen -f 60 -a (pactl get-default-sink).monitor -o $output
end
