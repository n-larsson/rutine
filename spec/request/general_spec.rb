RSpec.describe "API", type: :request do
  describe "GET / — health check" do
    it "is OK when authenticated" do
      get "/", {}, authenticated_headers

      expect(response.status).to eq(200)
      expect(response.body).to eq("OK")
    end

    it "is unauthorized when not authenticated" do
      get "/"

      expect(response.status).to eq(401)
      expect(response.body).to include "HTTP Token: Access denied"
    end
  end
end
