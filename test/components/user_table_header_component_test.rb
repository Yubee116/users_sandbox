# frozen_string_literal: true

require 'test_helper'

class UserTableHeaderComponentTest < ViewComponent::TestCase
  setup do
    @headerArr = ["First Name", "Last Name", "Email", "Gender", "Height"]
  end

  def test_component_first_name_heading
    render_inline(UserTableHeaderComponent.new(@headerArr))
    assert_selector 'th[2]'
    assert_text 'First Name'
  end

  def test_component_gender_heading
    render_inline(UserTableHeaderComponent.new(@headerArr))
    assert_selector 'th[5]'
    assert_text 'Gender'
  end

  def test_component_height_heading
    render_inline(UserTableHeaderComponent.new(@headerArr))
    assert_selector 'th[6]'
    assert_text 'Height'
  end
end
