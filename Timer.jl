#SpeechTimer

#SpeechTimer calculates the approximate time it will take to
#deliver a talk/presentation given an input file named speech.txt

#According to the National Center for Voice and Speech 
#(http://www.ncvs.org/ncvs/tutoria...) 
#the average rate for English speakers in the US is about 150 wpm. 
#The program will default to that rate if no rate is provided

#written in Julia programming language



#Author: Ira Ceka
#5/27/2016

file = open("speech.txt");
wordcount = 0
time = 0
wps = 150/60
for line in eachline(file)
    array = split(line)
    for i in array
        wordcount += 1
    end
end
time = (1/wps)*wordcount
println(time)
