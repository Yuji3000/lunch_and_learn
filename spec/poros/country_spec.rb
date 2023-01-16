require 'rails_helper'

RSpec.describe Country do
  it 'has attributes and exists' do
    data = {
      common: "laos"
    }

    country = Country.new(data)
    expect(country).to be_a(Country)
    expect(country.name).to eq("laos")
  end

end