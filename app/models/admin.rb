class Admin < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
    :validatable, :timeoutable
  devise :database_authenticatable, authentication_keys: [:username]

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
  end
end
