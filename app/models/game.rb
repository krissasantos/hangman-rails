class Game < ApplicationRecord
  belongs_to :user
  # attr_accessor :selected_word
  # attr_accessor :selected_letters
  @@selected_letters = []

  # def initialize
  
  # end

  def selected_letters
    @@selected_letters
  end


  # def failed_attempts
  #   selected_letters.select { |letter|
  #     !word.include?(letter)
  #   }.size
  # end

  # def guessed?
  #   (word.split('') - selected_letters).empty?
  # end

  # def finished?
  #   failed_attempts >= MAX_FAILED_ATTEMPTS || guessed?
  # end

  def select!(letter)
    # raise GameOverError if finished?
    byebug
    #cannot get passed this because selected_letters is nil!
    self.selected_letters << letter unless self.selected_letters.include? letter
    # self.word.include? letter
  end


end

 

