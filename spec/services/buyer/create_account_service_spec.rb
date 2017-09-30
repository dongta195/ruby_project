require "rails_helper"

RSpec.describe Buyer::CreateAccountService, type: :service do
  describe "create_buyer" do
    let!(:buyer_role){FactoryGirl.create :role, name: "buyer", id: 2}

    let :params do
      {
        username: "hungnv",
        email: "hungnv@gmail.com",
        password: "123456",
        password_confirmation: "123456",
        role_id: buyer_role.id
      }
    end

    context "when params are valid to create the account" do
      before do
        Buyer::CreateAccountService.new(params).execute
      end
      subject{User.find_by(email: "hungnv@gmail.com").present?}
      it{is_expected.to be true}
    end

    context "when username is nil" do
      before do
        params[:username] = nil
      end

      subject{Buyer::CreateAccountService.new(params).execute}
      it{is_expected.to be false}
    end

    context "when username has exist" do
      let :params2 do
        {
          username: "hungnv",
          email: "example@gmail.com",
          password: "123456",
          password_confirmation: "123456",
          role_id: buyer_role.id
        }
      end

      before do
        Buyer::CreateAccountService.new(params).execute
      end

      subject{Buyer::CreateAccountService.new(params2).execute}
      it{is_expected.to be false}
    end

    context "when email not valid" do
      before do
        Buyer::CreateAccountService.new(params).execute
        @user = User.find_by(email: "hungnv@gmail.com")
      end

      subject{@user}

      it "should be invalid" do
        email_invalid = %w(user@foo,com user_at_foo.org example.user@foo.
        foo@bar_baz.com foo@bar+baz.com)
        email_invalid.each do |invalid|
          @user.email = invalid
          expect(@user).not_to be_valid
        end
      end
    end

    context "when email has exists" do
      let :params2 do
        {
          username: "hungnv",
          email: "hungnv@gmail.com",
          password: "654321",
          password_confirmation: "654321",
          role_id: buyer_role.id
        }
      end

      before do
        Buyer::CreateAccountService.new(params).execute
      end

      subject{Buyer::CreateAccountService.new(params2).execute}
      it{is_expected.to be false}
    end

    context "when password is nil" do
      before do
        params[:password] = nil
      end

      subject{Buyer::CreateAccountService.new(params).execute}
      it{is_expected.to be false}
    end

    context "when password_confirmation not valid" do
      before do
        params[:password_confirmation] = "random"
      end

      subject{Buyer::CreateAccountService.new(params).execute}
      it{is_expected.to be false}
    end

    context "when role not valid" do
      before do
        params[:role_id] = 1
      end

      subject{Buyer::CreateAccountService.new(params).execute}
      it{is_expected.to be false}
    end

    context "when telephone invalid" do
      let :address do
        [
          {
            lastname: "jack",
            firstname: "richard",
            lastname_kana: "lastname1",
            firstname_kana: "firstname1",
            address: "22, Thomson street",
            building_name: "abc",
            telephone: "example",
            is_default_addr: true,
            zipcode: "1234567"
          }
        ]
      end

      before do
        params[:user_addresses_attributes] = address
      end

      subject{Buyer::CreateAccountService.new(params).execute}
      it{is_expected.to be false}
    end

    context "when zipcode invalid" do
      let :address do
        [
          {
            lastname: "jack",
            firstname: "richard",
            lastname_kana: "lastname1",
            firstname_kana: "firstname1",
            address: "22, Thomson street",
            building_name: "abc",
            telephone: "0364598454",
            is_default_addr: true,
            zipcode: "example"
          }
        ]
      end

      before do
        params[:user_addresses_attributes] = address
      end

      subject{Buyer::CreateAccountService.new(params).execute}
      it{is_expected.to be false}
    end

    context "when address information is filled" do
      let :address do
        [
          {
            lastname: "jack",
            firstname: "richard",
            lastname_kana: "lastname1",
            firstname_kana: "firstname1",
            address: "22, Tokyo",
            building_name: "abc",
            telephone: "1234566789",
            is_default_addr: true,
            zipcode: "1234567"
          },
          {
            lastname: "tom",
            firstname: "jerry",
            lastname_kana: "tomlast",
            firstname_kana: "jerryfirst",
            address: "22, Paris",
            building_name: "abc",
            telephone: "1234566789",
            is_default_addr: false,
            zipcode: "1234567"
          }
        ]
      end

      before do
        params[:description] = "This is the description"
        params[:company_name] = "Kappa"
        params[:user_addresses_attributes] = address
      end

      subject{Buyer::CreateAccountService.new(params).execute}
      it{is_expected.to be true}
    end
  end
end
