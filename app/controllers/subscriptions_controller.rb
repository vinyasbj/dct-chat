class SubscriptionsController < ApplicationController

  def recover_soft_deleted_records
  	@subscription = Subscription.only_deleted.find(params[:id]).recover


  def recover_soft_deleted_records
    # binding.pry
    # Subscription.only_deleted.where("student_id = ? AND channel_id = ?", params[:student_id], params[:channel_id]).recover
    Subscription.only_deleted.where(student_id: params[:student_id], channel_id: params[:channel_id])[0].recover
    redirect_to :back

  end

  def destroy
  	@subscription= Subscription.find(params[:id])
  	@subscription.destroy
  	respond_to do |format|
      format.html { redirect_to :back, notice: 'Successfully unsubscribed.' }
      format.json { head :no_content }
    end
  end

end