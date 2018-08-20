class PointPresenter
  def self.in(data)
    {
      lonlat: "Point(#{data[:lon]} #{data[:lat]})",
      direction: data[:direction],
      comment: data[:comment]
    }
  end

  def self.out(object)
    {
      id: object.id,
      lon: object.lonlat.lon,
      lat: object.lonlat.lat,
      direction: object.direction,
      comment: object.comment
    }
  end
end
