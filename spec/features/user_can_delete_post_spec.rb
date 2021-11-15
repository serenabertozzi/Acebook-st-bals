feature 'deleting posts' do
  scenario 'a user can delete their post' do
  
    driver = Selenium::WebDriver.for :firefox

    driver.navigate.to "http://localhost:3000/"

    driver.navigate.to "http://localhost:3000/sign-up"

    driver.find_element(name: 'user[first_name]').send_keys("Bilbo")
    driver.find_element(name: "user[last_name]").send_keys("Baggins")
    driver.find_element(name: "user[email]").send_keys("bilbo@theshire.com")
    driver.find_element(name: "user[password]").send_keys("smeagol")
    driver.find_element(name: "user[password_confirmation]").send_keys("smeagol")
    driver.find_element(name: "commit").click
    driver.navigate.to "http://localhost:3000/sign-in"
    driver.find_element(name: "email").send_keys("bilbo@theshire.com")
    driver.find_element(name: "password").send_keys("smeagol")
    driver.find_element(name: "commit").click
    driver.navigate.to "http://localhost:3000/"
    driver.find_element(name: "post[message]").send_keys("Hello, world!")
    driver.find_element(name: "commit").click

    driver.find_element(id: 'btnDelete').click
    a = driver.switch_to.alert
    if a.text == 'Are you sure?'
      a.accept
    end

    expect("http://localhost:3000/").not_to have_content "Hello, world!"
  end
end