class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update, :destroy]

  # GET /guides
  # GET /guides.json
  def index
    @order_guide = current_order.order_guides.new
    key = params[:q]
    search_language = params[:search_language]
    if( search_language == "Other")
      @guides =   Guide.where(Guide.arel_table[:language].does_not_match('%French%')).where(Guide.arel_table[:language].does_not_match('%English%')).search_name key
    else
      @guides = Guide.search_language(search_language).search_name key
    end

    respond_to do |format|
     format.html
     format.pdf do
       pdf = ReportPdf.new(@guides)
       send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
     end
   end




end


  # GET /guides/1
  # GET /guides/1.json
  def show
  end

  # GET /guides/new
  def new
    @guide = Guide.new
  end

  # GET /guides/1/edit
  def edit
  end

  # POST /guides
  # POST /guides.json
  def create
    @guide = Guide.new(guide_params)

    respond_to do |format|
      if @guide.save
        format.html { redirect_to @guide, notice: 'Guide was successfully created.' }
        format.json { render :show, status: :created, location: @guide }
      else
        format.html { render :new }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guides/1
  # PATCH/PUT /guides/1.json
  def update
    respond_to do |format|
      if @guide.update(guide_params)
        format.html { redirect_to @guide, notice: 'Guide was successfully updated.' }
        format.json { render :show, status: :ok, location: @guide }
      else
        format.html { render :edit }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guides/1
  # DELETE /guides/1.json
  def destroy
    @guide.destroy
    respond_to do |format|
      format.html { redirect_to guides_url, notice: 'Guide was successfully destroyed.' }
      format.json { head :no_content }
        end
  end
def show
  @comment = Comment.new
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guide
      @guide = Guide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guide_params
      params.require(:guide).permit(:name, :password, :date, :language, :address, :email, :image, :rating)
    end
end
