RSpec.describe "API v1", type: :request do
  describe "POST /v1/routines - create a new routine" do
    context "success" do
      it "creates a routine with the given attributes" do
        query = { name: "Hire new employee" }

        expect do
          post "/v1/routines", query, authenticated_headers
        end.to change { Routine.count}.by(1)

        expect(response.status).to eq(201)
        expect(response_json).to include({
          id: Routine.last.id,
          name: "Hire new employee",
        })
        expect(Routine.last.name).to eq("Hire new employee")
      end
    end

    context "failure" do
      it "returns errors" do
        query = { name: "" }

        expect do
          post "/v1/routines", query, authenticated_headers
        end.to_not change { Routine.count }

        expect(response.status).to eq(422)
        expect(response_json).to include(name: ["can't be blank"])
      end
    end
  end
end
