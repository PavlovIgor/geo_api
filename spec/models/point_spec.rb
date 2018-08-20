require 'rails_helper'

RSpec.describe Point, type: :model do
  let!(:point) { build :point }
  let!(:empty_lonlat_point) { build :point, :empty_lonlat }

  it { expect(point).to be_valid }
  it { expect(empty_lonlat_point).not_to be_valid }
end
