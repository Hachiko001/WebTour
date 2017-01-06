class GrayscalesController < ApplicationController
  layout "grayscale"
    def index
      @user = current_user
    end
end
