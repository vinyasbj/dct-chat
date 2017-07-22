class RenameDeletedToDeletedAtToSubscription < ActiveRecord::Migration
  def change
  	rename_column :subscriptions ,:deleted ,:deleted_at
  end
end
