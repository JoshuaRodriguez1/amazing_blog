require "rails_helper"

describe Articles::Create::Execute do
  let(:interactor) { described_class.new(article_params: article_params, user: user) }

  context "when the user is present and params are correct" do
    let!(:user) { create(:user) }
    let(:article_params) { attributes_for(:article) }

    it "creates a new article" do
      expect { interactor.run }.to change(Article, :count).by(1)
    end
  end

  context "When content is nil" do
    let!(:user) { create(:user) }
    let(:expected_error) { "Invalid" }
    let(:article_params) do
      {
        content: ""
      }
    end

    it "fails" do
      interactor.run

      expect(interactor.context.error).to eq(expected_error)
    end
  end
end
