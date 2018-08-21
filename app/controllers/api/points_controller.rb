class Api::PointsController < ApplicationController

  def index
    points = Point.directed(params)
    render json: points, status: :ok
  end

  def create
    point = Point.new(PointAdapter.adapt(point_params))

    if point.save
      render json: point, status: :created
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

end
