class SubscriptionsController < ApplicationController
  def recover_soft_deleted_records
  	@subscription = Subscription.only_deleted.find(params[:id]).recover
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