class BootstrapBuilders::ButtonsController < ApplicationController
  before_action :set_user

  def destroy_btn; end

  def edit_btn; end

  def new_btn; end

  def show_btn; end

  def responsive_btn; end

private

  def set_user
    @user = User.find(params[:user_id]) if params[:user_id].present?
  end
end
