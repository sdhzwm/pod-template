module Fastlane
  module Actions
    class RemoveGitTagAction < Action
      def self.run(params)
        command = []

        target_tag = params[:tag]
        remove_local = params[:remove_local]
        remove_remote = params[:remove_remote]

        command << "git tag -d #{target_tag}" if remove_local
        command << "git push origin :#{target_tag}" if remove_remote

        if command.empty?
          UI.message('ð If you really want to delete a tag, you should to set up remove_local and remove_remote at least one for true!')
        else
          result = command.join(' & ')
          Actions.sh(result)
          UI.message('å é¤æå! ð')
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        'å é¤ git tag'
      end

      def self.details
        'å é¤git æ¬å° tag æ è¿ç¨ tag'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :tag,
                                       description: 'å é¤tag',
                                       is_string: true,
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :remove_local,
                                       description: 'å é¤æ¬å° tag',
                                       is_string: false,
                                       optional: true,
                                       default_value: true),
          FastlaneCore::ConfigItem.new(key: :remove_remote,
                                       description: 'å é¤ è¿ç¨ tag',
                                       is_string: false,
                                       optional: true,
                                       default_value: true)
        ]
      end

      def self.output
      end

      def self.return_value
        nil
      end

      def self.authors
        ["ripperhe"]
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?(platform)
      end

      def self.example_code
        [
          'remove_git_tag(tag: "0.1.0") # åæ¶å é¤æ¬å°ä¸è¿ç¨',
          'remove_git_tag(tag: "0.1.0", remove_local: false) # åªå é¤è¿ç¨',
          'remove_git_tag(tag: "0.1.0", remove_remote: false) # åªå é¤æ¬å°'
        ]
      end

      def self.category
        :source_control
      end
    end
  end
end
