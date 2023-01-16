require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:api_key)}
    it { should validate_uniqueness_of(:email)}
    it { should validate_uniqueness_of(:api_key)}
  end

  describe ".generate_api_key" do
    it 'should return a unique api key' do
      key = User.generate_api_key

      expect(key).to be_a(String)
    end
  end
end
