class HomeController < ApplicationController
  def index
  	@games = Game.all.order(point: :asc)[0..4]
  end
end
