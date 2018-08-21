FactoryBot.define do
  factory :point_request, class: Hash do
    lon 13.374526
    lat 62.5184006
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

    trait :degree_0 do
      direction 0
      distance 10000
    end

    trait :degree_90 do
      direction 90
      distance 10000
    end

    trait :degree_180 do
      direction 180
      distance 10000
    end

    trait :degree_270 do
      direction 270
      distance 10000
    end

  end
end
