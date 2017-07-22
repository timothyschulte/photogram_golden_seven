class PicturesController < ApplicationController
    def new_form
        render("pic_templates/new_form.html.erb")
    end


    def create_row
        p = Photo.new
        p.source = params["the_source"]
        p.caption = params["the_caption"]
        p.save
        
        @photo_count = Photo.count
        
        render("pic_templates/create_row.html.erb")
    end


    def index
        @all_pics = Photo.all
        
        # fortune teller give examples about how to present each
        render("pic_templates/index.html.erb")
    end


    def show
        the_id_number = params["the_id"]
        @pic = Photo.find(the_id_number)
        render("pic_templates/show.html.erb")
    end


    def edit_form
        an_id_number = params["an_id"]
        @pic = Photo.find(an_id_number)
        
        
        render("pic_templates/edit_form.html.erb")
    end
    
    
    def update_row
        #   Parameters: {"image_url"=>"https://upload.wikimedia.org/wikipedia/commons/
        #   thumb/9/96/Pair_of_Merops_apiaster_feeding.jpg/640px-Pair_of_Merops_apiaster_feeding.jpg", "caption"=>"Birds3", "some_id"=>"5"}
          
          
        the_id_number = params["some_id"]
        p = Photo.find(the_id_number)
        p.source = params["image_url"]
        p.caption = params["caption"]
        p.save
        
        
        render("pic_templates/update_row.html.erb")
    end
    

    def destroy_row
        get("/delete_photo/:toast_id", { :controller => "pictures", :action => "destroy_row" })
        delete_id = params["toast_id"]
        d = Photo.find(delete_id)
        
        d.save
        
        render("pic_templates/destroy_row.html.erb")
    end
end






# class PicturesController < ApplicationController
#   def new_form
#     render("pic_templates/new_form.html.erb")
#   end

#   def create_row
#     p = Photo.new

#     p.source = params[:the_source]
#     p.caption = params[:the_caption]

#     p.save

#     @current_count = Photo.count

#     render("pic_templates/create_row.html.erb")
#   end

#   def index
#     @list_of_photos = Photo.order(:created_at => :desc)

#     render("pic_templates/index.html.erb")
#   end

#   def show
#     @photo = Photo.find(params[:an_id])

#     render("pic_templates/show.html.erb")
#   end

#   def edit_form
#     @photo = Photo.find(params[:some_id])

#     render("pic_templates/edit_form.html.erb")
#   end

#   def update_row
#     p = Photo.find(params[:the_id])

#     p.source = params[:the_source]
#     p.caption = params[:the_caption]

#     p.save

#     @the_id = p.id

#     render("pic_templates/update_row.html.erb")
#   end

#   def destroy_row
#     p = Photo.find(params[:toast_id])

#     p.destroy

#     @remaining_count = Photo.count

#     render("pic_templates/destroy_row.html.erb")
#   end
# end
