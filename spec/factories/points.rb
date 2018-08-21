FactoryBot.define do
  factory :point do
    lonlat "POINT(13.374526 62.5184006)"
    direction 100
    comment ""

    trait :empty_lonlat do
      lonlat nil
    end

    trait :empty_direction do
      direction nil
    end

    trait :degree_0 do
      lonlat "POINT(13.374526 62.5184016)"
    end

    trait :degree_90 do
      lonlat "POINT(13.374536 62.5184006)"
    end

    trait :degree_180 do
      lonlat "POINT(13.374526 62.5183996)"
    end

    trait :degree_270 do
      lonlat "POINT(13.374516 62.5184006)"
    end

  end
end
