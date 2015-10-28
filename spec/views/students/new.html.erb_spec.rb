require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :cell_phone => "MyString",
      :home_phone => "MyString",
      :work_phone => "MyString"
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input#student_first_name[name=?]", "student[first_name]"

      assert_select "input#student_last_name[name=?]", "student[last_name]"

      assert_select "input#student_email[name=?]", "student[email]"

      assert_select "input#student_cell_phone[name=?]", "student[cell_phone]"

      assert_select "input#student_home_phone[name=?]", "student[home_phone]"

      assert_select "input#student_work_phone[name=?]", "student[work_phone]"
    end
  end
end
