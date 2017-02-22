class Game < ApplicationRecord
  belongs_to :user
  # attr_accessor :selected_letters, :misses, :guesses

  # def initialize(params)
  #   byebug
  #   @selected_letters = []
  #   @misses= []
  #   @guesses= []

  # end


  # @@selected_letters = []
  # @@misses = []
  # @@guesses = []

  MAX_MISSES = 6

  def add_letters(letter)
    
    selected_letters << letter

  end

  def selected_letters
    
    @selected_letters ||=[]
  end


  def add_misses(letter)
    misses << letter
  end
  
  def misses
    @misses ||=[]
  end

  def add_guesses(letter)
  
    guesses << letter
  end

  def guesses
    @guesses ||=[]
  end

  def guessed?
    (word.split('') - selected_letters).empty?
  end

  def finished?
    misses.size >= MAX_MISSES || guessed?
  end


  def blanks
     "____ " * word.size
  
  end

  def update_blanks(letter)
    word.split("").map.with_index {|char, idx| char == letter ? blanks[idx] = char : blanks[idx] = "XXXX"} .join(" ")

  end

  def select!(letter)
 
      if !misses.include?(letter) && !word.include?(letter.downcase)
        # selected_letters << letter
        # misses << letter 

        add_letters(letter)
        add_misses(letter)

      elsif !guesses.include?(letter) && word.include?(letter.downcase)
        # selected_letters << letter
        # guesses << letter 

        add_letters(letter)
        add_guesses(letter)
      end

    update_blanks(letter.downcase)
  
  end



  # def update_blanks(letter)
  #   if self.selected_letters == []
  #     self.blanks
  #   else
  #     self.word.split("").map.with_index do |char, idx|
  #       if char == letter.downcase
  #         self.blanks[idx] = letter
       
  #       elsif char != letter.downcase
  #         self.blanks[idx] = "____ " 
  #       end
  #     end
  #   end
    
  #   self.blanks
  # end




end
