class WikiPolicy < ApplicationPolicy

  def index?
    @standard && @premium && @admin
  end

  def show?
    @standard && @premium && @admin
  end

  def new?
    @standard && @premium && @admin
  end

  def create?
    @standard && @premium && @admin
  end

  def update?
    @standard && @premium && @admin
  end

  def edit?
    @standard && @premium && @admin
  end

  def destroy?
    @standard && @standard.profile == @record
    @premium && @premium.profile == @record
    @admin && @admin.profile == @record
  end

end
