# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Citizens', type: :request do
  let(:citizen) { create(:citizen) }
  let(:citizen_valid_attributes) { build(:citizen).attributes }

  let(:invalid_attributes) do
    {
      name: 'Anime',
      cpf: nil,
      cns: 'Tanjirō Kamado',
      email: 'Japão',
      birth_date: 19.years.ago,
      telephone: '99999999999',
      status: false
    }
  end

  let(:valid_headers) do
    {}
  end

  describe "GET /index" do
    it "renders a successful response" do
      Citizen.create! citizen_valid_attributes
      get citizens_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Citizen' do
        expect do
          post citizens_url,
               params: { citizen: citizen_valid_attributes }, as: :json
        end.to change(Citizen, :count).by(1)
      end
    end
  end

  describe "PUT /update" do
    before do
      patch citizen_url(citizen), params: { citizen: {name: "Evandro"} }
      citizen.reload
    end
    it "renders a successful response" do
      expect(citizen.name).to eq('Evandro')
    end
  end
end