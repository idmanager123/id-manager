class ReferrersController < ApplicationController
  before_action :set_referrer, only: [:show, :edit, :update, :destroy]

  # GET /referrers
  # GET /referrers.json
  def index
    @referrers = Referrer.all
  end

  # GET /referrers/1
  # GET /referrers/1.json
  def show
  end

  # GET /referrers/new
  def new
    @referrer = Referrer.new
  end

  # GET /referrers/1/edit
  def edit
  end

  # POST /referrers
  # POST /referrers.json
  def create
    @referrer = Referrer.new(referrer_params)

    respond_to do |format|
      if @referrer.save
        format.html { redirect_to @referrer, notice: 'Referrer was successfully created.' }
        format.json { render :show, status: :created, location: @referrer }
      else
        format.html { render :new }
        format.json { render json: @referrer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referrers/1
  # PATCH/PUT /referrers/1.json
  def update
    respond_to do |format|
      if @referrer.update(referrer_params)
        format.html { redirect_to @referrer, notice: 'Referrer was successfully updated.' }
        format.json { render :show, status: :ok, location: @referrer }
      else
        format.html { render :edit }
        format.json { render json: @referrer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referrers/1
  # DELETE /referrers/1.json
  def destroy
    @referrer.destroy
    respond_to do |format|
      format.html { redirect_to referrers_url, notice: 'Referrer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referrer
      @referrer = Referrer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referrer_params
      params.require(:referrer).permit(:name)
    end
end
