class DoersController < ApplicationController

  get '' do
    erb :"doers/index"
  end

  get '/new' do
    erb :"doers/new"
  end

  post '' do #create from get "/doer/new"
    Doer.create(params[:doer])
    redirect to ''
  end

  get '/:slug' do
    @doer = Doer.find_by_slug(params[:slug])
    erb :"doers/show"
  end

  get '/:slug/edit' do
    @doer = Doer.find_by_slug(params[:slug])
    erb :"doers/edit"
  end

  patch '/:slug' do #update from  get '/doers/:slug/edit'
    @doer = Doer.find_by_slug(params[:slug])
    @doer.update(params[:doer])
    redirect to "/doers/#{@doer.slug}"
  end

  delete '/:slug' do
    @doer = Doer.find_by_slug(params[:slug])
    @doer.destroy
    redirect to '/'
  end

end
