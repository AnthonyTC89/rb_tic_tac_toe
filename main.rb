class Player
    #identity ['X','O']
    #name ["Player N°1", "Player N°2"]
    #turn [true, false]
    attr_accessor :identity, :name, :turn
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
        puts "*******WELCOME AND GET READY FOR A ROUND OF TIC TAC TOE*******"
        puts "PLEASE: make sure to follow the instruction bellow"
        puts "STEP ONE: Two players are needed for a session: Player one and Player two"
        puts "STEP TWO: The winner has to align atleast three marks veritically, horizontally or obliguely"
        puts "STEP THREE: Players are not allowed to repeat their choice or select an already selected space"
        puts "STEP FOUR: The game is a draw in case all the spaces of the board are used up and the round restarted"
        puts "***********Have fun*************"
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
    #the function shows the Rules of the game
    def show_draw()
        puts "No more avalaible spaces, consider it a draw"
        puts "The game will be re-started"
        puts "loading................"
        puts "Press any key to continue"
    end
    #The function shows a message when the game has a winner
    def show_winner(player)
        puts "Winner: " + player.name
    end
    #the function returns the player who have the turn
    def turn()
        if @player1.turn
            @player1.turn = false
            @player2.turn = true
            puts @player1.name + " turn"
            return @player1
        elsif @player2.turn
            @player2.turn = false
            @player1.turn = true
            puts @player2.name + " turn"
            return @player2
        end
    end
    #This section is the winning condition of the game
    #The function compare the content of the Grid 
    #e.g. if the Grid has:
    # | - | - | - |     # | - | - | - |
    # | X | X | X |     # | X | O | X |
    # | - | - | - |     # | - | - | - |
    # | O | 5 | O |     # | 4 | X | 6 | 
    # | - | - | - |     # | - | - | - |
    # | 7 | 8 | 9 |     # | X | 8 | O |
    # | - | - | - |     # | - | - | - |
    # the winner is the Player with the mark "X"
    def check_winnner()
        arr_b = @board.main_board.flatten
        if arr_b[0] == arr_b[1] && arr_b[1] == arr_b[2]
            return true
        elsif arr_b[3] == arr_b[4] && arr_b[4] == arr_b[5]
            return true
        elsif arr_b[6] == arr_b[7] && arr_b[7] == arr_b[8]
            return true
        elsif arr_b[0] == arr_b[3] && arr_b[3] == arr_b[6]
            return true
        elsif arr_b[1] == arr_b[4] && arr_b[4] == arr_b[7]
            return true
        elsif arr_b[2] == arr_b[5] && arr_b[5] == arr_b[8]
            return true
        elsif arr_b[0] == arr_b[4] && arr_b[4] == arr_b[8]
            return true
        elsif arr_b[2] == arr_b[4] && arr_b[4] == arr_b[6]
            return true
        end
        return false
    end
end

#the game start, until the game has a winner continue the game 
loop do
    main = Main.new()
    main.show_rules() 
    main.select_player_mark()
    main.board.show_board()
    while (main.board.have_space()) do
        player_turn = main.turn()
        loop do
            number = main.select_number()
            break if main.board.save_choise_player(player_turn, number)
        end
        main.board.show_board()
        main.winner = main.check_winnner()
        if main.winner
            break;
        end
    end
    if main.winner
        main.show_winner(player_turn)
    elsif
        main.show_draw()
    end
    break if main.winner
end
puts "THANKS FOR PLAYING TIC TAC TOE"