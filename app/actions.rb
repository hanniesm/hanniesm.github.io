get '/' do
    @allpackages = Package.all
    erb(:index)
end

get '/new_package' do
    erb(:new_package)
end

post '/new_package' do
    sender_id = params[:sender_id]
    sender_affiliation = params[:sender_affiliation]
    recipient_id = params[:recipient_id]
    date = params[:date]
    letter_url = params[:letter_url]
    software_id = params[:software_id]
    content_description = params[:content_description]
    content_tags = params[:content_tags]
    
    package = Package.new({ sender_id: sender_id, sender_affiliation: sender_affiliation, recipient_id: recipient_id, date: date, letter_url: letter_url, software_id: software_id, content_description: content_description, content_tags: content_tags })
    if package.save
        redirect to('/')
    else
        erb(:new_package)
    end
end

get '/packages/:id' do
    @package = Package.find(params[:id])
    erb(:"packages/show")
end

get '/software' do
    @softwares = Software.all
    erb(:software)
end

get '/packages' do
    @package = Package.find(params[:software_id])
    erb(:"packages/show")
end

get '/by_software' do
    @software_packages = Package.where(software_id: 1)
    erb(:by_software)
end

get '/test' do
    erb(:test)
end