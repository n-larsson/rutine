RSpec.describe Routine, type: :model do
  describe "#name" do
    it "must be present" do
      routine = Routine.new.tap(&:save)
      expect(routine).to have(1).errors_on(:name)
    end
  end
end
