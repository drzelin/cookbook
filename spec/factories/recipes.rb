# spec/factories/recipes.rb

FactoryBot.define do
  factory :recipe do
    directions { "Chop and Mix" }
    name { "Greek Salad" }
    prep_time_in_mins { 30 }
    servings { 6 }
  end
end
