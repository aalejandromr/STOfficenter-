class AddRequestResetPasswordStatusAndSupervisorToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :RequestResetPassword, :boolean, :default => false
  	add_column :users, :Supervisor, :integer
  end
end
