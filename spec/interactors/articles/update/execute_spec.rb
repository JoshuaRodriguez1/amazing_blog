require "rails_helper"

describe Articles::Update::Execute do
  let(:interactor) { described_class.new(article_params: article_params, article: article) }

  context "with correct params and correct article" do
    let!(:article) { create(:article) }
    let(:article_params) { attributes_for(:article) }

    it "updates the article" do
      interactor.run

      expect(article.title).to eq(article_params[:title])
    end
  end

  context "when the article is not updated" do
    let!(:article) { create(:article) }
    let(:expected_error) { "Invalid" }
    let(:article_params) do
      {
        error: "error"
      }
    end

    before do
      allow(article).to receive(:update).and_return false
    end

    it "shows error" do
      interactor.run

      expect(interactor.context.error).to eq(expected_error)
    end
  end
end
