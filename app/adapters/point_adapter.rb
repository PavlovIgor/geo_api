class PointAdapter

  def self.adapt(data)
    {
      lonlat: "Point(#{data[:lon]} #{data[:lat]})",
      direction: data[:direction],
      comment: data[:comment]
    }
  end

end
