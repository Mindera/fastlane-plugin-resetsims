module Fastlane
  module Actions
    class ResetsimsAction < Action
      def self.run(params)
        if params[:devices_regexp].empty?
          device_list_grep = ""
        else
          device_list_grep = " | grep '#{params[:devices_regexp]}'"
        end  

        Actions.sh "instruments -s devices #{device_list_grep} | grep \"(\\d*.\\d)\\|(\\d*.\\d.\\d)\" | grep -o \"[0-9A-F]\\{8\\}-[0-9A-F]\\{4\\}-[0-9A-F]\\{4\\}-[0-9A-F]\\{4\\}-[0-9A-F]\\{12\\}\" | while read -r line ; do
            echo \"Resetting Simulator with UDID: $line\"
            xcrun simctl erase $line
            done"
      end

      def self.description
        "Makes an reset on xcode simulators"
      end

      def self.authors
        ["Luís Esteves"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Makes an reset on xcode simulators"
      end

      def self.available_options
        [
            FastlaneCore::ConfigItem.new(key: :devices_regexp,
                                         description: "regexp indicating the target devices",
                                         optional: true,
                                         default_value: "")
        ]
      end

      def self.is_supported?(platform)
        platform == :ios
      end
    end
  end
end
