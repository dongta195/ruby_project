require "rails_helper"

RSpec.describe ExhibitionsController, type: :controller do
  let!(:role){FactoryGirl.create :role, id: 1, name: "brand"}
  let!(:user){FactoryGirl.create :user, role_id: role.id}

  describe "callback" do
    it{should use_before_action :authenticate_user!}
    it{should_not use_before_action :prevent_ssl}
  end

  describe "authenticate user" do
    it "responds unsuccessfully without sign_in" do
      DatabaseCleaner.clean
      get :index
      expect(response).to_not be_success
      expect{raise "You must sign_in"}.to raise_error(RuntimeError)
    end
  end

  describe "GET #index" do
    before :each do
      DatabaseCleaner.start
      sign_in :user
    end

    it "assigns @exhibitions" do
      get :index
      expect(assigns :exhibitions)
        .to eq user.exhibitions.all
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    before :each do
      DatabaseCleaner.start
      sign_in :user
    end

    it "responds with JSON" do
      response.header["Content-Type"].should include "application/json"
    end
  end

  describe "POST #create" do
    before :each do
      DatabaseCleaner.start
      @params = {
        name: "Exhibition",
        brand_user_id: user.id
      }

      sign_in :user
    end

    it "param pemit" do
      should permit(:brand_user_id, :name, :description, :memo, :images,
        :status, :total_retail_sales, :total_wholesale_sales)
        .for(:create, params: {params: {exhibition: @params}}).on(:exhibition)
    end

    it "creates a new exhibitions" do
      expect{post :exhibition, params: {exhibition: @params}}
        .to change(Exhibition :count).by(1)
    end

    it "responds with JSON" do
      post :create, params: {exhibition: @params}, format: :json
      response.header["Content-Type"].should include "application/json"
    end

    it "flash message" do
      post :create, params: {exhibition: @params}, format: :json
      JSON.parse(response.body)["message"]
        .should eq "Exhibition was created successfully!"
    end
  end
end
