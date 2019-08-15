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

class Main
    attr_accessor :player1, :player2, :board, :winner
    def initialize()
        @player1 = Player.new('', 'Player N°1', true)  
        @player2 = Player.new('', 'Player N°2', false)
        @board = Board.new()  
        @winner = false
    end

    #Show the rules of the game at the beginning
    def show_rules()
        puts "RULES"
    end

    #The Player N°1 have the option to select the kind of mark in the game
    #This function finish when "X" or "O" were selected, othercases are not allowed
    #After the choising the function show the Mark of each Player and a message for
    #the beginning of the game
    def select_player_mark()
        puts("PLAYER N° 1, select a mark: (X) or (O)")
        mark = "X"
        loop do
            mark = gets.chomp.upcase
            cond = true
            if mark != "X" && mark != "O"
                p mark.upcase
                puts "Write a correct mark"
                cond = false
            end
            break if cond
        end
        @player1.identity = mark
        @player2.identity = mark == 'X' ? 'O' : 'X'
        puts (@player1.name + " is: " + player1.identity)
        puts (@player2.name + " is: " + player2.identity)
        puts "Start TIC TAC TOE"
    end

    #The Players have the option to choose a number in the Grid
    #The numbers allowed are between 1 and 9
    def select_number()
        number = 0
        loop do
            number = gets.to_i
            cond = true
            if number > 9 || number < 1
                puts "Write a correct number"
                cond = false
            end
            break if cond
        end
        return number
    end
end