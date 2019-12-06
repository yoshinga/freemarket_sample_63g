FactoryBot.define do

  factory :item do
    item_name              {"もふ"}
    discription            {"もふもふ"}
    burden_id              {1}
    prefecture_id          {1}
    condition_id           {1}
    price                  {1000}
    deliverydays_id        {1}
  end

end