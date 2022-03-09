# frozen_string_literal: true

class CitizensController < ApplicationController
  before_action :set_citizen, only: %i[show edit update]

  def index
    @q = Citizen.ransack(params[:q])
    @citizens = @q.result
  end

  def new
    @citizen = Citizen.new
    @citizen.build_address
  end

  def show; end

  def edit; end

  def create
    @citizen = Citizen.new(citizen_params)

      if @citizen.save
        redirect_to citizen_path(@citizen)
      else
        render :new
      end
  end

  def update
      if @citizen.update(citizen_params)
        redirect_to citizens_path, notice: t('messages.success')
      else
        render :edit, status: :unprocessable_entity
      end
  end

  private

  def set_citizen
    @citizen = Citizen.find(params[:id])
  end

  def citizen_params
    params.require(:citizen).permit(:name, :cpf, :cns, :email, :birth_date, :telephone, :status, :photo,
                                    address_attributes: [:id, :CEP, :public_place, :complement, :district, :city, :UF, :IBGE_code]                           )
  end
end
