require 'rails_helper'

RSpec.describe Api::PointsController, type: :controller do

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "POST #create" do
    it "create new point" do
      post :create, params: attributes_for(:point_request)
      expect(response).to have_http_status(:created)
    end

    it "empty lon" do
      post :create, params: attributes_for(:point_request, :empty_lon_point)
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "empty lat" do
      post :create, params: attributes_for(:point_request, :empty_lat_point)
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "empty direction" do
      post :create, params: attributes_for(:point_request, :empty_direction_point)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE #destroy" do
    let!(:point) { create :point }

    it "delete point" do
      delete :destroy, params: { id: point.id }
      expect(response).to have_http_status(:accepted)
    end
  end

end
