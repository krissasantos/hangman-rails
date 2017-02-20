require_relative '../adapters/dictionary_adapter.rb'
require 'byebug'

class GamesController < ApplicationController
  def index
    # render :show
  end
  def new
    @game = Game.new
    # @game.word = DictionaryAdapter.get_word(@game)
    @user = current_user
  end

  def create
    # @user = current_user
    # word = DictionaryAdapter.get_word(params[:difficulty], params[:maxLength])

    # word = DictionaryAdapter.get_word(@user.set_difficulty, @user.set_maxLength)
    # @game = Game.create(user_id: @user.id, difficulty: @user.set_difficulty, maxLength: @user.set_maxLength, word: word.to_s)
    @user = current_user
    sample_word = DictionaryAdapter.get_word(params[:difficulty],params[:maxLength])
    byebug
    @game = Game.new(user_id: @user.id, difficulty: game_params[:difficulty], maxLength: game_params[:maxLength], word: sample_word)
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end


    # Post.new(poster_id: @poster.id, pairing_id: params[:post][:pairing_id], title: params[:post][:title], content: params[:post][:content])

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
