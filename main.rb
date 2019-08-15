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