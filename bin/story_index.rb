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
    when "RUUUUUUUUN" || "RUN AWAY"
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