# frozen_string_literal: true

class Citizen < ApplicationRecord
  has_one :address

  validates :name, :cpf, :cns, :email, :birth_date, :telephone, presence: true
  validates :cpf, length: { minimum: 11, maximum: 11 }, uniqueness: true
  validates :cns, length: { minimum: 15, maximum: 15 }, uniqueness: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }

  has_one_attached :photo

  validate :validate_birth_date

  def validate_birth_date
    if birth_date.present? && birth_date > 18.years.ago || 110.years.ago < birth_date
      errors.add(:birth_date, 'You should be over 18 years old or above 110 years old.')
    end
  end
end