# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do

  describe 'associations' do
    it { is_expected.to belong_to :citizen }
  end

  describe 'validations' do
    it { is_expected.to  validate_presence_of(:CEP) }
    it { is_expected.to  validate_presence_of(:public_place) }
    it { is_expected.to  validate_presence_of(:district) }
    it { is_expected.to  validate_presence_of(:city) }
    it { is_expected.to  validate_presence_of(:UF) }
    it { is_expected.to  validate_length_of(:CEP).is_equal_to(8) }
  end
end
