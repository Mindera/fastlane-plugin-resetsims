describe Fastlane::Actions::ResetsimsAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The resetsims plugin is working!")

      Fastlane::Actions::ResetsimsAction.run(nil)
    end
  end
end
