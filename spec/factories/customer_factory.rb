require 'faker'
require 'option_constants'

FactoryGirl.define do
  factory :customer do
    first_name "John"
    last_name "Snow"
    height "5'10"
    weight Random.rand(100..200)
    eye_color OptionConstants.random_eye_color
    hair_color OptionConstants.random_hair_color
    state OptionConstants.random_state
    head_hunting_fee 5
    head_hunting_fee_paid false
    id_cost 40
    id_price 80
  end
end
