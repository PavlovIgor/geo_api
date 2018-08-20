FactoryBot.define do
  factory :point do
    lonlat "POINT(100 100)"
    direction 100
    comment ""

    trait :empty_lonlat do
      lonlat nil
    end

    trait :empty_direction do
      direction nil
    end

  end
end
