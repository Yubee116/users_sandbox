# frozen_string_literal: true

class UserTableHeaderComponent < ViewComponent::Base
    def initialize(headerNames)
        @headers = headerNames
    end
end
