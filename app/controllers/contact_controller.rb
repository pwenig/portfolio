class ContactController < ApplicationController
	def send_email
		@contact_form = ContactForm.new(params[:contact_form])
		url = request.referrer
		if @contact_form.valid?
			ContactMailer.contact(@contact_form).deliver
			flash[:success] = "Thank you for contacting us, we'll get back to you as soon as we can."
			redirect_to url
		else
			flash[:error] = "Email Not sent. Please fill all fields"
			redirect_to url
		end
	end
end