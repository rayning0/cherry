class UsersController < ApplicationController
  get "/upload/:slug" do
    @s = Student[slug: params[:slug]]
    erb :'students/upload'
  end

  # changes your profile picture
  post "/upload/:slug" do 
    @s = Student[slug: params[:slug]]
    File.open('public/img/' + params['myfile'][:filename], "w") do |f|
      f.write(params['myfile'][:tempfile].read)
    end
    @s.update(profile_image: params['myfile'][:filename])
    erb :'students/show'
  end
end
