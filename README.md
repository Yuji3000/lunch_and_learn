
To get your repo set up, please do the following: 
1. Fork and clone this repository onto your local machine
2. `cd lunch_and_learn`
3. `bundle install`
4. `rails db:{create,migrate}`
5. `bundle exec figaro install`
6. In your `application.yml`, assign your geocoding api key with the variable `api-ninja-key`


end points

GET /api/v1/recipes?country=thailand
Content-Type: application/json
Accept: application/json

```
{
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com..."
            }
        },
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Sriracha",
                "url": "http://www.jamieoliver.com/recipes/vegetables-recipes/sriracha/",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com/."
            }
        },
        {...},
        {...},
        {...},
        {etc},
    ]
}
```

GET /api/v1/learning_resources?country=laos
Content-Type: application/json
Accept: application/json


POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "name": "Athena Dao",
  "email": "athenadao@bestgirlever.com"
}