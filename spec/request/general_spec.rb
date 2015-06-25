RSpec.describe "API", type: :request do
  describe "GET / — health check" do
    it "is OK when authenticated" do
      get "/"

      expect(response.status).to eq(200)
      expect(response.body).to eq("OK")
    end
  end
end
