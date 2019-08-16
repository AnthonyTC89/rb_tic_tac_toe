# frozen_string_literal: true

# Show the rules of the game at the beginning
def show_rules
  puts '*******WELCOME AND GET READY FOR A ROUND OF TIC TAC TOE*******'
  puts 'PLEASE: make sure to follow the instruction bellow'
  puts 'STEP ONE: Two players are needed for a session: Player one and Player two'
  puts 'STEP TWO: The winner has to align atleast three marks veritically, horizontally or obliguely'
  puts 'STEP THREE: Players are not allowed to repeat their choice or select an already selected space'
  puts 'STEP FOUR: The game is a draw in case all the spaces of the board are used up and the round restarted'
  puts '***********Have fun*************'
end

# The function shows the Rules of the game
def show_draw
  puts 'No more avalaible spaces, consider it a draw'
  puts 'The game will be re-started'
  puts 'loading................'
  puts 'Press any key to continue'
end

# The function shows a message when the game has a winner
def show_winner(player)
  puts 'Winner: ' + player.name + "(#{player.identity})" + '. CONGRATULATIONS!!!'
end

# This function show the content of the grid
# for the beginning:
# | - | - | - |
# | 1 | 2 | 3 |
# | - | - | - |
# | 4 | 5 | 6 |
# | - | - | - |
# | 7 | 8 | 9 |
# | - | - | - |
def show_board(board)
  puts '| - | - | - |'
  (0..2).each do |i|
    row = '|'
    3.times do |j|
      row += ' ' + board.main_board[i][j].to_s + ' |'
    end
    puts row
    puts '| - | - | - |'
  end
end

# The Player N°1 have the option to select the kind of mark in the game
# This function finish when 'X' or 'O' were selected, othercases are not allowed
# After the choising the function show the Mark of each Player and a message for
# the beginning of the game
def select_player_mark
  puts('PLAYER N° 1, select a mark: (X) or (O)')
  loop do
    mark = gets.chomp.upcase
    if mark != 'X' && mark != 'O'
      p mark.upcase
      puts 'Write a correct mark'
    else
      return mark
    end
  end
end

# This function show the name of the players and their marks.
def show_start_game(main)
  puts (main.player1.name + ' is: ' + main.player1.identity)
  puts (main.player2.name + ' is: ' + main.player2.identity)
  puts 'TIC TAC TOE.. start!'
end

# The Players have the option to choose a number in the Grid
# The numbers allowed are between 1 and 9
def select_number
  number = 0
  loop do
    number = gets.to_i
    cond = true
    if number > 9 || number < 1
      puts 'Write a correct number'
      cond = false
    end
    break if cond
  end
  number
end

require '../lib/tic_tac_toe.rb'

<<<<<<< HEAD
# The game start, until the game has a winner continue the game 
show_rules() 
loop do
  mark = select_player_mark()
  game = TicTacToe.new(mark)
  show_start_game(game)
  show_board(game.board)
  while (game.board.have_space()) do
    player_turn = game.turn()
    puts (player_turn.name + ' turn')
    loop do
      number = select_number() 
      if game.board.check_choise_player(player_turn, number) 
        game.board.save_choise_player(player_turn, number)
        break 
=======
# The game start, until the game has a winner continue the game
loop do
  main = TicTacToe.new
  show_rules
  mark = select_player_mark
  main.player1.identity = mark
  main.player2.identity = mark == 'X' ? 'O' : 'X'
  show_start_game(main)
  show_board(main.board)
  while main.board.have_space
    player_turn = main.turn
    puts (player_turn.name + ' turn')
    loop do
      number = select_number
      if main.board.check_choise_player(player_turn, number)
        break
>>>>>>> 190882972c21cd01c13eafa66c11207ef7f713a3
      else
        puts 'Choose another number'
      end
    end
<<<<<<< HEAD
    show_board(game.board)
    game.winner = game.check_winnner()
    if game.winner
      break
    end
=======
    show_board(main.board)
    main.winner = main.check_winnner
    break if main.winner
>>>>>>> 190882972c21cd01c13eafa66c11207ef7f713a3
  end
  if game.winner
    show_winner(player_turn)
  elsif
    show_draw
  end
  break if game.winner
end
puts 'THANKS FOR PLAYING TIC TAC TOE'
