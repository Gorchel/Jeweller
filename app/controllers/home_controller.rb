class HomeController < ApplicationController
	before_action :set_locale
 
	def set_locale
	  I18n.locale = params[:locale] || I18n.default_locale
	  if params[:locale] 
	  	@enClass = 'activeTranslate'
	  else
	  	@ruClass = 'activeTranslate'
	  end
	end
	
	def index
	end
end
