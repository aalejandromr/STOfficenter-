class Superadmin::ContractController < ApplicationController

	def index
		@toApprove = Contract.where(status: 0)
	end

	def approve_contract
		Contract.find(params[:id]).update(
			status: 1
		)
		redirect_to superadmin_contract_index_path
	end
end
