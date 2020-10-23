require_relative '../config/environment'
require 'tty-prompt'
@prompt = TTY::Prompt.new

def menu
    system('clear')
    @prompt.say("Welcome!")
    options = {"Start" => 1, "Exit" => 2}
    action = @prompt.select("Choose" ,options)
    case action
    when 1
        username = login
        name = character(username)
        start(name)
    when 2
        abort "Game Over"
    end
end

def print_story(index,name)
    text = Story.find(index).text + "\n\n"
    choice1 = Story.find(index).choice1
    choice2 = Story.find(index).choice2
    system('clear')
    @prompt.say(text)
    choices = { choice1 => 1, choice2 => 2}
    action = @prompt.select("Enter" ,choices)
    case action
    when 1
        if Choice.where(story_id: index) == []
            Choice.create(char_id: Character.where(name: name).ids[0], story_id: index, choice: choice1)
        else
            Choice.where(story_id: index).update(char_id: Character.where(name: name).ids[0], story_id: index, choice: choice1)
        end
        choice1
    when 2
        if Choice.where(story_id: index) != []
            Choice.create(char_id: Character.where(name: name).ids, story_id: index, choice: choice2)
        else
            Choice.where(story_id: index).update(char_id: Character.where(name: name).ids, story_id: index, choice: choice2)
        end
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

def start(name)
    index = 1
    while index != nil
        choice = print_story(index, name)
        index = new_index(choice)
    end
    system('clear')
    puts "The End"
end

def login
    username = nil
    while username == nil
        system('clear')
        @prompt.say("User")
        options = {"Login" => 1, "Create" => 2, "Delete" => 3}
        action = @prompt.select("Choose" ,options)
        case action
        when 1
            user = @prompt.ask('Enter Username').to_s
            if User.where(username: user) != []
                puts "Hello #{user}"
                username = user
            end        
        when 2
            user = @prompt.ask('Enter Username')
            User.create(username: user)
            puts "Hello #{user}"
            username = user
        when 3
            user = @prompt.ask('Enter Username')
            User.where(username: user).delete_all
            username = nil
        end
    end
    username
end

def character(user)
    name = @prompt.ask('Enter Character Name')
    emoji = @prompt.ask('Enter Character emoji')
    pro = @prompt.ask('Enter pronouns')
    if Character.where(name: name) == []
        Character.create(name: name, appearance: emoji, pronouns: pro, user_id: user)
    else
        Character.where(name: name).update(name: name, appearance: emoji, pronouns: pro, user_id: user)
    end
    name
end