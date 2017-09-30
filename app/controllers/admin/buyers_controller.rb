class Admin::BuyersController < Admin::BaseAdminController
  def new
    @buyer = User.new role_id: Settings.user_role.buyer
    @buyer.user_addresses.build
  end

  def create
    account_service = Buyer::CreateAccountService.new buyer_params
    @buyer = account_service.buyer
    if account_service.execute
      flash[:success] = t "create_buyer.create_success"
      redirect_to admin_root_path
    else
      @buyer.valid?
      render :new
    end
  end

  def index
    @user = User.where(:role, 1)
  end

  private
  def buyer_params
    params.require(:user).permit Buyer::CreateAccountService::BUYER_ATTRIBUTES
  end
end
