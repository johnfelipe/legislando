require 'rails_helper'

RSpec.describe Project, :type => :model do
  describe "#closed_for_contribution?" do
    context "when closed_for_contribution_at is nil" do
      it "should be false" do
        expect(subject.closed_for_contribution?).to be_falsey
      end
    end

    context "when closed_for_contribution_at is not nil" do
      before { subject.close_for_contribution }

      it "should be true" do
        expect(subject.closed_for_contribution?).to be_truthy
      end
    end
  end

  describe "#close_for_contribution" do
    subject { Project.make! }

    it "should update closed_for_contribution_at" do
      expect {
        subject.close_for_contribution
      }.to change{ subject.closed_for_contribution_at }
    end
  end
end