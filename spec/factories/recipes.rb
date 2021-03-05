FactoryBot.define do
  factory :recipe do
    title { Faker::Military.air_force_rank }
    detail { Faker::Markdown.headers }
    item { Faker::Markdown.headers }
    recipe_info1 { Faker::Markdown.random }
    recipe_info2 { Faker::Markdown.random }
    recipe_info3 { Faker::Markdown.random }
    recipe_info4 { Faker::Markdown.random }
    recipe_info5 { Faker::Markdown.random }
    recipe_time_id { 5 }

    association :user
    after(:build) do |recipe|
      recipe.image.attach(io: File.open('public/images/download.jpg'), filename: 'download.jpg')
    end
  end
end