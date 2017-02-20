require_relative '../adapters/dictionary_adapter.rb'
require 'byebug'

class GamesController < ApplicationController
  def index
    # render :show
  end
  def new
    @game = Game.new
    @user = current_user
  end

  def create
    
    @user = current_user
    sample_word = DictionaryAdapter.get_word(params[:difficulty],params[:maxLength])
    byebug
    @game = Game.new(user_id: @user.id, difficulty: game_params[:difficulty], maxLength: game_params[:maxLength], word: sample_word)
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end

  end

  def show
    @game = Game.find(params[:id]) #or game_params ?
  end
    

  def edit
  end

  def update
  end


  def game_params
    params.require(:game).permit(:difficulty, :maxLength)
  end
end
