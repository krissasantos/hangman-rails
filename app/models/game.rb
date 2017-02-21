class Game < ApplicationRecord
  belongs_to :user
  # attr_accessor :selected_word
  # attr_accessor :selected_letters
  @@selected_letters = []
  @@misses = []
  @@guesses = []



  MAX_MISSES = 6

  def initialize
  @@selected_letters = []
  @@misses = []
  @@guesses = []
  end

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
       
  #       elsif char != letter.downcase
  #         self.blanks[idx] = "____ " 
  #       end
  #     end
  #   end
    
  #   self.blanks
  # end

def update_blanks(letter)
  self.word.split("").map.with_index {|char, idx| char == letter ? blanks[idx] = char : blanks[idx] = "XXXX"} .join(" ")

end
  def select!(letter)
 
      if !self.misses.include?(letter) && !self.word.include?(letter.downcase)
        self.selected_letters << letter
        self.misses << letter 
      elsif !self.guesses.include?(letter) && self.word.include?(letter.downcase)
        self.selected_letters << letter
        self.guesses << letter 
      end

    self.update_blanks(letter.downcase)
  
  end


end

 
   # if !self.selected_letters.include?(letter) && !self.word.include?(letter.downcase)


#last task: alter state of blanks
 #       <div class="small-12 medium-8 columns">
 #        <div class="row">
 #            <div class="small-12 columns">
 #                <ul class="word small-block-grid-<%= @game.word.length %>">
 #                    <% @game.word.split('').each do |letter| %>
 #                        <li>
 #                            <div class="word-letter">
 #                                <%= @game.finished? || @game.selected_letters.include?(letter) ? letter : '_' %>
 #                            </div>
 #                        </li>
 #                    <% end %>
 #                </ul>
 #            </div>
 #        </div>
 # 

#working: word.split("").map.with_index {|char, idx| char == letter ? blanks[idx] = char : blanks[idx] = "XXXX"} .join(" ")
#blanks formula purely for view      <!-- # <% blanks "___ " *@game.word.size %> -->

