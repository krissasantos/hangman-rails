class Game < ApplicationRecord
  belongs_to :user
  has_many :misses
  has_many :guesses
  # has_many :blanks


  def missed_letters
    misses.map {|e| e.miss}
  end

  def guessed_letters
    guesses.map {|e| e.guess}
  end

  # def blank_spaces


  #   blanks.map {|e| e.blank}
  # end


  def selected_letters
    missed_letters + guessed_letters
  end

  MAX_MISSES = 6

  

  def guessed?
    (word.split('') - selected_letters).empty?
  end

  def finished?
    misses.size >= MAX_MISSES || guessed?
  end


  # def blanks
  #    "____ " * word.size

  # end
  
  def update_blanks(letter)
    blanks = self.blanks_spaces.split(" ")

    letter = letter.downcase

    word.split("").map.with_index do |char, idx| 
      if char == letter 
        # self.blanks_spaces.split(" ")[idx] = char 
        blanks[idx] = char
      end
    end
    # output = word.split("").map.with_index {|char, idx| self.blanks_spaces[idx] = char if char == letter  } .join(" ")
    self.blanks_spaces = blanks.join(" ")
    byebug
    return self.blanks_spaces
  
  end
  
  def select!(letter)
      if !misses.include?(letter) && !word.include?(letter.downcase)
     
        Miss.create(miss: letter, game_id: self.id)
      elsif !guesses.include?(letter) && word.include?(letter.downcase)
    
        Guess.create(guess: letter, game_id: self.id)
      end
  end




  # def blank_spaces #maybe this should be an added model ?
  #   update_blanks(letter)
  # end


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
