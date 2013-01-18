require 'spec_helper'

describe ParticipantsController do

include Devise::TestHelpers
before :each do
  @user = User.create!(:email => 'abc@gmail.com', :password => 'password', :password_confirmation => 'password', :name => 'example', :emp_id => '12345', :role => 'admin')
  sign_in @user
  @event = Event.create!(:name=>'event1',:venue=>'evnt1',:description=>'event1',:date_of_event=>'2013-04-20')
  end

def valid_attributes
  {
    :name=>'part1',:name_of_food=>'food',:quantity=>'10',:rate_per_person=>'10'
  }
end
describe "POST create" do
    describe "with valid params" do
      it "creates a new Participant" do
        expect {
        post :create, {:event_id => @event.id , :participant => valid_attributes}
        }.to change(Participant, :count).by(1)
      end
    end
  end


end