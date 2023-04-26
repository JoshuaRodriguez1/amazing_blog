require "rails_helper"

describe Comments::Destroy::Execute do
  let(:interactor) { described_class.new(comment: comment) }

  context "with correct comment" do
    let!(:comment) { create(:comment) }

    it "deletes the article" do
      expect { interactor.run }.to change(Comment, :count).by(-1)
    end
  end

  context "when the comment is not destroyed" do
    let!(:comment) { create(:comment) }
    let(:expected_error) { "comment not destroyed" }

    before do
      allow(comment).to receive(:destroy).and_return false
    end

    it "shows error" do
      interactor.run

      expect(interactor.context.error).to eq(expected_error)
    end
  end
end
