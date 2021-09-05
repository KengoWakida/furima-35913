FactoryBot.define do
  factory :user do
    nickname {'furima太郎'}
    email {'test@furima'}
    password {'test12'}
    lastname {'婦利増'}
    firstname {'太郎'}
    lastname_kana {'フリマ'}
    firstname_kana {'タロウ'}
    birthday {'2000/6/8'}
  end
end
