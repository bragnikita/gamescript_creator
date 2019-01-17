module GamescriptCreator
  module V01

    # gfdg
    class Task < GamescriptCreator::Task
      def process(source, options = {})
        reader = FileLineReader.new(source)
        parser = ScriptParser.new(reader)
        basic_model = parser.process
        script_model = ScriptModelBuilder.new(basic_model).build
        Renderer.new(options).render_to_string script_model
      end
    end

    # gdf
    class Stack < GamescriptCreator::Stack
      def create_task
        Task.new
      end
    end
  end
end