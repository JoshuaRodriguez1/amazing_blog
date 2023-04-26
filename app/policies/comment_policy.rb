class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end