FactoryBot.define do
  factory :order_shipping do
      postal_code     {'939-0362'}
      prefecture_id   {16}
      unicipality     {'射水市'}
      address         {'太閤山１丁目31−5'}
      building        {'フレンドハイツ'}
      tel_number      {'0903930712'}
      token           {"tok_abcdefghijk00000000000000000"}
      price           {5000}
  end
end
