class ContactsController < ApplicationController

def create
  @contact = Contact.new(contact_params)
  @contact.company_id = params[:company_id]
  @company = @contact.company
  if @contact.save
    redirect_to company_path(@company)
  end
end


private

def contact_params
  params.require(:contact).permit(:full_name, :email, :position)
end


end
