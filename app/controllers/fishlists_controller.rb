class FishlistsController < ApplicationController
  before_action :set_fishlist, only: %i[ show edit update destroy ]

  # GET /fishlists or /fishlists.json
  def index
    @fishlists = Fishlist.all.order(updated_at: :desc).page(params[:page]).per(6)
    @q = Fishlist.ransack(params[:q])
    @fishlist = @q.result.order(updated_at: :desc).page(params[:page]).per(6)
  end

  # GET /fishlists/1 or /fishlists/1.json
  def show
    @comment = Comment.new
    @comments = @fishlist.comments
    @likes_count = Favorite.where(fishlist_id: @fishlist.id).count
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
    @fishlist.user_id = current_user.id

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

    if params[:fishlist][:img_ids].present?
      params[:fishlist][:img_ids].each do |image_id|
        image = @fishlist.fishimg.find(image_id)
        image.purge
      end
    end

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
      params.require(:fishlist).permit(:date, :time, :prefecture_id, :place, :map, :fishname, :fishlength, :fishweight, :fishingmethod, fishimg: [])
    end
end
