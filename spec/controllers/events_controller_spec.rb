require 'spec_helper'

describe EventsController do
  
include Devise::TestHelpers
before :each do
  @user = User.create!(:email => 'abc@gmail.com', :password => 'password', :password_confirmation => 'password', :name => 'example', :emp_id => '12345', :role => 'admin')
  sign_in @user
end

def valid_attributes
  {
    :name=>'event1',:venue=>'evnt1',:description=>'event1',:date_of_event=>'2013-04-20'
  }
end
describe "GET index" do
	it "input: nothing ; output: all events" do
     @event=Event.create! valid_attributes
     get "index"
     response.should render_template(:action => 'index')
  end
end

describe "GET show event" do
	it "input: event_id ;  render: show page" do
    @event=Event.create! valid_attributes
		get "show",:id => @event.id
		response.should render_template(:action => 'show')
  end
end

describe "GET new event" do
   it "input: event details ; output:event object" do
     get "new"
     #@event=Event.new(valid_attributes)
     #@event.should be_an_instance_of Event
     assigns(:event).should be_a_new(Event)
   end
end

describe "GET edit" do
  it "assigns the requested event as @events" do
    event=Event.create! valid_attributes
    get :edit,:id => event.to_param
    assigns(:event).should eq(event)
  end
end

describe "GET menu" do
	it "input: event_id ;  render: menu page" do
    @event=Event.create! valid_attributes
		get "menu",:id=>@event.id
		response.should render_template(:action => 'menu')
  end
end



describe "DELETE destroy" do
    it "destroys the requested event" do
      event = Event.create! valid_attributes
      expect {
        delete :destroy, {:id => event.to_param}
      }.to change(Event, :count).by(-1)
    end

    it "redirects to the events list-index" do
      event = Event.create! valid_attributes
      delete :destroy, {:id => event.to_param}
      response.should redirect_to(events_url)
    end
  end


describe "POST create" do
    describe "with valid params" do
      it "creates a new Event" do
        expect {
          post :create, {:event => valid_attributes}
        }.to change(Event, :count).by(1)
      end

      it "assigns a newly created event as @event" do
        post :create, {:event => valid_attributes}
        assigns(:event).should be_a(Event)
        assigns(:event).should be_persisted
      end

    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Event.any_instance.stub(:save).and_return(false)
        post :create, {:event => { :name => "invalid value" }}
        response.should render_template("new")
      end
    end
  end


  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested event" do
        event = Event.create! valid_attributes
        Event.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => event.to_param, :event => { :name => "MyString" }}
      end
      it "redirects to the event" do
        event = Event.create! valid_attributes
        put :update, {:id => event.to_param, :event => valid_attributes}
        response.should redirect_to(event)
      end
    end
    describe "with invalid params" do
      it "assigns the event as @event" do
        event = Event.create! valid_attributes
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => { "name" => "invalid value" }}
        assigns(:event).should eq(event)
      end

      it "re-renders the 'edit' template" do
        event = Event.create! valid_attributes
        Event.any_instance.stub(:save).and_return(false)
        put :update, {:id => event.to_param, :event => { "name" => "invalid value" }}
        response.should render_template("edit")
      end
    end
  end

end
