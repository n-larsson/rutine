RSpec.describe RoutineAssignment, type: :model do
  describe "#user_id" do
    it "must be present" do
      assignment = RoutineAssignment.new.tap(&:save)
      expect(assignment).to have(1).errors_on(:user_id)
    end
  end

  describe "#routine" do
    it "must be present" do
      assignment = RoutineAssignment.new.tap(&:save)
      expect(assignment).to have(1).errors_on(:routine)
    end

    it "belongs to a routine" do
      routine = Routine.make!
      assignment = RoutineAssignment.make!(routine: routine)
      expect(assignment.reload.routine).to eq(routine)
    end
  end
end
