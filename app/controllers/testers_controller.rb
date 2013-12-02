class TestersController < ApplicationController
  before_action :set_tester, only: [:show, :edit, :update, :destroy]

  # GET /testers
  # GET /testers.json
  def index
    @testers = Tester.all
  end

  # GET /testers/1
  # GET /testers/1.json
  def show
  end

  # GET /testers/new
  def new
    @tester = Tester.new
  end

  # GET /testers/1/edit
  def edit
  end

  # POST /testers
  # POST /testers.json
  def create
    @tester = Tester.new(tester_params)
    @tester[:code] = @tester.code.original_filename
    @tester.save
    uploaded_io = params[:tester][:code]
    File.open(Rails.root.join('public', 'test', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end
    redirect_to @tester
  end

  # PATCH/PUT /testers/1
  # PATCH/PUT /testers/1.json
  def update
    File.open(Rails.root.join('public', 'test', params[:tester][:code]), "w") do |file|
      file.write(params[:tester][:line])
    end
    redirect_to @tester 
  end

  # DELETE /testers/1
  # DELETE /testers/1.json
  def destroy
    @tester.destroy
    respond_to do |format|
      format.html { redirect_to testers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tester
      @tester = Tester.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tester_params
      params.require(:tester).permit(:code, :line)
    end
end
