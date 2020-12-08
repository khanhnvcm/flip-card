class GamesController < ApplicationController
	def new
    #Check username
    @user = params[:user].to_s
    if @user == ""
      redirect_to root_path, alert: 'Name must be filled out'
    elsif (@user =~ /\W/) || (@user.include?("_"))
      redirect_to root_path, alert: 'Name must be A-Za-z0-9'
    elsif @user.length > 20
      redirect_to root_path, alert: 'Name is too long'
    end
    #Decks cards
		@rank = ['A', 'K', 'Q', 'J', '10', '9', '8', '7', '6', '5', '4', '3', '2']
  	@suit = ['H', 'D', 'C', 'S']
  	@decks = Array.new

  	@rank.each do |rank|
  		@suit.each do |suit|
  			@decks << (rank + suit)
  		end
  	end
  	@new_game = @decks.shuffle

    @game = Game.new
	end

  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
    @games = Game.all.order(point: :asc)
    @index = @games.find_index(@game) + 1
  end

	def index
    @games = Game.all.order(point: :asc)
    @q = Game.ransack(search_params)
    @game = @q.result.order(point: :asc)
	end

  private
    def game_params
      params.require(:game).permit(:user, :move, :time, :point)
    end

    def search_params
      return unless params[:q]
      params.require(:q).permit(:user_cont, :created_at_dategteq, :created_at_datelteq)
    end

end
