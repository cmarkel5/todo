require 'spec_helper'

describe Task  do
  before { @task = Task.new(title: "Walk the dog") }

  subject { @task }

  it { should respond_to(:title) }
  it { should respond_to(:completed) }
  it { should respond_to(:priority) }
  it { should respond_to(:location) }
  it { should be_valid }

  describe "validations" do
    describe "title" do
      describe "not present" do
        before { @task.title = " "}
        it { should_not be_valid }
      end

      describe "too short" do
        before { @task.title = "a" * 2 }
        it { should_not be_valid }
      end

      describe "too long" do
        before { @task.title = "a" * 255 }
        it { should_not be_valid }
      end
    end

    describe "completed" do
      it "false by default" do
        new_task = Task.new(title: "Walk the dog")
        expect(new_task.completed).to be_falsey
      end
    end

    describe "priority" do
      it "blank by default" do
        new_task = Task.new(title: "Walk the dog")
        expect(new_task.priority).to eq(0)
      end

      describe "range" do
        context "too high" do
        before { @task.priority = 4 }
        it { should_not be_valid }
      end

        context "too low" do
        before { @task.priority = -1 }
        it { should_not be_valid }
      end
    end
  end

    describe "location" do
      it "blank by default" do
        expect(@task.location).to eq(" ")
      end

      describe "too long" do
        before { @task.location = "a" * 255 }
        it { should_not be_valid }
      end
    end
    
    # describe "due_at" do
    #   it "has default of day created"
    #     new_task = Task.create(title: "Anything goes here")
    #     expect(new_task.due_at).to eq(Date.today)
    #   end
    # end
  end
end

