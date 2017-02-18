require_relative '../adapters/dictionary_adapter.rb'
require 'byebug'

class GamesController < ApplicationController
 

  def new
    @game = Game.new
    @user = current_user
  end

  def create
    @user = current_user
    @game = Game.new(user_id: @user.id, difficulty: params[:difficulty], maxLength: params[:maxLength])
    @game.save
    # Post.new(poster_id: @poster.id, pairing_id: params[:post][:pairing_id], title: params[:post][:title], content: params[:post][:content])
    redirect_to game_path(@game)
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
