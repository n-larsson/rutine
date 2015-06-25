RSpec.describe Task, type: :model do
  describe "#name" do
    it "must be present" do
      task = Task.new.tap(&:save)
      expect(task).to have(1).errors_on(:name)
    end
  end

  describe "#routine" do
    it "must be present" do
      task = Task.new.tap(&:save)
      expect(task).to have(1).errors_on(:routine)
    end

    it "belongs to a routine" do
      routine = Routine.make!
      task = Task.make!(routine: routine)
      expect(task.reload.routine).to eq(routine)
    end
  end
end
