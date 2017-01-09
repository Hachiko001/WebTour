class HomeController < ApplicationController
  def index

  end

  def menu
  if params[:section]
    @guides = Guide.where section: params[:section]
  else
    if params[:q]
      keyword = params[:q]
      @guides = Guide.search_name keyword
              sort_mode = params[:sort_mode]
              if sort_mode =="0"
                @guides = @guides.name_order
              else
                @guides = @guides.price_order
              end
    else
      @guides = Guide.all
    end
  end
  end
end
