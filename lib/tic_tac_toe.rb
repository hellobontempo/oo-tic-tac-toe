class TicTacToe
    attr_accessor :player

    @@all = []
    WIN_COMBINATIONS =[
        [0, 1, 2], #top
        [3, 4, 5], #middle horizontal
        [6, 7, 8], #bottom
        [0, 3, 6], #left
        [1, 4, 7], #middle vertical 
        [2, 5, 8], #right
        [0, 4, 8], #l to r diagonal 
        [2, 4, 6], #r to l diagonal
    ]

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end
    
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def move(index, player)
        @board[index] = player
        #@@all << self
    end

    def position_taken?(index)
        if @board[index] == " " 
            false
        else
            true
        end
    end

    def valid_move?(index)
        if index.between?(0,8) && !position_taken?(index)
            true
        end
    end

    def turn_count
        counter = 0
        @board.each do |spot|
            if spot == "X" || spot == "O"
                counter += 1
            end
        end
        counter
    end

    def current_player
        self.turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        user_input = gets.chomp
        index = input_to_index(user_input)
            if valid_move?(index)
                move(index, current_player)
            else
                turn
            end
        display_board
    end

    def won?
        WIN_COMBINATIONS.detect do |combo| #iterate through each combination array [0,1,2]
            combo[0] #first index number
            combo[1] #second
            combo[2] #third

            @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] &&  position_taken?(combo[0]) 
        end
    end
    #false

    def full?
        if @board.all? {|x| x == "O" || x == "X"}
        true
        else
        false
        end
    end

    def draw?
        if self.full? && self.won? == nil
            true
        end
    end

    def over?
        true if self.draw? || self.won?
    end

    def winner
        @board[self.won?[2]] if won?
    end

    def play
        until over? do 
            turn
        end
        if won?
            puts "Congratulations #{self.winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end


end #class end
    