Feature: Administrator signin
      
	Scenario: Administrator signin with invalid information
		When I go to the admin signin page
		And I fill in "account" with "invalid account"
		And I fill in "password" with "invalid password"
		And I press "登录"
		Then I should be on the admin signin page
          
	Scenario: Administrator signin with correct information
		When I go to the admin signin page
		And I fill in "account" with "admin"
		And I fill in "password" with "123456"
		And I press "登录"
		Then I should be on the admin dashboard page