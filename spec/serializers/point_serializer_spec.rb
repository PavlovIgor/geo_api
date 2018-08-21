require 'rails_helper'

RSpec.describe PointSerializer do
  before(:each) do
    @point = build :point
    @serializer = PointSerializer.new(@point)
  end

  let(:serializer_json) { JSON.parse(@serializer.to_json) }

  it { expect(serializer_json['id']).to eql(@point.id) }
  it { expect(serializer_json['lon']).to eql(@point.lonlat.lon) }
  it { expect(serializer_json['lat']).to eql(@point.lonlat.lat) }
  it { expect(serializer_json['direction']).to eql(@point.direction) }
  it { expect(serializer_json['comment']).to eql(@point.comment) }

  it { expect(serializer_json).not_to include(:lonlat) }

end
