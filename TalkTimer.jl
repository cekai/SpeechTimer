#TalkTimer

#TalkTimer calculates the approximate time it will take to
#deliver a talk/presentation given an input file, speech.txt

#Takes one command line argument, the rate of speech, in words per minute (wpm)
#If no argument is provided, the rate of wpm defaults to 150 wpm, the 
#average rate for English speakers (see below)

#According to the National Center for Voice and Speech 
#(http://www.ncvs.org/ncvs/tutoria...) 
#the average rate for English speakers in the US is about 150 wpm. 

#written in Julia programming language

#Author: Ira Ceka
#5/27/2016

using ArgParse

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table s begin
        "arg1"
            help = "a positional argument"
            required = false                          
    end
    return parse_args(s)
end

function calculate_time(wpm)
    file = open("speech.txt") 
    wordcount = 0 
    time = 0      
    wps = wpm/60 
    
    for line in eachline(file)
        array = split(line)  
        for i in array
            wordcount += 1
        end
    end
    time = (1/wps)*wordcount
    return time
end

function what_to_print(time)
    if time < 60
        @printf("It will take about %.2f seconds to deliver the given piece of text", time)
        println()
    elseif time >= 60 && time < 3600
        @printf("It will take about %.2f minutes to deliver the given piece of text", time/60)
        println()
    else
        @printf("It will take about %.2f hours to deliver the given piece of text", (time/60)/60)
        println()
        end
    end

    

function main()
    wpm = 0
    parsed_args = parse_commandline()
        if parsed_args["arg1"] == nothing
            wpm = 150
        else
            wpm = parse(parsed_args["arg1"])
        end
    
    what_to_print(calculate_time(wpm))
     
    
end

main()
