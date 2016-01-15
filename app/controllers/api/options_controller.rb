class Api::OptionsController < ApplicationController
  def show
    @user = current_user
    # @options = @user.options
  end
end
