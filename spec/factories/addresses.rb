# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    CEP { '12345789' }
    public_place { 'Rua' }
    district { 'Filadelfia' }
    city { 'Tokyo' }
    UF { 'NY' }
    citizen { create(:citizen) }
  end
end