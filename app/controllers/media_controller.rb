class MediaController < ApplicationController
  before_action :set_media, only: %i[ show edit update destroy ]

  # GET /media or /media.json
  def index
    @media = Media.all
  end

  # GET /media/1 or /media/1.json
  def show
  end

  # GET /media/new
  def new
    @media = Media.new
  end

  # GET /media/1/edit
  def edit
  end

  # POST /media or /media.json
  def create
    @media = Media.new(media_params)

    @media.file params.fetch(:media_file)

    respond_to do |format|
      if @media.save
        format.html { redirect_to media_url(@media), notice: "Media was successfully created." }
        format.json { render :show, status: :created, location: @media }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @media.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media/1 or /media/1.json
  def update
    @media.file params.fetch(:media_file)
    
    respond_to do |format|
      if @media.update(media_params)
        format.html { redirect_to media_url(@media), notice: "Media was successfully updated." }
        format.json { render :show, status: :ok, location: @media }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @media.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1 or /media/1.json
  def destroy
    @media.destroy

    respond_to do |format|
      format.html { redirect_to media_index_url, notice: "Media was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media
      @media = Media.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def media_params
      params.require(:media).permit(:file, :review_id)
    end
end
