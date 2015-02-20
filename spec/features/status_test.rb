require 'rails_helper'


  describe 'User can CRUD statuses' do

    # Users can create a status.
    scenario 'User can create a status' do
      # visit statuss index
      visit '/statuses'

      # click on link to go to new status form
      click_on "New Status"

      #filling out form for status
      fill_in 'status[status]', :with => "Example status"
      fill_in 'status[user]', :with => "Example user"

      #submitting form to create a status
      click_on "Create Status"

      #expect to see flash notice of successful creation of status
      expect(page).to have_content("Status was successfully created.")

      #expect page to show description of Example status
      expect(page).to have_content("Example status")

    end


    #Users can edit a status
    scenario 'User can edit a status' do

      @status = status.create(:description => "Example status", :due_date => "2015-01-30")
      visit "/statuss"

      #click on Edit
      click_on "Edit"

      # change description field and update it to Example status edit
      fill_in 'status[description]', :with => "Example status edit"

      #submitting form to update a description in status
      click_on "Update status"

      #expect to see flash notice of successful update of status
      expect(page).to have_content("status was successfully updated.")

      #expect page to show updated description of Example status edit
      expect(page).to have_content("Example status edit")

  end


  # Users can show a status.
  scenario 'User can show a status' do

    @status = status.create(:description => "Example status", :due_date => "2015-01-30")
    visit "/statuss"

    # click on status name link to go to status show page
    click_on "Example status"

    #expect page to show description and due date of Example status
    expect(page).to have_content("Example status")
    expect(page).to have_content("2015-01-30")

  end


  # Users can delete a status.
  scenario 'User can delete a status' do

    @status = status.create(:description => "Example status", :due_date => "2015-01-30")
    visit "/statuss"

    #click on Delete
    click_on "Delete"

    #expect to see flash notice of successful deletion of status
    expect(page).to have_content("status was successfully destroyed.")

  end


end
