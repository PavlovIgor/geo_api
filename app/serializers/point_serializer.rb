class PointSerializer < ActiveModel::Serializer
  attributes :id, :lon, :lat, :direction, :comment

  def lon
    object.lonlat.lon
  end

  def lat
    object.lonlat.lat
  end
end
