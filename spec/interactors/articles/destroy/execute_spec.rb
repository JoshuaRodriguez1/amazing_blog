require "rails_helper"

describe Articles::Destroy::Execute do
  let(:interactor) { described_class.new(article: article) }

  context "with correct article" do
    let!(:article) { create(:article) }

    it "deletes the article" do
      expect { interactor.run }.to change(Article, :count).by(-1)
    end
  end

  context "when the article is not destroyed" do
    let!(:article) { create(:article) }
    let(:expected_error) { "Invalid" }

    before(:each) do
      allow(article).to receive(:destroy).and_return false
    end

    it "shows error" do
      interactor.run

      expect(interactor.context.error).to eq(expected_error)
    end
  end
end
