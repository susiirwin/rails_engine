require 'rails_helper'

RSpec.describe Item, type: :model do
  context "relationships" do
    it { should belong_to(:merchant)}
    it { should have_many(:invoice_items) }
  end
end
