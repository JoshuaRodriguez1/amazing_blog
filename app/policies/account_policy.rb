class AccountPolicy < ApplicationPolicy
  def dashboard?
    user.present?
  end

  def show?
    user.present?
  end

  def index?
    user.present?
  end
end
