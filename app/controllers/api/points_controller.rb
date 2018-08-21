class Api::PointsController < ApplicationController
  def index
    direction_difference = prepare_diraction(params[:direction])

    points = Point.where(
      "ST_Distance( lonlat, ST_POINT(?, ?)::geography ) < ? AND
      degrees( ST_Azimuth( lonlat, ST_POINT(?, ?)::geography ) ) BETWEEN ? AND ?",
      params[:lon],
      params[:lat],
      params[:distance],
      params[:lon],
      params[:lat],
      direction_difference[0],
      direction_difference[1]
    )

    render json: points.as_json, status: :ok
  end

  def create
    point = Point.new(PointPresenter.in(point_params))

    if point.save
      render json: PointPresenter.out(point), status: :created
    else
      render json: point.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Point.find(params[:id]).destroy
    render json: {}, status: :accepted
  end

private

  def point_params
    params.permit(:lon, :lat, :direction, :comment)
  end

  def prepare_diraction(direction_string)
    dir_sum = ->(direction){ direction + direction * 0.15 }
    dir_ded = ->(direction){ direction - direction * 0.15 }

    direction = direction_string.to_f

    if direction > 180
      direction = -180 + (360 - direction)
      [
        dir_sum.call(direction),
        dir_ded.call(direction)
      ]
    else
      [
        dir_ded.call(direction),
        dir_sum.call(direction)
      ]
    end

  end
end
