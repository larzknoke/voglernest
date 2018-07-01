class AnfragesController < ApplicationController
  before_action :set_anfrage, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, except: [:create]


  # GET /anfrages
  # GET /anfrages.json
  def index
    @anfrages = Anfrage.all
  end

  # GET /anfrages/1
  # GET /anfrages/1.json
  def show
  end

  # GET /anfrages/new
  def new
    @anfrage = Anfrage.new
  end

  # GET /anfrages/1/edit
  def edit
  end

  # POST /anfrages
  # POST /anfrages.json
  def create
    @data = Hash.new
    @anfrage = Anfrage.new(anfrage_params)

    # Datum String für DB teilen
    daterange = params[:anfrage][:daterange]
    @anfrage.startDate = daterange.split("-")[0].strip!
    @anfrage.endDate = daterange.split("-")[1].strip!

    # Datenschutz Check
    if (params[:anfrage][:datenschutz].to_f != 1)
      @data["eula"] = false
      @data["message"]= "Bitte akzeptieren Sie die Datenschutzerklärung!"
      respond_to do |format|
          return format.js {}
      end
    end

    @data["eula"] = true
    respond_to do |format|
      if @anfrage.save
        @data["message"]= "Anfrage erfolgreich versendet!"
        format.html { redirect_to @anfrage, notice: 'Anfrage was successfully created.' }
        format.js {}
      else
        format.html { render :new }
        format.js {}
      end
    end
  end

  # PATCH/PUT /anfrages/1
  # PATCH/PUT /anfrages/1.json
  def update

    params[:anfrage][:antwort] = nil if ("0" == params[:anfrage][:antwort])

    respond_to do |format|
      if @anfrage.update(anfrage_params)
        if params[:anfrage][:antwort_form]
          AntwortMailer.antwort_email(@anfrage).deliver
        end
        format.html { redirect_to @anfrage, notice: 'Anfrage was successfully updated.' }
        format.json { render :show, status: :ok, location: @anfrage }
      else
        format.html { render :edit }
        format.json { render json: @anfrage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anfrages/1
  # DELETE /anfrages/1.json
  def destroy
    @anfrage.destroy
    respond_to do |format|
      format.html { redirect_to anfrages_url, notice: 'Anfrage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def antwort
    @anfrage = Anfrage.find(params[:anfrage_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anfrage
      @anfrage = Anfrage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anfrage_params
      params.require(:anfrage).permit(:name, :email, :telefon, :anzahl, :antwort, :startDate, :endDate)
    end
end
