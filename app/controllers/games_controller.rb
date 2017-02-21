require_relative '../adapters/dictionary_adapter.rb'
require 'byebug'

class GamesController < ApplicationController
   
  helper_method :current_game

  def index
    # render :show
  end
  def new
    
    @game = Game.new
    set_current_game(@game)
    @user = current_user
  end

  def create     
    # @alphabet = ("A".."Z").to_a #make this a method of game. so game.alphabet

    @user = current_user
    sample_word = DictionaryAdapter.get_word(params['game']['difficulty'].to_i,params['game']['maxLength'].to_i)
    byebug
    @game = Game.new(user_id: @user.id, difficulty: params['game']['difficulty'].to_i, maxLength: params['game']['maxLength'].to_i, word: sample_word)
 

    if @game.save
    
      redirect_to game_path(@game)
    else
      render :new
    end

  end

  def show
    @alphabet = ("A".."Z").to_a #this is what's giving the view an aplhabet to iterate
    # @incorrect_guesses << params["selected_letter"] #also make this a method for game. @game.incorrect_guesses << params["selected_letter"]?
                            #@game.alphabet.delete(params["selected_letter"])
    # @correct_guesses = []
    @game = Game.find(params[:id]) #or game_params ?

    # @game.alphabet.delete(params["selected_letter"])
    # @alphabet.delete(params["selected_letter"])
    # render :game_path

  end


    

  def edit
  end 

  def update

    @game = Game.find(params[:id])
    @game.select!(params[:letter]) #select! method happens here upon submit with method patch
    update_current_game
    @game.update_blanks(params[:letter])
    render :show
  end


  # def game_params
  #   params.require(:game).permit(:difficulty, :maxLength)
  # end

  def set_current_game(game)
    @current_game = game
  end

  def update_current_game
    set_current_game(@current_game)
  end
end
