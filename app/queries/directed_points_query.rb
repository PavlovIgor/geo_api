class DirectedPointsQuery

  def initialize(relation = Point.all, params = {})
    @relation = relation
    @params = params
    @direction_difference = prepare_diraction
    @query = <<-SQL
      ST_Distance( lonlat, ST_POINT(:lon, :lat)::geography ) < :distance AND
      degrees( ST_Azimuth( lonlat, ST_POINT(:lon, :lat)::geography ) )BETWEEN
      :direction_0 AND :direction_1
    SQL
  end

  def find
    @relation.where(
      @query,
      lon: @params[:lon],
      lat: @params[:lat],
      distance: @params[:distance],
      direction_0: @direction_difference[0],
      direction_1: @direction_difference[1]
    )
  end

private

  def prepare_diraction
    direction = @params[:direction].to_f
    direction = -180 + (360 - direction) if direction > 180
    [ direction - 15, direction + 15 ]
  end

end
