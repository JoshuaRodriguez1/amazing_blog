class ArticlePolicy < ApplicationPolicy
  authorize :user, optional: true
  
  def index?
    true
  end

  def create?
    user.present?
  end

  def show?
    true
  end

  def edit?
    user.present? && owner?
  end

  def publish? 
    user.present? && owner? && record.draft?
  end

  def unpublish?
    user.present? && owner? && record.published?
  end

  def update?
    edit?
  end

  def destroy?
    user.present? && owner?
  end

  private

  def owner?
    record.user == user
  end
end
