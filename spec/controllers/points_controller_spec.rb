require 'rails_helper'

RSpec.describe Api::PointsController, type: :controller do

  describe "GET #index" do

    before do
      @degree_0 = create :point, :degree_0
      @degree_90 = create :point, :degree_90
      @degree_180 = create :point, :degree_180
      @degree_270 = create :point, :degree_270
    end

    describe "degree 0" do
      before { get :index, params: attributes_for(:point_request, :degree_0) }
      let(:json){ JSON.parse(response.body) }
      let(:json_el){ json[0] }

      it { expect(response).to have_http_status(:success) }
      it { expect(json_el['id']).to eql(@degree_0.id) }
      it { expect(json.size).to eql(1) }

      it { expect(json_el).to include("id") }
      it { expect(json_el).to include("lon") }
      it { expect(json_el).to include("lat") }
      it { expect(json_el).to include("direction") }
      it { expect(json_el).to include("comment") }
      it { expect(json_el).not_to include(:lonlat) }
    end

    describe "degree 90" do
      before { get :index, params: attributes_for(:point_request, :degree_90) }
      let(:json){ JSON.parse(response.body) }
      let(:json_el){ json[0] }

      it { expect(response).to have_http_status(:success) }
      it { expect(json_el['id']).to eql(@degree_90.id) }
      it { expect(json.size).to eql(1) }
    end

    describe "degree 180" do
      before { get :index, params: attributes_for(:point_request, :degree_180) }
      let(:json){ JSON.parse(response.body) }
      let(:json_el){ json[0] }

      it { expect(response).to have_http_status(:success) }
      it { expect(json_el['id']).to eql(@degree_180.id) }
      it { expect(json.size).to eql(1) }
    end

    describe "degree 270" do
      before { get :index, params: attributes_for(:point_request, :degree_270) }
      let(:json){ JSON.parse(response.body) }
      let(:json_el){ json[0] }

      it { expect(response).to have_http_status(:success) }
      it { expect(json_el['id']).to eql(@degree_270.id) }
      it { expect(json.size).to eql(1) }
    end
  end

  describe "POST #create" do
    it "create new point" do
      post :create, params: attributes_for(:point_request)
      expect(response).to have_http_status(:created)
      expect(Point.all.count).to eq(1)
    end

    it "empty lon" do
      post :create, params: attributes_for(:point_request, :empty_lon_point)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Point.all.count).to eq(0)
    end

    it "empty lat" do
      post :create, params: attributes_for(:point_request, :empty_lat_point)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Point.all.count).to eq(0)
    end

    it "empty direction" do
      post :create, params: attributes_for(:point_request, :empty_direction_point)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Point.all.count).to eq(0)
    end
  end

  describe "DELETE #destroy" do
    let(:point) { create :point }

    it "delete point" do
      delete :destroy, params: { id: point.id }
      expect(response).to have_http_status(:accepted)
      expect(Point.all.count).to eq(0)
    end
  end

end
