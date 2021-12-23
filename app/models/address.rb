# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :citizen
  validates_presence_of :CEP, :public_place, :district, :city, :UF, presence: true, message: 'é obrigatório !'
end