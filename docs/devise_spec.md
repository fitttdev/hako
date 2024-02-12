Here's a basic outline of how you might write RSpec tests for a Devise-enabled Rails application:

1. Set Up Your Test Environment: Ensure that your test suite is configured to use Devise's test helpers. Include Devise::Test::ControllerHelpers and Devise::Test::IntegrationHelpers in your spec_helper.rb or rails_helper.rb depending on whether you're testing controllers or requests.

2. Write Controller Tests: Test your custom controllers that inherit from Devise's controllers. Use the post method to simulate form submissions and check the response.

3. Write Request Specs: Test the behavior of your application through requests. Use methods like get, post, etc., to simulate HTTP requests and check the responses.

4. Handle Authentication: Use Devise's test helpers to sign in and out users in your tests. Helpers like sign_in and sign_out make it easy to manage the state of your signed-in user.

5. Test Validations: Verify that your models enforce the correct validations, including password complexity and presence.