require "test_helper"

class FishlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fishlist = fishlists(:one)
  end

  test "should get index" do
    get fishlists_url
    assert_response :success
  end

  test "should get new" do
    get new_fishlist_url
    assert_response :success
  end

  test "should create fishlist" do
    assert_difference("Fishlist.count") do
      post fishlists_url, params: { fishlist: { date: @fishlist.date, fishimg: @fishlist.fishimg, fishingmethod: @fishlist.fishingmethod, fishlength: @fishlist.fishlength, fishname: @fishlist.fishname, fishweight: @fishlist.fishweight, map: @fishlist.map, place: @fishlist.place, prefecture: @fishlist.prefecture, time: @fishlist.time } }
    end

    assert_redirected_to fishlist_url(Fishlist.last)
  end

  test "should show fishlist" do
    get fishlist_url(@fishlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_fishlist_url(@fishlist)
    assert_response :success
  end

  test "should update fishlist" do
    patch fishlist_url(@fishlist), params: { fishlist: { date: @fishlist.date, fishimg: @fishlist.fishimg, fishingmethod: @fishlist.fishingmethod, fishlength: @fishlist.fishlength, fishname: @fishlist.fishname, fishweight: @fishlist.fishweight, map: @fishlist.map, place: @fishlist.place, prefecture: @fishlist.prefecture, time: @fishlist.time } }
    assert_redirected_to fishlist_url(@fishlist)
  end

  test "should destroy fishlist" do
    assert_difference("Fishlist.count", -1) do
      delete fishlist_url(@fishlist)
    end

    assert_redirected_to fishlists_url
  end
end
