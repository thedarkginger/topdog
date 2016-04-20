class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def display_text
    "#{name} - #{category.id}" 
  end

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show

  end

  # GET /games/new
  def new
    @game = Game.new
    @quizzes = Quiz.all
    @game.points_allocations.build
  end

  # GET /games/1/edit
  def edit
    @quizzes = Quiz.all
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @quizzes = Quiz.all
       @match = Game.count + 1

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  def points_allocations
    @points_allocations = @game.points_allocations
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:starts_at, :name, :max_players, :entry, :quiz_id, :points_allocations_attributes => [:id, :game_id, :place, :points])
    end
end
