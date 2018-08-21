require 'rails_helper'

RSpec.describe PointAdapter do

  let(:adapter) { PointAdapter.adapt(attributes_for(:point_request)) }

  it{ expect(adapter).to include(lonlat: "Point(13.374526 62.5184006)") }
  it{ expect(adapter).to include(direction: 100) }
  it{ expect(adapter).to include(comment: "") }

  it{ expect(adapter).not_to include(:lon) }
  it{ expect(adapter).not_to include(:lat) }
end
