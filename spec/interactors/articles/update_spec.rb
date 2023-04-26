require "rails_helper"

describe Articles::Update do
  describe ".organized" do
    let(:expected_order) do
      [
        Articles::Update::Execute
      ]
    end

    it "organize interactors in correct order" do
      expect(described_class.organized).to eq(expected_order)
    end
  end
end
