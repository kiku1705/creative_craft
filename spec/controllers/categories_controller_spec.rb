RSpec.describe CategoriesController, type: :controller do
  describe "#GET index - HTLM" do
    it "it should return list of categories" do
      get :index, format: :html
      expect(response.status).to have_http_status(:success)
    end

    it "#POST create - HTLM" do
    end

    it "#PUT update - HTLM" do
    end
  end
end