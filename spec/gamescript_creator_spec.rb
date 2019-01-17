# frozen_string_literal: true

include GamescriptCreator

RSpec.describe GamescriptCreator do
  it 'has a version number' do
    expect(GamescriptCreator::VERSION).not_to be nil
  end

  describe '#build_stack' do
    it 'module has method #buildStack' do
      expect(GamescriptCreator).to respond_to('build_stack')
    end

    describe 'when currently supported version string provided' do
      let(:stack) { GamescriptCreator.build_stack('v0.1') }
      it 'returns full stack object' do
        expect(stack).to be_kind_of(Stack)
        expect(stack.create_task).to be_kind_of(Task)
      end
    end
    describe 'when unsupported version string provided' do
      it 'throws exception' do
        expect { GamescriptCreator.build_stack('unknown version') }.to raise_error(UnknownVersionError, "Stack version 'unknown version' is not implemented")
      end
    end
  end
end

RSpec.describe "GamescriptCreator v01" do
  let(:stack) { GamescriptCreator::build_stack 'v0.1' }

  describe 'when model is correct' do
    let(:input) { File.expand_path './correct.txt', __dir__ }
    let(:result) { stack.create_task.process(input, {})}

    it 'should render correctly' do
      expect{ result }.not_to raise_error
      expect(result).to be_kind_of(String)
      puts result
    end
  end
end