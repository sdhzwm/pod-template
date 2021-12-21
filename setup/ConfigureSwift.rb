module Pod

  class ConfigureSwift
    attr_reader :configurator

    def self.perform(options)
      new(options).perform
    end

    def initialize(options)
      @configurator = options.fetch(:configurator)
    end

    def perform
      keep_demo = :yes #configurator.ask_with_answers("Would you like to include a demo application with your library", ["Yes", "No"]).to_sym

      framework = :none #configurator.ask_with_answers("Which testing frameworks will you use", ["Specta", "Kiwi", "None"]).to_sym
      configurator.set_test_framework("xctest", "m", "ios")
      #默认值
      prefix = "CZ"

      #调用ProjectManipulator类的方法，使用hash参数初始化
      Pod::ProjectManipulator.new({
        :configurator => @configurator,
        :xcodeproj_path => "templates/swift/Example/PROJECT.xcodeproj",
        :platform => :ios,
        :remove_demo_project => (keep_demo == :no),
        :prefix => prefix
      }).run

      # There has to be a single file in the Classes dir
      # or a framework won't be created
      `touch Pod/Classes/ReplaceMe.swift`

       `mv ./templates/swift/* ./`

         # remove podspec for osx
      `rm ./NAME-osx.podspec`

    end
  end

end
