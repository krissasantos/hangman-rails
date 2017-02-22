class Game < ApplicationRecord
  belongs_to :user
  has_many :misses
  has_many :guesses

  # def initialize(difficulty:, max_length:)
  #   byebug
  #   @selected_letters = []
  #   @misses= []
  #   @guesses= []
  # end

  def missed_letters
    misses.map {|e| e.miss}
  end

  def guessed_letters
    guesses.map {|e| e.guess}
  end


  # @@selected_letters = []
  # @@misses = []
  # @@guesses = []

  def selected_letters
    missed_letters + guessed_letters
  end

  MAX_MISSES = 6

  # def add_letters(letter)
  #   # new_arr = selected_letters << letter
  #   # selected_letters=(new_arr)
  #   # @selected_letters ||= []
  #   @selected_letters << letter
  # end
  #
  # def selected_letters
  #   @selected_letters
  # end
  #
  # def selected_letters=(new_letters)
  #   @selected_letters = new_letters
  # end
  #
  #
  # def add_misses(letter)
  #   misses << letter
  # end
  #
  # def misses
  #   @misses ||=[]
  # end
  #
  # def add_guesses(letter)
  #
  #   guesses << letter
  # end
  #
  # def guesses
  #   @guesses ||=[]
  # end

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
        Miss.create(miss: letter, game_id: self.id)
      elsif !guesses.include?(letter) && word.include?(letter.downcase)
        # selected_letters << letter
        # guesses << letter
        Guess.create(guess: letter, game_id: self.id)
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
