# frozen_string_literal: true

class Player
  # i deleted some comments from here

  attr_writer :turn
  attr_reader :identity, :name, :turn
  def initialize(identity, name, turn)
    @identity = identity
    @name = name
    @turn = turn
  end
end

class Board
  # main_board: Grid: 3rows, 3columns
  attr_reader :main_board

  def initialize
    @main_board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
  end

  # i deleted some comments from here
  def space?
    @main_board.flatten.any? { |mark| mark != 'X' && mark != 'O' }
  end

  # i deleted some comments from here
  def check_choise_player(_player, number)
    array_board = @main_board.flatten
    if array_board[number - 1] == 'X' || array_board[number - 1] == 'O'
      return false
    else
      return true
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def save_choise_player(player, number)
    case number
    when 1
      @main_board[0][0] = player.identity
    when 2
      @main_board[0][1] = player.identity
    when 3
      @main_board[0][2] = player.identity
    when 4
      @main_board[1][0] = player.identity
    when 5
      @main_board[1][1] = player.identity
    when 6
      @main_board[1][2] = player.identity
    when 7
      @main_board[2][0] = player.identity
    when 8
      @main_board[2][1] = player.identity
    when 9
      @main_board[2][2] = player.identity
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

class TicTacToe
  attr_writer :winner
  attr_reader :player1, :player2, :board, :winner

  def initialize(mark)
    mark2 = mark == 'X' ? 'O' : 'X'
    @player1 = Player.new(mark, 'Player N°1', true)
    @player2 = Player.new(mark2, 'Player N°2', false)
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

  # i deleted some comments from here
  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
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
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end
