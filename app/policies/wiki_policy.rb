=begin
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

  class Scope
     attr_reader :user, :scope

     def initialize(user, scope)
       @user = user
       @scope = scope
     end

     def resolve
       wikis = []
       if user.role == 'admin'
         wikis = scope.all # if the user is an admin, show them all the wikis
       elsif user.role == 'premium'
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if wiki.public? || wiki.owner == user || wiki.collaborators.include?(user)
             wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
           end
         end
       else # this is the lowly standard user
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.public? || wiki.collaborators.include?(user)
             wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
           end
         end
       end
       wikis # return the wikis array we've built up
     end
   end

end
=end
