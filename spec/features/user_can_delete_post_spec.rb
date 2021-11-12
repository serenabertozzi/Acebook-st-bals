feature 'deleting posts' do
  scenario 'a user can delete their post' do

    register_and_sign_in
    create_test_post
    click_link "Delete"

    expect(page).not_to have_content "Hello, world!"
    expect(page).to have_content "Post was successfully destroyed."
  
    # driver = Selenium::WebDriver.for :firefox

    # driver.navigate.to "http://localhost:3000/"

    # driver.navigate.to "http://localhost:3000/sign-up"

    # driver.find_element(name: 'user[first_name]').send_keys("Bilbo")
    # driver.find_element(name: "user[last_name]").send_keys("Baggins")
    # driver.find_element(name: "user[email]").send_keys("bilbo@theshire.com")
    # driver.find_element(name: "user[password]").send_keys("smeagol")
    # driver.find_element(name: "user[password_confirmation]").send_keys("smeagol")
    # driver.find_element(name: "commit").click
    # driver.navigate.to "http://localhost:3000/sign-in"
    # driver.find_element(name: "email").send_keys("bilbo@theshire.com")
    # driver.find_element(name: "password").send_keys("smeagol")
    # driver.find_element(name: "commit").click
    # driver.navigate.to "http://localhost:3000/"
    # driver.find_element(name: "post[message]").send_keys("Hello, world!")
    # driver.find_element(name: "commit").click

    # driver.find_element(id: 'btnDelete').click
    # a = driver.switch_to.alert
    # if a.text == 'Are you sure?'
    #   a.accept
    # end

    # wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
    # begin
    #   wait.until { !driver.title.match('http://localhost:3000/').nil? }
    #   driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed", "reason": "Yaay! Title matched!"}}')
    # rescue
    #   driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed", "reason": "Oops! Title did not match"}}')
    # end

    # driver.quit

    # expect("http://localhost:3000/").not_to have_content "Hello, world!"
    # expect("http://localhost:3000/").to have_content "Post was successfully destroyed."
  end
end