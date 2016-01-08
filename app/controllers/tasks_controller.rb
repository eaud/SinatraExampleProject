class TasksController < ApplicationController

  get '' do
    erb :"tasks/index"
  end

  get '/new' do
    erb :"tasks/new"
  end

  post '' do #create from get "/doer/new"
    @task = Task.create(params[:task])
    @doer = Doer.find_or_create_by(name: params[:doer][:name])
    @task.doer = @doer
    @task.save
    redirect to ''
  end

  get '/:slug' do
    @task = Task.find_by_slug(params[:slug])
    @doer = Doer.find(@task.doer_id)
    erb :"tasks/show"
  end

  get '/:slug/edit' do
    @task = Task.find_by_slug(params[:slug])
    erb :"tasks/edit"
  end

  patch '/:slug' do #update from  get '/tasks/:slug/edit'
    @task = Task.find_by_slug(params[:slug])
    @task.update(params[:task])
    if params[:doer] != nil
      @doer = Doer.find_by(name: params[:doer][:name])
      @task.doer = @doer
      @task.save
    end
    redirect to "/#{@task.slug}"
  end

  delete '/:slug' do
    @task = Task.find_by_slug(params[:slug])
    @task.destroy
    redirect to ''
  end

end
