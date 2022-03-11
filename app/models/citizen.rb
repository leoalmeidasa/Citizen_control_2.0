# frozen_string_literal: true

class Citizen < ApplicationRecord
  has_one :address
  accepts_nested_attributes_for :address

  validates :name, :birth_date, :telephone, presence: true
  validates :cpf, presence: true, length: { minimum: 11, maximum: 11 }, uniqueness: true
  validates :cns, presence: true, length: { minimum: 15, maximum: 15 }, uniqueness: true
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }
  validates :telephone, length: { is: 11 }

  has_one_attached :photo

  validate :validate_birth_date

  def validate_birth_date
    if birth_date.present? && birth_date > 18.years.ago
        errors.add(:birth_date, 'inválida, favor preencha com uma data válida !')
    end
  end
end