# frozen_string_literal: true

class Player
  # identity ['X','O']
  # name ['Player N°1', 'Player N°2']
  # turn [true, false]
  attr_accessor :identity, :name, :turn
  def initialize(identity, name, turn)
    @identity = identity
    @name = name
    @turn = turn
  end
end

class Board
  # main_board: Grid: 3rows, 3columns
  attr_accessor :main_board

  def initialize
    @main_board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
  end

  # return true or false
  # 1st
  # [['1','2','3'],['4','5','6'],['7','8','9']] => ['1','2','3','4','5','6','7','8','9']
  # 2nd
  # compare if in the array exist 'X' or 'O'
  def have_space
    @main_board.flatten.any? { |mark| mark != 'X' && mark != 'O' }
  end

  # this function save 'X' or 'O' in the number selected of the Grid
  # e.g. if Player N°1 ('X') selected the number 2 in the first turn:
  # | - | - | - |
  # | 1 | X | 3 |
  # | - | - | - |
  # | 4 | 5 | 6 |
  # | - | - | - |
  # | 7 | 8 | 9 |
  # | - | - | - |
  # if the position in the Grid is free (without 'X' or 'O') return true,
  # othercase it returns false
  def check_choise_player(player, number)
    case number
    when 1
      if @main_board[0][0] == 'X' || @main_board[0][0] == 'O'
        false
      else
        @main_board[0][0] = player.identity
        true
      end
    when 2
      if @main_board[0][1] == 'X' || @main_board[0][1] == 'O'
        false
      else
        @main_board[0][1] = player.identity
        true
      end
    when 3
      if @main_board[0][2] == 'X' || @main_board[0][2] == 'O'
        false
      else
        @main_board[0][2] = player.identity
        true
      end
    when 4
      if @main_board[1][0] == 'X' || @main_board[1][0] == 'O'
        false
      else
        @main_board[1][0] = player.identity
        true
      end
    when 5
      if @main_board[1][1] == 'X' || @main_board[1][1] == 'O'
        false
      else
        @main_board[1][1] = player.identity
        true
      end
    when 6
      if @main_board[1][2] == 'X' || @main_board[1][2] == 'O'
        false
      else
        @main_board[1][2] = player.identity
        true
      end
    when 7
      if @main_board[2][0] == 'X' || @main_board[2][0] == 'O'
        false
      else
        @main_board[2][0] = player.identity
        true
      end
    when 8
      if @main_board[2][1] == 'X' || @main_board[2][1] == 'O'
        false
      else
        @main_board[2][1] = player.identity
        true
      end
    when 9
      if @main_board[2][2] == 'X' || @main_board[2][2] == 'O'
        false
      else
        @main_board[2][2] = player.identity
        true
      end
    end
  end
end

class TicTacToe
  attr_accessor :player1, :player2, :board, :winner
  def initialize
    @player1 = Player.new('', 'Player N°1', true)
    @player2 = Player.new('', 'Player N°2', false)
    @board = Board.new
    @winner = false
  end

  # the function returns the player who have the turn
  def turn
    if @player1.turn
      @player1.turn = false
      @player2.turn = true
      @player1
    elsif @player2.turn
      @player2.turn = false
      @player1.turn = true
      @player2
    end
  end

  # This section is the winning condition of the game
  # The function compare the content of the Grid
  # e.g. if the Grid has:
  # | - | - | - |     # | - | - | - |
  # | X | X | X |     # | X | O | X |
  # | - | - | - |     # | - | - | - |
  # | O | 5 | O |     # | 4 | X | 6 |
  # | - | - | - |     # | - | - | - |
  # | 7 | 8 | 9 |     # | X | 8 | O |
  # | - | - | - |     # | - | - | - |
  # the winner is the Player with the mark 'X'
  def check_winnner
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

    false
  end
end
