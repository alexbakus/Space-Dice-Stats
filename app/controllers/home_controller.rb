class HomeController < ApplicationController
  
  def index
    
    #rand variables
    @whitespace = "&nbsp;".html_safe
    
    number_of_dice_per_hand = 3
    play_multi_hand = false
    @number_of_hands_to_play = 10000
    
    # dice
    
    # green dice
    number_of_green_dice = 8
    
    number_of_green_planets = 5
    number_of_green_comets = 2
    number_of_green_suns = 3
    number_of_green_blackholes = 2
    
    # orange dice
    number_of_orange_dice = 4
    
    number_of_orange_planets = 4
    number_of_orange_comets = 3
    number_of_orange_suns = 2
    number_of_orange_blackholes = 3
    
    # red dice
    number_of_red_dice = 2
    
    number_of_red_planets = 1
    number_of_red_comets = 3
    number_of_red_suns = 3
    number_of_red_blackholes = 4
    number_of_red_supernova = 1
    
    
    # generate the dice arrays 
    
    # green 
    green_dice_array = []
    
    number_of_green_dice.times do 
      dice = []
      number_of_green_planets.times do 
        dice << "green_planet"
      end
      number_of_green_comets.times do
        dice << "green_comet"
      end
      number_of_green_suns.times do
        dice << "green_sun"
      end
      number_of_green_blackholes.times do 
        dice << "green_blackhole"
      end
      green_dice_array << dice
    end
    
    # orange
    orange_dice_array = []
    
    number_of_orange_dice.times do 
      dice = []
      number_of_orange_planets.times do 
        dice << "orange_planet"
      end
      number_of_orange_comets.times do
        dice << "orange_comet"
      end
      number_of_orange_suns.times do
        dice << "orange_sun"
      end
      number_of_orange_blackholes.times do 
        dice << "orange_blackhole"
      end
      orange_dice_array << dice
    end
    
    # red
    red_dice_array = []
    
    number_of_red_dice.times do 
      dice = []
      number_of_red_planets.times do 
        dice << "red_planet"
      end
      number_of_red_comets.times do
        dice << "red_comet"
      end
      number_of_red_suns.times do
        dice << "red_sun"
      end
      number_of_red_blackholes.times do 
        dice << "red_blackhole"
      end
      number_of_red_supernova.times do
        dice << "red_supernova"
      end
      red_dice_array << dice
    end
    
  
    # make dice pot array
    @dice = []
    
    green_dice_array.count.times do |int|
      @dice << green_dice_array[int]
    end
    orange_dice_array.count.times do |int|
      @dice << orange_dice_array[int]
    end
    red_dice_array.count.times do |int|
      @dice << red_dice_array[int]
    end
    
    #initiate count variables
    @supernova_count = 0
    @sun_hand_count = 0
    @sun_and_planet_count = 0
    @blackhole_array = []
    
    # do multi hand shit
    @number_of_hands_to_play.times do |hand|
      #shuffle the pot
      @dice.shuffle!

      #open hand
      @hand = []

      # pick up dice
      number_of_dice_per_hand.times do |int|
        @hand << @dice[int]
      end

      #roll the dice 
      @roll = []

      @hand.each do |di|
        @roll << di.shuffle.first
      end
  
      # count the hands with super nova
      @roll.count.times do |int|
        if @roll[int] == "red_supernova"
          @supernova_count = @supernova_count+1
        end
      end
      
      # count the hands with no black holes and planets
      @roll.count.times do |int|
        if @roll[int] == "green_sun" || @roll[int] == "orange_sun" || @roll[int] == "red_sun"
          @hand_sun_bool = true
        end
      end
      if @hand_sun_bool == true
        @sun_hand_count = @sun_hand_count+1
        @roll.count.times do |int|
          if @roll[int] == "green_planet" || @roll[int] == "orange_planet" || @roll[int] == "red_planet"
            @sun_and_planet_bool = true
          end
        end
        if @sun_and_planet_bool == true
          @sun_and_planet_count = @sun_and_planet_count+1
          @sun_and_planet_bool = false
        end
      end
      @hand_sun_bool = false
      
      # work out the chances of throwing black holes
      @blackhole_count = 0
      @roll.count.times do |int|
        if @roll[int] == "green_blackhole" || @roll[int] == "orange_blackhole" || @roll[int] == "red_blackhole"
          @blackhole_count = @blackhole_count+1
        end
      end
      @blackhole_array << @blackhole_count
    end
    
    @blackhole_array_counts = Hash.new(0)
    @blackhole_array.each { |int| @blackhole_array_counts[int] +=1 }
      
    
    #shuffle the pot
    @dice.shuffle!
    
    #open hand
    @hand = []
    
    # pick up dice
    number_of_dice_per_hand.times do |int|
      @hand << @dice[int]
    end
    
    #roll the dice 
    @roll = []
    
    @hand.each do |di|
      @roll << di.shuffle.first
    end
   
    
  end
  
end
