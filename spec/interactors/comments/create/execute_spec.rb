require "rails_helper"

describe Comments::Create::Execute do
  let(:interactor) { described_class.new(comment_params: comment_params, user: user, article: article) }

  context "When the user and article are present and params are correct" do
    let(:comment_params) { {content: "some sample content"} }
    let!(:user) { create(:user) }
    let!(:article) { create(:article) }

    it "creates a new comment" do
      expect{ interactor.run }.to change(Comment, :count).by(1)
    end
  end

  context "When the article receives incorrect params" do
    let(:comment_params) { {content: "some sample content"} }
    let!(:user) { nil }
    let!(:article) { nil }

    it "fails" do
      interactor.run

      expect(interactor.context.error).to be_present
    end
  end
end
