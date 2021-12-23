# frozen_string_literal: true

class Citizen < ApplicationRecord
  has_one :address

  validates_presence_of :name, :birth_date, :telephone, presence: true, message: 'é obrigatório !'
  validates_presence_of :cpf, presence: true, length: { minimum: 11, maximum: 11 }, uniqueness: true, message: 'o tamanho minimo é 11 caracteres !'
  validates_presence_of :cns, presence: true, length: { minimum: 15, maximum: 15 }, uniqueness: true, message: 'o tamanho minimo é 15 caracteres !'
  validates_presence_of :email, presence: true, format: { with: /\A.*@.*\.com\z/ }, message: 'não é válido !'

  has_one_attached :photo

  validate :validate_birth_date

  def validate_birth_date
    if birth_date.present? && birth_date > 18.years.ago
        errors.add(:birth_date, 'favor preencha com uma data válida !')
    end
  end
end