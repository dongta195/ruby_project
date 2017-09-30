require "rails_helper"

RSpec.describe Admin, type: :model do
  let(:admin){FactoryGirl.create :admin}

  describe "#email_required?" do
    subject{admin.email_required?}
    it{is_expected.to be false}
  end

  describe "#email_changed?" do
    subject{admin.email_changed?}
    it{is_expected.to be false}
  end

  describe "#will_save_change_to_email?" do
    subject{admin.will_save_change_to_email?}
    it{is_expected.to eq nil}
  end
end
