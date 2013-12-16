require "test_helper"

module Nav
  describe Navigation do
    let(:navigation) { build_stubbed(:navigation, name: 'default') }

    it "must be valid" do
      navigation.must_be :valid?
    end

    it "must have name" do 
      build(:navigation, name: nil).wont_be :valid?
    end

    it "must have locale" do 
      build(:navigation, locale: nil).wont_be :valid?
    end
  end
end