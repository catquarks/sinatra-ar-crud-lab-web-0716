require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do 
  	@posts = Post.all
  	erb :posts    
  end

  get '/posts/new' do 
  	erb :new
	end

	post '/posts' do 
		post_name = params[:name]
		post_content = params[:content]
		Post.create(name: post_name, content: post_content)
		erb :posts
	end

	get '/posts/:id' do 
		@post = Post.find(params[:id])
		erb :show
	end

	get '/posts/:id/edit' do 
		@post = Post.find(params[:id])
		erb :edit
	end

	patch '/posts/:id' do 
		post_name = params[:name]
		post_content = params[:content]
		post = Post.find(params[:id])
		post.update(name: params[:name], content: params[:content])
		@post = post
		erb :show
	end

	delete '/posts/:id/delete' do 
		@deleted_post = Post.find(params[:id])
		erb :delete_confirm
		
	end



end