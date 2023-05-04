require "rails_helper"

describe Articles::Create do
  describe ".organized" do
    let(:expected_order) do
      [
        Articles::Create::Execute, Articles::Create::CreateArticleTags
      ]
    end

    it "organize interactors in correct order" do
      expect(described_class.organized).to eq(expected_order)
    end
  end
end
