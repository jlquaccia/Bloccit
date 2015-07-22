class PostPolicy < ApplicationPolicy
  def index?
    true
  end

# Assignment 39 ///////////////////////

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.moderator?
        scope.all
      elsif user.member?
        scope.where(:published => true)
      else
        false
      end
    end
  end

# //////////////////////////////////////
end