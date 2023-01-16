require 'rails_helper'

RSpec.describe RecipeFacade do 
  it '.find_recipes' do 
    VCR.use_cassette('recipefacade_thailand') do
      country = "Thailand"
      recipe = RecipeFacade.find_recipes(country)
      expected = "https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIr%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIH%2FdZbw5dNddxSHZX9YTLPIiNz1s6Ffw%2FAp98TgzZ687AiEApZWHRmQtQTkBgkvOLVJSPWLGwiz0f7he1rACcUY8HBkq1QQI4v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDPxHa8QIW%2FK3i5uV9yqpBG1YFS6dpAvqOkjln9crDmKXPMaMcYw%2FXyKYeV1hjq7ViDBtiJ33CT5MgI2XczaI%2BBERdqV18KKfeOjMwX0ijkTPY9dH%2B5spDqZ4wEi7NZFNuHpF7WIgQcqJkrSmwk6sw8dR3hxl9SYTm95eWUOSpbha91KkrhSzdwy81kBLqjkfwvFvqdMq6AqRWKOA3TcSbElHf8tvoa6DYuZw8ilC%2FMxrLqXs3InFigIQxPbuOdkIL0PZI8wHverLLuTLW6FSCTPRfLXZTTXJkFC5DutcmG1p5VJ0RLMGdNZbBendvDjOSRNrwzk4iRcMUIty5IIxOVcw%2F4XoAPhp1rmuG5myOE%2Bt0%2FcsdTeBn2%2BtZfEsn6etgciQLN1jsLFHSVpmV%2FdKn1fE1rEhPneUNT1QHlgJDdRRFlG1yrIDbdgg7%2BgmHPkOK7HllZLVULeb0lMtKsrfw%2Fjsx5jYe2JAK9AHqfxUA9kbTSGg6x%2B9WMGdTSC9aLKn9Dq25Og0MABZgq4zodJyDuGugpaBsySa4AtK9YiM%2F7UNaE5AE9vmgJZyusIvKT9Ri6AhTdr24Xu7CTdhi%2FoqUcNbhRJXTEYNF9769cruomt1cMU3o8Us1X8rO3VT3H9VzWO%2FwhopvA8rioTPnjkzIEGTBA7130%2FQbsU6nvSoKTshOaIx%2BiDZIrzW1qAl%2BAoSgWGX5d5JWWqwNz%2Ftlf8Ho3zLx2R3aIwMf5HiisKy%2BbgNFqPzh3kxdTUw3oOIngY6qQGMI%2F73k81EdzJ19CKmZMtQoR3loAYtN8QftHSeDcLxF8Q9ejLULleJry0s%2BOLZqwao7wflRbtP0OCTqw%2B%2Bt0TQVx9z0gwtFSqpk8QxlOMhbwzzTyGtEuZCBW3jjDMxnKrPUFSZRu1kBR39fonMazfr8y82i4PKvJzuRLuW7J1IXzYBl%2B61XRpfvWz6geronlGlzlcZEZzD9BeV%2FFebu0RtynLV32vHByLG&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230114T014607Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFKYVBHU5W%2F20230114%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=9f229e87c4b093b3bff4d5efc22fbebfc43d35faf31a590d908335c553ec72fc"

      expect(recipe).to be_a(Array)
      expect(recipe.first.country).to eq("Thailand")
      expect(recipe.first.image.present?).to eq(true)
      expect(recipe.first.image.include?("https://edamam-product-images.s3.amazonaws.com/")).to eq(true)
      expect(recipe.first.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(recipe.first.url).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
    end
  end 
end 