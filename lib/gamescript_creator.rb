require "gamescript_creator/version"
require "gamescript_creator/script_model"
require "gamescript_creator/script_renderer"
require "gamescript_creator/script_parser"

module GamescriptCreator
  class UnknownVersionError < StandardError;
  end

  class Stack
    def create_task;
    end
  end

  class Task
    def process(source, options = {})
      ;
    end
  end

  def self.build_stack(version = 'latest')
    stack = StackBuilder.new.build_for_version(version)

    msg = "Stack version '#{version}' is not implemented"
    raise UnknownVersionError, msg if stack.nil?

    stack
  end

  private

  # Helper class, that is incapsulating stack loading
  class StackBuilder

    def build_for_version(version)
      if version.match? /0.1/
        require 'gamescript_creator/v01/stack'
        return GamescriptCreator::V01::Stack.new
      end
      nil
    end
  end
end
