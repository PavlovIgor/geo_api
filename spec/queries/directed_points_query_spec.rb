require 'rails_helper'

RSpec.describe DirectedPointsQuery do

  let(:degree_0) { create :point, :degree_0 }
  let(:degree_90) { create :point, :degree_90 }
  let(:degree_180) { create :point, :degree_180 }
  let(:degree_270) { create :point, :degree_270 }
  let(:degree_0_query) { DirectedPointsQuery.new(Point.all, attributes_for(:point_request, :degree_0) ).find }
  let(:degree_90_query) { DirectedPointsQuery.new(Point.all, attributes_for(:point_request, :degree_90) ).find }
  let(:degree_180_query) { DirectedPointsQuery.new(Point.all, attributes_for(:point_request, :degree_180) ).find }
  let(:degree_270_query) { DirectedPointsQuery.new(Point.all, attributes_for(:point_request, :degree_270) ).find }


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
