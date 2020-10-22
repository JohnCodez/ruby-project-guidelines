require_relative '../config/environment'
require 'tty-prompt'
@prompt = TTY::Prompt.new

def print_story(index)
    text = Story.find(index).text + "\n\n"
    choice1 = Story.find(index).choice1
    choice2 = Story.find(index).choice2
    system('clear')
    @prompt.say(text)
    choices = { choice1 => 1, choice2 => 2}
    action = @prompt.select("Choose path" ,choices)
    case action
    when 1
        choice1
    when 2
        choice2
    end

end

def new_index(choice)
    case choice
    when "Walk right from house"
        2
    when "Walk left from house"
        3
    when "Approach the figure"
        4
    when "Ignore it"
        5
    when "RUUUUUUUUN"
        6
    when "RUN AWAY"
        6
    when "Slowly wake up"
        7
    when "Play dead"
        8
    when "Try to leave now"
        9
    when "Stay to heal"
        10
    when "Ask who he is"
        16
    when "RUN"
        15
    when "Panic"
        11
    when "Try to break through wall"
        12
    when "Invite him for a drink"
        13
    when "Drink it"
        14
    else
        nil
    end
end

def start
    index = 1
    while index != nil
        choice = print_story(index)
        index = new_index(choice)
    end
    system('clear')
    puts "The End"
end
