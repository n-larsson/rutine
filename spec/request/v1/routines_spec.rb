RSpec.describe "API v1", type: :request do
  let(:user_id) { 123 }
  let(:routine) { Routine.make! }

  describe "POST /v1/routines - create a new routine" do
    context "success" do
      it "creates a routine with the given attributes" do
        query = { name: "Hire new employee" }

        expect do
          post "/v1/routines", query, authenticated_headers
        end.to change { Routine.count}.by(1)

        expected_attributes = {
          id: Routine.last.id,
          name: "Hire new employee"
        }

        expect(response.status).to eq(201)
        expect(response_json).to include(expected_attributes)
        expect(last_attributes(Routine)).to include(expected_attributes)
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

  describe "POST /v1/users/:user_id/routines/:routine_id/assignments - assign user to routine" do
    it "creates a routine with the given attributes" do
      expect do
        post "/v1/users/#{user_id}/routines/#{routine.id}/assignments", {}, authenticated_headers
      end.to change { RoutineAssignment.count }.by(1)

      expected_attributes = {
        id: RoutineAssignment.last.id,
        routine_id: routine.id,
        user_id: user_id
      }.with_indifferent_access

      expect(response.status).to eq(201)
      expect(response_json).to include(expected_attributes)
      expect(routine.assignments.first.attributes).to include(expected_attributes)
    end
  end
end
