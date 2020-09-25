class LoginPage
    include Capybara::DSL

    def go
        visit "/"
        Capybara.page.driver.browser.manage.window.maximize
    end

    def with(email, password)
        find("input[name=email]").set email
        find("input[name=password]").set password
        click_button "Entrar"
        sleep 2
    end

   def alert
    alert = find('.alert').text
   end

end