class RulesetsController < ApplicationController
  before_action :set_ruleset, only: %i[ show edit update destroy ]

  # GET /rulesets or /rulesets.json
  def index
    @rulesets = Ruleset.all
  end

  # GET /rulesets/1 or /rulesets/1.json
  def show
  end

  # GET /rulesets/new
  def new
    @ruleset = Ruleset.new
  end

  # GET /rulesets/1/edit
  def edit
  end

  # POST /rulesets or /rulesets.json
  def create
    @ruleset = Ruleset.new(ruleset_params)

    respond_to do |format|
      if @ruleset.save
        format.html { redirect_to ruleset_url(@ruleset), notice: "Ruleset was successfully created." }
        format.json { render :show, status: :created, location: @ruleset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ruleset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rulesets/1 or /rulesets/1.json
  def update
    respond_to do |format|
      if @ruleset.update(ruleset_params)
        format.html { redirect_to ruleset_url(@ruleset), notice: "Ruleset was successfully updated." }
        format.json { render :show, status: :ok, location: @ruleset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ruleset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rulesets/1 or /rulesets/1.json
  def destroy
    @ruleset.destroy

    respond_to do |format|
      format.html { redirect_to rulesets_url, notice: "Ruleset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruleset
      @ruleset = Ruleset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ruleset_params
      params.require(:ruleset).permit(:name, :tags, :number_of_rules)
    end
end
