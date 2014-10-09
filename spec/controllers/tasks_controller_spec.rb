# 1. Create a GET tasks#show page when the user visits /tasks/:id (aka visits /tasks/3)

require 'spec_helper'

describe TasksController, type: :controller do
  describe "GET new" do
    it "renders :new"
    it "assigns @task to a new Task"
  end

  describe "POST create /tasks" do
    context "with valid attributes" do
      it "creates Task in database"
      it "redirects to :show"
    end

    context "with invalid attributes" do
      it "does not create Task in database"
      it "re-renders :new"
    end
  end
  
  describe "GET show /tasks/:id" do
    before { @task = Task.create(title: "Walk the dog") }

    it "renders show page" do
      get :show, id: @task.id
      expect(response).to render_template(:show)
    end

    it "assigns requested task to @task" do
      get :show, id: @task.id
      #Expect @task to be set to the task we're looking for
      assigns(:task).should eq(@task)
    end
    # @task = Task.find(params[:id])
    # When we go to /tasks/3
    # Right side of equal sign --> Task.find(3) --> { id: 3, title: "Walk the dog", created_at: }
  end

  describe "GET index /tasks" do
    it "renders :index"
    it "assigns all the tasks to @tasks"
  end

  describe "GET edit /tasks/:id/edit" do
    it "renders :edit"
    it "assigns requested task to @task"
  end

  describe "PUT update /tasks/:id" do
    context "with valid attributes" do
      it "updates @task in database"
      it "redirects to :show"
    end

    context "with invalid attributes" do
      it "re-renders :edit"
      it "does not update @task in database"
    end
  end

# put in destroy

end