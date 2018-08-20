class Api::PointsController < ApplicationController
  def index
    render json: {}, status: 200
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
    point = Point.find(params[:id])
    if point
      point.destroy
      render json: {}, status: :accepted
    else
      render json: {}, status: :not_found
    end
  end

private

  def point_params
    params.permit(:lon, :lat, :direction, :comment)
  end
end
