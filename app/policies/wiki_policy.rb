class WikiPolicy < ApplicationPolicy

  def initialize(current_user, record)
    @user = current_user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    @user && @user.profile == @record
  end

  def update?
    @user && @user.profile == @record
  end

  def destroy?
    @user.present? && @user.admin?
  end

end
