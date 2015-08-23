class Sports1sController < ApplicationController
  before_action :set_sports1, only: [:show, :edit, :update, :destroy]

  # GET /sports1s
  # GET /sports1s.json
  def index
    @sports1s = Sports1.all
  end

  # GET /sports1s/1
  # GET /sports1s/1.json
  def show
  end

  # GET /sports1s/new
  def new
    @sports1 = Sports1.new
  end

  # GET /sports1s/1/edit
  def edit
  end

  # POST /sports1s
  # POST /sports1s.json
  def create
    @sports1 = Sports1.new(sports1_params)

    respond_to do |format|
      if @sports1.save
        format.html { redirect_to @sports1, notice: 'Sports1 was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sports1 }
      else
        format.html { render action: 'new' }
        format.json { render json: @sports1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sports1s/1
  # PATCH/PUT /sports1s/1.json
  def update
    respond_to do |format|
      if @sports1.update(sports1_params)
        format.html { redirect_to @sports1, notice: 'Sports1 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sports1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sports1s/1
  # DELETE /sports1s/1.json
  def destroy
    @sports1.destroy
    respond_to do |format|
      format.html { redirect_to sports1s_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sports1
      @sports1 = Sports1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sports1_params
      params.require(:sports1).permit(:question, :answers, :correcta, :quizdate)
    end
end
