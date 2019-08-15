class Player
    #identity ['X','O']
    #name ["Player N°1", "Player N°2"]
    #turn [true, false]
    attr_accessor :identity, :name, :turn
​
    def initialize(identity, name, turn)    
        @identity = identity  
        @name = name  
        @turn = turn
    end 
end

class Board
    #main_board: Grid: 3rows, 3columns
    attr_accessor :main_board

    def initialize()
        @main_board = [["1","2","3"],["4","5","6"],["7","8","9"]]
    end  

        #this function show the content of the grid
    #for the beginning:
    # | - | - | - |
    # | 1 | 2 | 3 |
    # | - | - | - |
    # | 4 | 5 | 6 |
    # | - | - | - |
    # | 7 | 8 | 9 |
    # | - | - | - |
    def show_board()
        puts ("| - | - | - |")
        for i in 0..2 do
            row = "|"
            (3).times do |j|
                row += " " + @main_board[i][j].to_s + " |"
            end
            puts row
            puts "| - | - | - |"
        end
    end
end