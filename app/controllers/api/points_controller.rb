class Api::PointsController < ApplicationController
  def index
    render json: {}, status: 200
  end

  def create
    point = Point.new(PointPresenter.in(point_params))

    if point.save
      render json: PointPresenter.out(point), status: :created
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def destroy
    render json: {}, status: 200
  end

private

  def point_params
    params.permit(:lon, :lat, :direction, :comment)
  end
end
