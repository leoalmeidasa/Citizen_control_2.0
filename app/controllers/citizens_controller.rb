# frozen_string_literal: true

class CitizensController < ApplicationController
  before_action :set_citizen, only: %i[show edit update]

  # GET /citizens or /citizens.json
  def index
    @q = Citizen.ransack(params[:q])
    @citizens = @q.result
  end

  # GET /citizens/1 or /citizens/1.json
  def show; end

  # GET /citizens/new
  def new
    @citizen = Citizen.new
    @citizen.build_address
  end

  # GET /citizens/1/edit
  def edit; end

  # POST /citizens or /citizens.json
  def create
    @citizen = Citizen.new(citizen_params)

      if @citizen.save
        redirect_to citizen_path(@citizen)
      else
        render :new
      end
  end

  # PATCH/PUT /citizens/1 or /citizens/1.json
  def update
    respond_to do |format|
      if @citizen.update(citizen_params)
        format.html { redirect_to citizen_url(@citizen), notice: 'Citizen was successfully updated.' }
        format.json { render :show, status: :ok, location: @citizen }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_citizen
    @citizen = Citizen.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def citizen_params
    params.require(:citizen).permit(:name, :cpf, :cns, :email, :birth_date, :telephone, :status, :photo,
                                    address_attributes: [:id, :CEP, :public_place, :complement, :district, :city, :UF, :IBGE_code]                           )
  end
end
