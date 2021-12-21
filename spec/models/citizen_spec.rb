# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Citizen, type: :model do
  let(:citizen) { build(:citizen) }

  describe 'presence' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:cns) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:telephone) }
  end
end