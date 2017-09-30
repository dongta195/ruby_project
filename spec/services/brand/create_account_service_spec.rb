require "rails_helper"

RSpec.describe Brand::CreateAccountService, type: :service do
  describe "#execute" do
    let!(:brand_role){FactoryGirl.create :role, id: 1, name: "brand"}
    let!(:buyer_role){FactoryGirl.create :role, id: 2, name: "buyer"}
    let :account_params do
      {
        name: "brand 1",
        username: "brand1",
        password: "Brand123456",
        password_confirmation: "Brand123456",
        role_id: brand_role.id
      }
    end
    let :company_images do
      [
        {
          product_image: "/public/upload/company_photo1.png",
          position: 1,
          image_type: "company_image"
        },
        {
          product_image: "/public/upload/company_photo2.png",
          position: 2,
          image_type: "company_image"
        },
        {
          product_image: "/public/upload/company_photo3.png",
          position: 1,
          image_type: "product_image"
        },
        {
          product_image: "/public/upload/company_photo4.png",
          position: 2,
          image_type: "company_image"
        }
      ]
    end

    context "when params are valid to create the account" do
      before do
        Brand::CreateAccountService.new(account_params).execute
      end
      subject{User.find_by_username("brand1").present?}
      it{is_expected.to be true}
    end

    context "when miss username" do
      before do
        account_params[:username] = nil
      end

      subject{Brand::CreateAccountService.new(account_params).execute}
      it{is_expected.to be false}
    end

    context "when username is duplicate" do
      let :account2_params do
        {
          name: "brand 2",
          username: "brand1",
          password: "abcdxyz123",
          password_confirmation: "abcdxyz123",
          role_id: brand_role.id
        }
      end
      before do
        Brand::CreateAccountService.new(account_params).execute
      end
      subject{Brand::CreateAccountService.new(account2_params).execute}
      it{is_expected.to be false}
    end

    context "when fullsize and half size users are sensitive" do
      let :account2_params do
        {
          name: "brand 2",
          username: "brand１",
          password: "abcdxyz123",
          password_confirmation: "abcdxyz123",
          role_id: brand_role.id
        }
      end
      before do
        Brand::CreateAccountService.new(account_params).execute
      end
      subject{Brand::CreateAccountService.new(account2_params).execute}
      it{is_expected.to be true}
    end

    context "when username has spaces at head or tail" do
      before do
        account_params[:username] = "  brand1  "
        Brand::CreateAccountService.new(account_params).execute
      end
      subject{User.first.username}
      it{is_expected.to eq "brand1"}
    end

    context "when normal and capital leters are sensitive" do
      let :account2_params do
        {
          name: "brand 2",
          username: "BRand1",
          password: "abcdxyz123",
          password_confirmation: "abcdxyz123",
          role_id: brand_role.id
        }
      end
      before do
        Brand::CreateAccountService.new(account_params).execute
      end
      subject{Brand::CreateAccountService.new(account2_params).execute}
      it{is_expected.to be true}
    end

    context "when miss password" do
      before do
        account_params[:password] = nil
      end
      subject{Brand::CreateAccountService.new(account_params).execute}
      it{is_expected.to be false}
    end

    context "when password and password_confirmation not same" do
      before do
        account_params[:password] = "Brand1234566"
        account_params[:password_confirmation] = "Brand2222222"
      end
      subject{Brand::CreateAccountService.new(account_params).execute}
      it{is_expected.to be false}
    end

    context "when upload photos" do
      before do
        account_params[:company_logo] = "/public/upload/logo.png"
        account_params[:company_images_attributes] = company_images
        Brand::CreateAccountService.new(account_params).execute
      end
      it do
        expect(User.first.company_images.where(image_type: "product_image")
          .count).to eq 1
      end
      it do
        expect(User.first.company_images.where(image_type: "product_image")
          .count).to eq 1
      end
    end

    context "when no photos be uploaded" do
      before do
        Brand::CreateAccountService.new(account_params).execute
      end
      subject{User.first.company_images.present?}
      it{is_expected.to be false}
    end

    context "when full information is filled" do
      let :addresses do
        [
          {
            lastname: "jack",
            firstname: "richard",
            lastname_kana: "lastname1",
            firstname_kana: "firstname1",
            address: "22, Thomson street",
            building_name: "abc",
            telephone: "1234566789",
            is_default_addr: true,
            zipcode: "1234567"
          },
          {
            lastname: "andrey",
            firstname: "beller",
            lastname_kana: "lastname2",
            firstname_kana: "firstname2",
            address: "25, Thomson street",
            building_name: "zyx",
            telephone: "1234536789",
            is_default_addr: false,
            zipcode: "1234222"
          }
        ]
      end
      before do
        account_params[:description] = "This is the description"
        account_params[:company_name] = "Kappa"
        account_params[:company_url] = "http://kappa.org"
        account_params[:company_logo] = "/public/upload/logo.png"
        account_params[:email] = "testuser@gmail.com"
        account_params[:user_addresses_attributes] = addresses
        account_params[:company_images_attributes] = company_images
      end
      subject{Brand::CreateAccountService.new(account_params).execute}
      it{is_expected.to be true}
    end
  end

  describe "#initialize" do
    let!(:brand_role){FactoryGirl.create :role, id: 1, name: "brand"}
    let :account_params do
      {
        name: "brand 1",
        username: "brand1",
        password: "Brand123456",
        password_confirmation: "Brand123456",
        role_id: brand_role.id
      }
    end
    let(:service_obj){Brand::CreateAccountService.new(account_params)}
    let(:except_attrs){%i(encrypted_password company_logo)}
    it{expect(service_obj.account_params).to eq account_params}
    it do
      expect(service_obj.brand.as_json(except: except_attrs))
        .to eq User.new(account_params).as_json(except: except_attrs)
    end
  end
end
