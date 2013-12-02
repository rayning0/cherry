require 'pry'

class CodersController < ApplicationController
  before_action :set_coder, only: [:show, :edit, :update, :destroy, :runtest]

  # GET /coders
  # GET /coders.json
  def index
    @coders = Coder.all
  end

  # GET /coders/1
  # GET /coders/1.json
  def show
  end

  # GET /coders/new
  def new
    @coder = Coder.new
  end

  # GET /coders/1/edit
  def edit
  end

  # POST /coders
  # POST /coders.json
  def create
    @coder = Coder.new(coder_params)
    @coder[:code] = @coder.code.original_filename
    @coder.save
    uploaded_io = params[:coder][:code]
    File.open(Rails.root.join('public', 'code', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end
    redirect_to @coder
  end

  # PATCH/PUT /coders/1
  # PATCH/PUT /coders/1.json
  def update
    File.open(Rails.root.join('public', 'code', params[:coder][:code]), "w") do |file|
      file.write(params[:coder][:line])
    end
    redirect_to @coder 
  end

  # DELETE /coders/1
  # DELETE /coders/1.json
  def destroy
    @coder.destroy
    respond_to do |format|
      format.html { redirect_to coders_url }
      format.json { head :no_content }
    end
  end

  # Makes temporary new.rb spec file that adds
  # full text of coder Ruby file to start of spec file.
  # It ignores all "require_relative" and "spec_helper" lines from top.
  def insertline(testfile)
    original_file = Rails.root.to_s + "/public/test/" + testfile
    new_file = original_file[0..-3] + 'new.rb'
    coder_file = Rails.root.to_s + "/public/code/" + @coder.code

    File.open(new_file, 'w') do |f|
      # f.puts "require_relative '../code/#{@coder.code}'"

      # Stick full text of coder's file into your new.rb spec file
      File.open(coder_file, "r").each_line do |line|
        f.puts line
      end

      # Copy original RSpec file to new temp RSpec file, excluding all "require_relative" and "spec_helper" lines
      File.foreach(original_file) do |line|
        f.puts line if !line.include?("require_relative") && !line.include?("spec_helper")
      end 
    end 
  end

  def runtest
    RSpec.configure do |config|
      # Use color in STDOUT
      config.color_enabled = true

      # Use color not only in STDOUT but also in pagers and files
      config.tty = true

      # Use the specified formatter
      config.formatter = :documentation # :progress, :html, :textmate
      config.add_formatter(:json)
    end

    formatters = RSpec.configuration.formatters

    config = RSpec.configuration
    @testresult = RSpec::Core::Formatters::JsonFormatter.new(config.out) 
    # create reporter with json formatter
    reporter =  RSpec::Core::Reporter.new(@testresult)
    # set reporter for rspec configuration
    config.instance_variable_set(:@reporter, reporter)

    # Execute rspec runner

    # Finds 1st RSpec file to match your uploaded Ruby file. Matches it by name.
    testfile = Tester.where("code like ?", "%#{@coder.code[0..-4]}%")[0].code

    # add "require_relative '../code/coder_file_name' " to start of testfile
    insertline(testfile) 
    new_file = Rails.root.to_s + "/public/test/" + testfile[0..-3] + 'new.rb'

    RSpec::Core::Runner.run([new_file]) # Runs RSpec test!
    # output test result as json
    render :runtest
    File.delete(new_file)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coder
      @coder = Coder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coder_params
      params.require(:coder).permit(:code, :line)
    end
end
