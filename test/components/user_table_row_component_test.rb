# frozen_string_literal: true

require 'test_helper'

class UserTableRowComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    result = render_inline(UserTableRowComponent.new(User.new(
                                                       id: 5,
                                                       firstName: 'Mavis',
                                                       lastName: 'Schultz',
                                                       email: 'kmeus4@upenn.edu',
                                                       gender: 'male',
                                                       height: 188
                                                     )))

    expected =
      %(<tr id="user_5" class="bg-white border-b hover:bg-gray-100">
  <td class="px-3 py-3"><input type="checkbox" name="users[]" id="user_5_checkbox" value="5" class="delete_multiple_checkbox"></td>
  <td class="px-3 py-3">Mavis</td>
  <td class="px-3 py-3">Schultz</td>
  <td class="px-3 py-3">kmeus4@upenn.edu</td>
  <td class="px-3 py-3">male</td>
  <td class="px-3 py-3">188</td>
  <td class="px-3 py-3 hover:text-green-600"><a data-turbo-frame="_top" href="/users">View</a></td>
  <td class="px-3 py-3 hover:text-blue-600"><a data-turbo-frame="_top" href="/users/5/edit">Edit</a></td>
  <td class="px-3 py-3 hover:text-red-600"><a data-turbo-frame="_top" data-turbo-method="delete" data-turbo-confirm="Are you sure you want to delete the user?" href="/users/5">Destroy</a></td>
</tr>
)

    assert_equal(expected, result.to_html)
  end
end
