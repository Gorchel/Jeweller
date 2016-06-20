class HomeController < ApplicationController
	before_action :set_locale
 
	def set_locale
	  I18n.locale = params[:locale] || I18n.default_locale
	  if params[:locale] === 'en' 
	  	@enClass = 'activeTranslate'
	  elsif params[:locale] === 'es' 
	  	@esClass = 'activeTranslate'
	  elsif params[:locale] === 'de' 
	  	@deClass = 'activeTranslate'
	  else
	  	@ruClass = 'activeTranslate'
	  end
	end
	
	def index
	end
end
