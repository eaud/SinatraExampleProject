require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/doers' do
    erb :"doers/index_of_doers"
  end

  get '/tasks' do
    erb :"doers/index_of_doers"
  end

  get '/doers/new' do
    erb :"doers/create_doers" #posts to /doers
  end

  get '/tasks/new' do
    erb :"tasks/create_tasks" #posts to /tasks
  end

  post '/doers' do
    Doer.create(name: params[:name])
    redirect to '/doers'
  end

  post '/tasks' do
    binding.pry
    @task = Task.create(title: params[:titles], details: params[:details], doer: Doer.find_or_create_by(name: params[:doer_name])
    redirect to '/tasks'
  end

  get '/doers/:id' do
    @doer = Doer.all.find {|doer| doer.id == params["id"].to_i}
    erb :show_doers.erb
  end

  # post '/doers/edited' do
  #   @editable_post = Post.all.find {|post| post.id == params["id"].to_i}
  #   @editable_post.update(name: params["name"], content: params["content"])
  #   erb :"all_posts"
  #   end

  # post '/posts/deleted' do
  #   Post.find{|post| post.id == params["id"].to_i}.destroy
  #   erb :all_posts
  # end

  # post '/posts' do
  #   @post = Post.create(:name => params["name"], :content => params["content"])
  #   erb :all_posts
  # end

  # get '/posts/:id/edit' do
  #   @editable_post = Post.all.find {|post| post.id == params["id"].to_i}
  #   erb :editable_post
  # end

  # get '/posts/:id/delete' do
  #   @deletable_post = Post.all.find {|post| post.id == params["id"].to_i}
  #   erb :deletable_post
  # end
end
