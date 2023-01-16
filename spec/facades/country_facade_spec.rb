require 'rails_helper'

RSpec.describe CountryFacade do
  it 'returns a list of countries' do
    all_countries = CountryFacade.random_country

    expect(all_countries).to be_a(Array)
    expect(all_countries.first).to be_an_instance_of(Country)
    expect(all_countries.first.name).to be_a(String)
    expect(all_countries.count).to eq(250)
  end
end