require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get home" do
    get games_url
    assert_response :success
  end

  test "should get game" do
    @game = Game.create!
    get game_url(@game)
    assert_response :success
  end
end
