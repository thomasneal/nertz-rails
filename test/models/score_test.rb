require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
   test "validations presence of" do
     score = Score.new
     refute score.valid?

     score.round = build(:round)
     score.user = build(:user)
     score.value = 1
     assert score.valid?
   end

   test "validates value is an integer" do
     score = build(:score, value: "poop")
     refute score.valid?

     score.value = 1
     assert score.valid?

     score.value = -5
     assert score.valid?
   end
end
