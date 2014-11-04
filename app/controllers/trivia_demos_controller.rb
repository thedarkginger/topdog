class TriviaDemosController < ApplicationController
  before_action :set_trivia_demo, only: [:show, :edit, :update, :destroy]

  # GET /trivia_demos
  # GET /trivia_demos.json
  def index
    @trivia_demos = TriviaDemo.all
  end

  # GET /trivia_demos/1
  # GET /trivia_demos/1.json
  def show
  end

  # GET /trivia_demos/new
  def new
    @trivia_demo = TriviaDemo.new
  end

  # GET /trivia_demos/1/edit
  def edit
  end

  # POST /trivia_demos
  # POST /trivia_demos.json
  def create
    @trivia_demo = TriviaDemo.new(trivia_demo_params)

    respond_to do |format|
      if @trivia_demo.save
        format.html { redirect_to @trivia_demo, notice: 'Trivia demo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trivia_demo }
      else
        format.html { render action: 'new' }
        format.json { render json: @trivia_demo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trivia_demos/1
  # PATCH/PUT /trivia_demos/1.json
  def update
    respond_to do |format|
      if @trivia_demo.update(trivia_demo_params)
        format.html { redirect_to @trivia_demo, notice: 'Trivia demo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trivia_demo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trivia_demos/1
  # DELETE /trivia_demos/1.json
  def destroy
    @trivia_demo.destroy
    respond_to do |format|
      format.html { redirect_to trivia_demos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trivia_demo
      @trivia_demo = TriviaDemo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trivia_demo_params
      params.require(:trivia_demo).permit(:order, :question, :answer1, :answer2, :answer3, :answer4, :correcta, :published)
    end
end
