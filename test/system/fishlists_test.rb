require "application_system_test_case"

class FishlistsTest < ApplicationSystemTestCase
  setup do
    @fishlist = fishlists(:one)
  end

  test "visiting the index" do
    visit fishlists_url
    assert_selector "h1", text: "Fishlists"
  end

  test "should create fishlist" do
    visit fishlists_url
    click_on "New fishlist"

    fill_in "Date", with: @fishlist.date
    fill_in "Fishimg", with: @fishlist.fishimg
    fill_in "Fishingmethod", with: @fishlist.fishingmethod
    fill_in "Fishlength", with: @fishlist.fishlength
    fill_in "Fishname", with: @fishlist.fishname
    fill_in "Fishweight", with: @fishlist.fishweight
    fill_in "Map", with: @fishlist.map
    fill_in "Place", with: @fishlist.place
    fill_in "Prefecture", with: @fishlist.prefecture
    fill_in "Time", with: @fishlist.time
    click_on "Create Fishlist"

    assert_text "Fishlist was successfully created"
    click_on "Back"
  end

  test "should update Fishlist" do
    visit fishlist_url(@fishlist)
    click_on "Edit this fishlist", match: :first

    fill_in "Date", with: @fishlist.date
    fill_in "Fishimg", with: @fishlist.fishimg
    fill_in "Fishingmethod", with: @fishlist.fishingmethod
    fill_in "Fishlength", with: @fishlist.fishlength
    fill_in "Fishname", with: @fishlist.fishname
    fill_in "Fishweight", with: @fishlist.fishweight
    fill_in "Map", with: @fishlist.map
    fill_in "Place", with: @fishlist.place
    fill_in "Prefecture", with: @fishlist.prefecture
    fill_in "Time", with: @fishlist.time
    click_on "Update Fishlist"

    assert_text "Fishlist was successfully updated"
    click_on "Back"
  end

  test "should destroy Fishlist" do
    visit fishlist_url(@fishlist)
    click_on "Destroy this fishlist", match: :first

    assert_text "Fishlist was successfully destroyed"
  end
end
