RSpec.describe "API v1", type: :request do
  let(:routine) { Routine.make! }

  describe "POST /v1/routines/:routine_id/tasks - create a new task" do
    context "success" do
      it "creates a task with the given attributes" do
        query = { name: "Give keys" }

        expect do
          post "/v1/routines/#{routine.id}/tasks", query, authenticated_headers
        end.to change { Task.count}.by(1)

        expected_attributes = {
          routine_id: routine.id,
          id: Task.last.id,
          name: "Give keys"
        }

        expect(response.status).to eq(201)
        expect(response_json).to include(expected_attributes)
        expect(last_attributes(Task)).to include(expected_attributes)
      end
    end

    context "failure" do
      it "returns errors" do
        query = { name: "" }

        expect do
          post "/v1/routines/#{routine.id}/tasks", query, authenticated_headers
        end.to_not change { Task.count }

        expect(response.status).to eq(422)
        expect(response_json).to include(name: ["can't be blank"])
      end
    end
  end
end
