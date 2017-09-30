class Brand::CreateAccountService
  attr_reader :account_params, :brand

  BRAND_ATTRS = [:username, :role_id, :name, :description, :company_name,
    :company_url, :company_logo, :email, :password, :password_confirmation,
    user_addresses_attributes: [:lastname, :firstname, :lastname_kana,
    :firstname_kana, :address, :building_name, :telephone,
    :is_default_addr, :zipcode], company_images_attributes: [:product_image,
    :position, :image_type]]

  def initialize account_params
    @brand = User.new account_params
    @account_params = account_params
  end

  def execute
    user = User.new account_params
    user.save
  end
end
