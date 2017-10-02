class Admin::ContractController < ApplicationController
	def new
		@contract = Contract.create(
			client_id: params[:id],
			rec_id: "CNTRT0000000000#{Contract.count.to_i}"
		)		
		redirect_to	edit_admin_contract_path(:id => @contract)
	end

	def edit
		@Contract = Contract.find(params[:id])
		@ClientFound = Client.find(@Contract.client_id)
	end
end
