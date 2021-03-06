require 'rails_helper'

RSpec.describe Point, type: :model do
  let(:point) { build :point }
  let(:empty_lonlat_point) { build :point, :empty_lonlat }
  let(:empty_direction_point) { build :point, :empty_direction }

  let(:degree_0) { create :point, :degree_0 }
  let(:degree_90) { create :point, :degree_90 }
  let(:degree_180) { create :point, :degree_180 }
  let(:degree_270) { create :point, :degree_270 }
  let(:degree_0_query) { Point.directed(attributes_for(:point_request, :degree_0)) }
  let(:degree_90_query) { Point.directed(attributes_for(:point_request, :degree_90)) }
  let(:degree_180_query) { Point.directed(attributes_for(:point_request, :degree_180)) }
  let(:degree_270_query) { Point.directed(attributes_for(:point_request, :degree_270)) }

  it { expect(point).to be_valid }
  it { expect(empty_lonlat_point).not_to be_valid }
  it { expect(empty_direction_point).not_to be_valid }

  it{ expect(degree_0_query).to include(degree_0) }
  it{ expect(degree_0_query).not_to include(degree_90) }
  it{ expect(degree_0_query).not_to include(degree_180) }
  it{ expect(degree_0_query).not_to include(degree_270) }

  it{ expect(degree_90_query).to include(degree_90) }
  it{ expect(degree_90_query).not_to include(degree_0) }
  it{ expect(degree_90_query).not_to include(degree_180) }
  it{ expect(degree_90_query).not_to include(degree_270) }

  it{ expect(degree_180_query).to include(degree_180) }
  it{ expect(degree_180_query).not_to include(degree_0) }
  it{ expect(degree_180_query).not_to include(degree_90) }
  it{ expect(degree_180_query).not_to include(degree_270) }

  it{ expect(degree_270_query).to include(degree_270) }
  it{ expect(degree_270_query).not_to include(degree_0) }
  it{ expect(degree_270_query).not_to include(degree_90) }
  it{ expect(degree_270_query).not_to include(degree_180) }
end
