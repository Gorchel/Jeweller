class SocialController < ApplicationController
  def index
  	@vk_photo = Array.new
  	vk_to_id = '-37860595'
  	@vk = VkontakteApi::Client.new
    vk_array = @vk.wall.get(owner_id:-37860595, count: 30)
    vk_array.delete_at(0)
    vk_array.each do |handler|
      vk_id = handler[:id]
      if handler.try(:attachments)
        handler[:attachments].each do |handler_photo|
          if handler_photo[:photo].try(:src_big)
            if handler_photo[:photo].try(:owner_id)
              vk_from_id = handler_photo[:photo][:owner_id]
            else
              vk_from_id = vk_to_id
            end
            vk_pid = handler_photo[:photo][:pid]
            @vk_photo << [handler_photo[:photo][:src_big],'http://vk.com/jeweller_studio?z=photo' + vk_from_id.to_s + '_' + vk_pid.to_s + '%2Fwall' + vk_to_id.to_s + '_' + vk_id.to_s]
          end
        end
      end
    end   
    respond_to do |format|
        format.html { render :layout => false }
    end
  end
end

