require "rails_helper"

describe Comments::Update::Execute do
  let(:interactor) { described_class.new(comment_params: comment_params, comment: comment) }

  context "with correct params and correct article" do
    let!(:comment) { create(:comment) }
    let(:comment_params) { attributes_for(:comment) }

    it "updates the comment" do
      interactor.run

      expect(comment.content).to eq(comment_params[:content])
    end
  end

  context "when the article is not updated" do
    let!(:comment) { create(:comment) }
    let(:expected_error) { "invalid params" }
    let(:comment_params) do
      {
        error: "error"
      }
    end

    before do
      allow(comment).to receive(:update).and_return false
    end

    it "shows error" do
      interactor.run

      expect(interactor.context.error).to eq(expected_error)
    end
  end
end
