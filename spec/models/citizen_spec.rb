# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Citizen, type: :model do

  describe 'associations' do
    it { is_expected.to have_one :address }
    it { is_expected.to accept_nested_attributes_for :address }
    it { is_expected.to have_one_attached(:photo) }
  end

  describe 'validations' do
    it { is_expected.to validate_length_of(:cns).is_equal_to(15) }
    it { is_expected.to validate_length_of(:cpf).is_equal_to(11) }
    it { is_expected.to validate_length_of(:telephone).is_equal_to(11) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:cns) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to validate_presence_of(:telephone) }
    it { is_expected.to validate_uniqueness_of(:cpf) }
    it { is_expected.to validate_uniqueness_of(:cns) }

    describe '#validate_cpf' do
      context 'when cpf is not valid' do
        it 'should returns message of invalid cpf' do
          citizen = Citizen.new(cpf: '12457864285')
          citizen.valid?
          expect(citizen.errors[:cpf]).to contain_exactly("inválido, favor preencha com um cpf válido !")
        end
      end
      context 'when cpf is valid' do
        it 'should not return message of valid cpf' do
          citizen = Citizen.new(cpf: CPF.generate)
          citizen.valid?
          expect(citizen.errors[:cpf]).to be_empty
        end
      end
    end

    describe '.validates_email' do
      context 'when email is valid' do
        it { is_expected.to allow_value("email@address.foo").for(:email) }
      end
      context 'when email is invalid' do
        it { is_expected.to_not allow_value("foo").for(:email) }
      end
    end

    describe 'validate birth date' do
      context 'when birth date is invalid' do
        it 'should allow invalid birth date' do
          citizen = Citizen.new(birth_date: Date.yesterday)
          citizen.valid?
          expect(citizen.errors[:birth_date]).to include('inválida, favor preencha com uma data válida !')
        end
      end
      context 'when birth date is valid' do
        it 'should allow valid birth date' do
          citizen = Citizen.new(birth_date: '1993-05-04')
          citizen.valid?
          expect(citizen.errors[:birth_date]).to be_empty
        end
      end
    end
  end
end
