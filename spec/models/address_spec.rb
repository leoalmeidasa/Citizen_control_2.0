# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { build(:address) }

  describe 'presence' do
    it { should validate_presence_of(:CEP) }
    it { should validate_presence_of(:public_place) }
    it { should validate_presence_of(:district) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:UF) }
  end
end
