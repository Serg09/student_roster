require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :cell_phone => "Cell Phone",
        :home_phone => "Home Phone",
        :work_phone => "Work Phone"
      ),
      Student.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :cell_phone => "Cell Phone",
        :home_phone => "Home Phone",
        :work_phone => "Work Phone"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Cell Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Home Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Work Phone".to_s, :count => 2
  end
end
