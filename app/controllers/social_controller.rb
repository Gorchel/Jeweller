class SocialController < ApplicationController
  def index
  	@vk_photo = Array.new
  	@vk = VkontakteApi::Client.new
  	vk_array = @vk.wall.get(owner_id:-37860595, count:20)
  	vk_array.delete_at(0)
  	vk_array.each do |handler|
  		handler[:attachments].each do |handler_photo|
  			if handler_photo[:photo].try(:src_big)
  				@vk_photo << handler_photo[:photo][:src_big]
  			end
  		end
  	end

    respond_to do |format|
        format.html { render :layout => false }
    end
  end
end

