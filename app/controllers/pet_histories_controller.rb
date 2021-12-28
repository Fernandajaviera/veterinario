class PetHistoriesController < ApplicationController
  before_action :set_pet_history, only: [:show, :edit, :update, :destroy]
  before_action :find_pet
  before_action :find_cliente

  # GET /pet_histories
  # GET /pet_histories.json
  def index
    @pet_histories = @pet.pet_history
  end

  # GET /pet_histories/1
  # GET /pet_histories/1.json
  def show
  end

  # GET /pet_histories/new
  def new
    puts "AAAAAAAAA", @cliente
    @pet_history = PetHistory.new
  end

  # GET /pet_histories/1/edit
  def edit
  end

  # POST /pet_histories
  # POST /pet_histories.json
  def create
    @pet_history = PetHistory.new(pet_history_params)
    @pet_history.pet_id = @pet.id

    respond_to do |format|
      if @pet_history.save
        format.html { redirect_to cliente_pet_pet_histories_path, notice: 'pet_history was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /pet_histories/1
  # PATCH/PUT /pet_histories/1.json
  def update
    respond_to do |format|
      if @pet_history.update(pet_history_params)
        format.html { redirect_to cliente_pet_pet_histories_path, notice: 'Pet history was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet_history }
      else
        format.html { render :edit }
        format.json { render json: @pet_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_histories/1
  # DELETE /pet_histories/1.json
  def destroy
    @pet_history.destroy
    respond_to do |format|
      format.html { redirect_to cliente_pet_pet_histories_path, notice: 'Pet history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_history
      @pet_history = PetHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_history_params
      params.require(:pet_history).permit(:weight, :heigth, :description)
    end

    def find_pet
      @pet = Pet.find(params[:pet_id])
    end

    def find_cliente
      @cliente = Cliente.find(params[:cliente_id])
    end
end
