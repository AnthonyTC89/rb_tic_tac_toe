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

    #return true or false
    #1st
    #[["1","2","3"],["4","5","6"],["7","8","9"]] => ["1","2","3","4","5","6","7","8","9"]
    #2nd
    #compare if in the array exist "X" or "O"
    def have_space()
        return @main_board.flatten.any? { |mark| mark != "X" && mark != "O" }
    end

     #this function save "X" or "O" in the number selected of the Grid
    #e.g. if Player N°1 ("X") selected the number 2 in the first turn:
    # | - | - | - |
    # | 1 | X | 3 |
    # | - | - | - |
    # | 4 | 5 | 6 |
    # | - | - | - |
    # | 7 | 8 | 9 |
    # | - | - | - |
    # if the position in the Grid is free (without "X" or "O") return true,
    # othercase it returns false
    def save_choise_player(player, number)
        case number
        when 1
            if @main_board[0][0] == "X" || @main_board[0][0] == "O"
                puts "Choose another number"
                return false
            else
                @main_board[0][0] = player.identity
                return true
            end
        when 2
            if @main_board[0][1] == "X" || @main_board[0][1] == "O"
                puts "Choose another number"
                return false
            else
                @main_board[0][1] = player.identity
                return true
            end
        when 3
            if @main_board[0][2] == "X" || @main_board[0][2] == "O"
                puts "Choose another number"
                return false
            else
                @main_board[0][2] = player.identity
                return true
            end
        when 4
            if @main_board[1][0] == "X" || @main_board[1][0] == "O"
                puts "Choose another number"
                return false
            else
                @main_board[1][0] = player.identity
                return true
            end
        when 5
            if @main_board[1][1] == "X" || @main_board[1][1] == "O"
                puts "Choose another number"
                return false
            else
                @main_board[1][1] = player.identity
                return true
            end
        when 6
            if @main_board[1][2] == "X" || @main_board[1][2] == "O"
                puts "Choose another number"
                return false
            else
                @main_board[1][2] = player.identity
                return true
            end
        when 7
            if @main_board[2][0] == "X" || @main_board[2][0] == "O"
                puts "Choose another number"
                return false
            else
                @main_board[2][0] = player.identity
                return true
            end
        when 8
            if @main_board[2][1] == "X" || @main_board[2][1] == "O"
                puts "Choose another number"
                return false
            else
                @main_board[2][1] = player.identity
                return true
            end
        when 9
            if @main_board[2][2] == "X" || @main_board[2][2] == "O"
                puts "Choose another number"
                return false
            else
                @main_board[2][2] = player.identity
                return true
            end
        end
    end
end