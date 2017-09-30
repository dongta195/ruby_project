class Buyer::CreateAccountService
  attr_reader :account_params, :buyer

  BUYER_ATTRIBUTES = [:username, :role_id, :company_name, :email, :name,
                 :password, :password_confirmation, :store,
                 user_addresses_attributes: [:address, :building_name,
                 :telephone, :is_default_addr, :zipcode]]

  def initialize account_params
    @buyer = User.new account_params
    @account_params = account_params
  end

  def execute
    user = User.new account_params
    user.save
  end
end
