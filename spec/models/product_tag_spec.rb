require "rails_helper"

RSpec.describe ProductTag, type: :model do
  describe "association" do
    it{is_expected.to belong_to :product}
    it{is_expected.to belong_to :tag}
  end
end
