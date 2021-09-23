FactoryBot.define do
  factory :shipping do
    postal_code     {'939-0362'}
    prefecture_id   {16}
    unicipality     {'射水市'}
    address         {'太閤山１丁目31−5'}
    building        {'フレンドハイツ'}
    tel_number      {'0903930712'}
    association :order
    end
  end
end
