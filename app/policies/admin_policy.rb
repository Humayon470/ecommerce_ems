class AdminPolicy < ApplicationPolicy
  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.admin?
  end

  def show?
    @user.admin?
  end

  def new?
    @user.admin?
  end

  def create?
    @user.admin?
  end
  
  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

  def export_csv?
    @user.admin?
  end

  # Define other actions as needed...

  def scope
    Pundit.policy_scope!(@user, @record.class)
  end
end
