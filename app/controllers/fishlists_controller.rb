class FishlistsController < ApplicationController
  before_action :set_fishlist, only: %i[ show edit update destroy ]

  # GET /fishlists or /fishlists.json
  def index
    @fishlists = Fishlist.all
  end

  # GET /fishlists/1 or /fishlists/1.json
  def show
  end

  # GET /fishlists/new
  def new
    @fishlist = Fishlist.new
  end

  # GET /fishlists/1/edit
  def edit
  end

  # POST /fishlists or /fishlists.json
  def create
    @fishlist = Fishlist.new(fishlist_params)

    respond_to do |format|
      if @fishlist.save
        format.html { redirect_to fishlist_url(@fishlist), notice: t('controllers.common.List_was_successfully_created') }
        format.json { render :show, status: :created, location: @fishlist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fishlists/1 or /fishlists/1.json
  def update
    respond_to do |format|
      if @fishlist.update(fishlist_params)
        format.html { redirect_to fishlist_url(@fishlist), notice: t('controllers.common.List_was_successfully_updated') }
        format.json { render :show, status: :ok, location: @fishlist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fishlists/1 or /fishlists/1.json
  def destroy
    @fishlist.destroy

    respond_to do |format|
      format.html { redirect_to fishlists_url, notice: t('controllers.common.List_was_successfully_destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fishlist
      @fishlist = Fishlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fishlist_params
      params.require(:fishlist).permit(:date, :time, :prefecture_id, :place, :map, :fishname, :fishlength, :fishweight, :fishingmethod, :fishimg)
    end
end
