FactoryBot.define do
  factory :user do
    nickname {'ふりまタロウ'}
    email {Faker::Internet.free_email}
    password {'test12'}
    password_confirmation {password}
    lastname {'婦利増'}
    firstname {'太郎'}
    lastname_kana {'フリマ'}
    firstname_kana {'タロウ'}
    birthday {'2000/6/8'}
  end
end
