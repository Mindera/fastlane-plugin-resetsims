module Fastlane
  module Helper
    class ResetsimsHelper
      # class methods that you define here become available in your action
      # as `Helper::ResetsimsHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the resetsims plugin helper!")
      end
    end
  end
end
