class ChipzsController < ApplicationController
  before_action :set_chipz, only: [:show, :edit, :update, :destroy]

  # GET /chipzs
  # GET /chipzs.json
  def index
    @chipzs = Chipz.all
  end

  # GET /chipzs/1
  # GET /chipzs/1.json
  def show
  end

  # GET /chipzs/new
  def new
    @chipz = Chipz.new
  end

  # GET /chipzs/1/edit
  def edit
  end

  # POST /chipzs
  # POST /chipzs.json
  def create
    @chipz = Chipz.new(chipz_params)

    respond_to do |format|
      if @chipz.save
        format.html { redirect_to @chipz, notice: 'Chipz was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chipz }
      else
        format.html { render action: 'new' }
        format.json { render json: @chipz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chipzs/1
  # PATCH/PUT /chipzs/1.json
  def update
    respond_to do |format|
      if @chipz.update(chipz_params)
        format.html { redirect_to @chipz, notice: 'Chipz was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chipz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chipzs/1
  # DELETE /chipzs/1.json
  def destroy
    @chipz.destroy
    respond_to do |format|
      format.html { redirect_to chipzs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chipz
      @chipz = Chipz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chipz_params
      params.require(:chipz).permit(:category, :rank, :prize)
    end
end
