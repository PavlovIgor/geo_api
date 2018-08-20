FactoryBot.define do
  factory :point_request, class: Hash do
    lon 100
    lat 100
    direction 100
    comment ""

    trait :empty_lon_point do
      lon nil
    end

    trait :empty_lat_point do
      lat nil
    end

    trait :empty_direction_point do
      direction nil
    end

  end
end
