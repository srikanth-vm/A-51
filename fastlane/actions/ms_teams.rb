require "rest-client"
require "json"

module Fastlane
  module Actions
    module SharedValues
      MS_TEAMS_CUSTOM_VALUE = :MS_TEAMS_CUSTOM_VALUE
    end

    class MsTeamsAction < Action
      def self.run(params)
        payload = {
          "@type" => "MessageCard", 
          "@context" => "http://schema.org/extensions",
          "themeColor" => params[:theme_color],
          "title" => params[:title],
          "summary" => params[:title],
          "sections" => [ { "text" => params[:message], "facts" => params[:facts], "potentialaction" => params[:potential_actions] } ]
        }
        headers = {content_type: :json}
        begin
          response = RestClient.post params[:teams_url], payload.to_json, headers
          UI.message "Messsage posted sucessfully in Teams"

        rescue RestClient::ExceptionWithResponse => err
          UI.error err.response
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "A short description with <= 80 characters of what this action does"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "You can use this action to do cool things..."
      end

      def self.available_options
        # Define all options your action supports.

        # Below a few examples
        [
          FastlaneCore::ConfigItem.new( key: :title,
                                        description: "The title that should be displayed on Teams"),
          FastlaneCore::ConfigItem.new( key: :message,
                                        description: "The message that should be displayed on Teams. This supports the standard Teams markup language"),
          FastlaneCore::ConfigItem.new( key: :facts,
                                        type: Array,
                                        default_value: [],
                                        description: "Optional facts"),
          FastlaneCore::ConfigItem.new( key: :potential_actions,
                                        type: Array,
                                        default_value: [],
                                        description: "Optional potentialaction"),
          FastlaneCore::ConfigItem.new( key: :teams_url,
                                        env_name: "FL_TEAMS_WEBHOOK_URL",
                                        sensitive: true,
                                        description: "Create an incoming webhook for your teams channel",
                                        verify_block: proc do |value|
                                           UI.user_error!("Invalid URL, must start with https://") unless
                                               value.start_with? "https://"
                                         end),
          FastlaneCore::ConfigItem.new( key: :theme_color,
                                        description: "Theme color of the message card",
                                        optional: true,
                                        default_value: "0078D7")          
        ]
      end

      def self.output
        # Define the shared values you are going to provide
        # Example
        [
          ['MS_TEAMS_CUSTOM_VALUE', 'A description of what this value contains']
        ]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["Your GitHub/Twitter Name"]
      end

      def self.is_supported?(platform)
        # you can do things like
        #
        #  true
        #
        #  platform == :ios
        #
        #  [:ios, :mac].include?(platform)
        #

        platform == :ios
      end
    end
  end
end
