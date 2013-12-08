class ContactFormsController < ApplicationController



  def new
    @contact_form = ContactForm.new(email_subject: params[:email_subject])
    @contact_form.name = current_user.try('name')
    @contact_form.email = current_user.try('email')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact_form }
    end
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])

    respond_to do |format|
      if @contact_form.send_it
        format.html { redirect_to root_path, notice: "message was send successfully"}
        format.json { render json: @contact_form, status: :created, location: @contact_form }
      else
        format.html { render action: "new" }
        format.json { render json: @contact_form.errors, status: :unprocessable_entity }
      end
    end
  end
end
