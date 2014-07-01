get '/' do
	@urls = Url.all
  erb :index
end

post '/urls' do
	user = Url.new(long_url: params[:url], click_count: 0)
	if user.valid?
		user.save
		redirect '/'
	else
		erb :error
	end
end

get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])
	url.click
	url.save
	redirect "#{url.long_url}"
end


#when I add http:// before the interpolation, the site loads in browser with http// (NO COLON??)
#When i go to localhost:9393/urls, I get an error that i'm calling .click on nil