class Game < ApplicationRecord
  belongs_to :user
  # attr_accessor :selected_word
  # attr_accessor :selected_letters
  @@selected_letters = []
  @@misses = []
  @@guesses = []



  MAX_MISSES = 6

  def selected_letters
    @@selected_letters
  end

  def misses
    @@misses
  end

  def guesses
    @@guesses
  end



  # def misses
  #   self.selected_letters.select { |letter|
  #     !self.word.include?(letter)
  #   }

  # end

  # def guesses
  #   self.selected_letters.select {|letter|
  #     self.word.include?(letter)
  #   } #select is a private method error. 
  # end


  def guessed?
    (self.word.split('') - selected_letters).empty?
  end

  def finished?
    self.misses.size >= MAX_MISSES || guessed?
  end


  def blanks
     "____ " * self.word.size
  
  end



  # def update_blanks(letter)
  #   if self.selected_letters == []
  #     self.blanks
  #   else
  #     self.word.split("").map.with_index do |char, idx|
  #       if char == letter.downcase
  #         self.blanks[idx] = letter
  #         byebug
  #       elsif char != letter.downcase
  #         self.blanks[idx] = "____ " 
  #       end
  #     end
  #   end
    
  #   self.blanks
  # end

  def select!(letter)
    # byebug
    #cannot get passed this because selected_letters is nil!
      if !self.misses.include?(letter) && !self.word.include?(letter.downcase)
        self.misses << letter 
      elsif !self.guesses.include?(letter) && self.word.include?(letter.downcase)
        self.guesses << letter 
      end

    # update_blanks(letter)
  end


end

 
   # if !self.selected_letters.include?(letter) && !self.word.include?(letter.downcase)

