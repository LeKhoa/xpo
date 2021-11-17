class ShrimpyUser < ApplicationRecord
  has_many :exchange_accounts, dependent: :destroy

  after_create :create_user_at_shrimpy, if: :uuid_is_not_exist?


  private

  def create_user_at_shrimpy
    service = Shrimpy::UserService.new(self)
    service.create_user

    update!(active: false) unless service.success?
  end

  def uuid_is_not_exist?
    uuid.blank?
  end
end
