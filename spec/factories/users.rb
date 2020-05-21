FactoryBot.define do
  factory :user do
    nickname {"まーたろー"}
    family_name {"真"} 
    first_name {"太郎"}
    family_name_kana {"ま"}
    first_name_kana {"たろう"}
    password {"1111111"}
    email {"aaa@gmail.com"}
  end
end