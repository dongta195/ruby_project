class Admin::SessionsController < Devise::SessionsController
  protected
  def after_sign_in_path_for resource
    stored_location_for(resource) || admin_root_path
  end

  def after_sign_out_path_for _resource
    admin_login_path
  end
end
