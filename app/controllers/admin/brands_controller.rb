class Admin::BrandsController < Admin::BaseAdminController
  def new
    @brand = User.new role_id: Settings.user_role.brand
    @brand.build_reference_objects
  end

  def create
    account_service = Brand::CreateAccountService.new brand_params
    @brand = account_service.brand
    if account_service.execute
      flash[:success] = t "create_brand.success"
      redirect_to admin_root_path
    else
      @brand.valid?
      render :new
    end
  end

  private
  def brand_params
    params.require(:user).permit Brand::CreateAccountService::BRAND_ATTRS
  end
end
