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
          UI.message('👉 If you really want to delete a tag, you should to set up remove_local and remove_remote at least one for true!')
        else
          result = command.join(' & ')
          Actions.sh(result)
          UI.message('删除成功! 🎉')
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        '删除 git tag'
      end

      def self.details
        '删除git 本地 tag 或 远程 tag'
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :tag,
                                       description: '删除tag',
                                       is_string: true,
                                       optional: false),
          FastlaneCore::ConfigItem.new(key: :remove_local,
                                       description: '删除本地 tag',
                                       is_string: false,
                                       optional: true,
                                       default_value: true),
          FastlaneCore::ConfigItem.new(key: :remove_remote,
                                       description: '删除 远程 tag',
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
          'remove_git_tag(tag: "0.1.0") # 同时删除本地与远程',
          'remove_git_tag(tag: "0.1.0", remove_local: false) # 只删除远程',
          'remove_git_tag(tag: "0.1.0", remove_remote: false) # 只删除本地'
        ]
      end

      def self.category
        :source_control
      end
    end
  end
end
