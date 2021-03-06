class UsersController < ApplicationController
  before_action :set_user

  def dashboard
    @collection = current_user.vinyls
    @pending_confirmations = current_user.rentals_as_owner.where.not(status: "Declined").sort_by { |rental| rental.status[0] }.reverse
    @rentals = current_user.rentals.where.not(status: "Pending")
    @pending_rentals = current_user.rentals.sort_by {|rental| rental.created_at }.reverse
  end

  def collection
    @collection = current_user.vinyls
  end

  def rentals
    @rentals = current_user.rentals
  end

  def pending_confirmation
    @pending_confirmations = current_user.rentals_as_owner.where(status: "pending")
  end

  def pending_rentals
    @pending_rentals = current_user.rentals.where(status: "pending")
  end

  private

  def set_user
    authorize current_user
  end

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :nickname, :address)
  end
end
