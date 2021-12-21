# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Addresses', type: :request do
  let(:address) { create(:address) }
  let(:address_valid_attributes) { build(:address).attributes }

  let(:invalid_attributes) do
    {
      CEP: 'Anime',
      public_place: nil,
      district: 'Tanjirō Kamado',
      city: 'Japão',
      UF: '2019-09-28',
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get addresses_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get address_url(address), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Address' do
        expect do
          post addresses_url,
               params: { address: address_valid_attributes }, as: :json
        end.to change(Address, :count).by(1)
      end

      it 'renders a JSON response with the new address' do
        post addresses_url,
             params: { address: address_valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
      end
    end
  end
end