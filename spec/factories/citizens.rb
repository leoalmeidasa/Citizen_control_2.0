# frozen_string_literal: true

FactoryBot.define do
  factory :citizen do
    name { 'Joao' }
    cpf { '01275638421' }
    cns { '028347659123745' }
    email { 'huse@email.com' }
    birth_date { '2000-10-03' }
    telephone { '99999999999' }
    status { true }
  end
end