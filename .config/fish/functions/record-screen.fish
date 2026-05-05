function record-screen --description 'Record the screen with audio from the default sink'
    set no_audio false
    set output ""

    for arg in $argv
        switch $arg
            case -n --no-audio
                set no_audio true
            case '*'
                set output $arg
        end
    end

    if test -z "$output"
        set output $HOME/revelations/screen-record-(date +%Y-%m-%d_%H-%M-%S).mp4
    end

    echo "Recording to: $output"
    if test $no_audio = true
        gpu-screen-recorder -w screen -f 60 -o $output
    else
        gpu-screen-recorder -w screen -f 60 -a (pactl get-default-sink).monitor -o $output
    end
end
