class ChannelsController < ApplicationController
  before_action :set_channel, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!  
  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.where(id: (Subscription.where(student_id: current_user.student.id).pluck(:channel_id)))

  end
 
  # GET /channels/1
  # GET /channels/1.json
  def show
    
    @channel = Channel.find(params[:id])  
    # NOT IN (Subscription.find_by(@channel).pluck(:student_id))
    @messages = @channel.messages

  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = Channel.new(channel_params)

    # respond_to do |format|
      if @channel.save

         redirect_to channels_path, notice: 'Channel was successfully created.'
        # format.json { render :show, status: :created, location: @channel }
      else
        render :new
        # format.html { render :new }
        # format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    # end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
          format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy

    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end



  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:name, :batch_id, student_ids:[])
    end
end
