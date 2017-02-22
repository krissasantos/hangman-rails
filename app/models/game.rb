class Game < ApplicationRecord
  belongs_to :user
  has_many :misses
  has_many :guesses


  def missed_letters
    misses.map {|e| e.miss}
  end

  def guessed_letters
    guesses.map {|e| e.guess}
  end

  def selected_letters
    missed_letters + guessed_letters
  end

  MAX_MISSES = 6

  

  def guessed?
    guessed_letters.size == word.size 
  end

  def guessed_word?
    self.blanks_spaces == self.word
  end

  def finished?
    missed_letters.size >= MAX_MISSES || guessed? 
  end


 
  
  def update_blanks(letter)
    blanks = self.blanks_spaces.split(" ")
    letter = letter.downcase

    if letter.size > 1 #for whole word guess
      if letter == word 
        self.blanks_spaces = self.word

        return self.blanks_spaces
      else 
        self.blanks_spaces
      end
    end

    word.split("").map.with_index {|char, idx| blanks[idx] = char if char == letter} 
    
    self.blanks_spaces = blanks.join(" ")
    # byebug
    return self.word if finished? 
    return self.blanks_spaces
  
  end
  
  def select!(letter)
     if !misses.include?(letter) && !word.include?(letter.downcase)
  
         Miss.create(miss: letter, game_id: self.id)
     elsif !guesses.include?(letter) && word.include?(letter.downcase)
        
       Guess.create(guess: letter, game_id: self.id)
     end
  end


end
