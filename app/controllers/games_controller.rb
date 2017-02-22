require_relative '../adapters/dictionary_adapter.rb'
require 'byebug'

class GamesController < ApplicationController

  def index
  end

  def new
    @game = Game.new
    @user = current_user
  end

  def create
    @user = current_user
    sample_word = DictionaryAdapter.get_word(params['game']['difficulty'].to_i,params['game']['maxLength'].to_i)
    blanks = "_  " * sample_word.size

    @game = Game.new(user_id: @user.id, difficulty: params['game']['difficulty'].to_i, maxLength: params['game']['maxLength'].to_i, word: sample_word, blanks_spaces: blanks)

    if @game.save

      redirect_to game_path(@game)
    else

      render :new
    end
  end

  def show
    @alphabet = ("A".."Z").to_a 
    @game = Game.find(params[:id])
  end

  def edit
  end

  def update
    @game = Game.find(params[:id])
    @game.select!(params[:letter]) #select! method happens here upon submit with method patch
    @game.update_blanks(params[:letter])
    @game.update_attribute(:blanks_spaces, @game.update_blanks(params[:letter]))
    # byebug
    render :show
  end
end
