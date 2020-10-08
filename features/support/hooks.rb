Before do
    @login_page = LoginPage.new
    @movie_page = MoviePages.new
    @sidebar = SideBarView.new

    # page.driver.browser.manage.window.maximize, não é uma boa técnica, visto que alguns monitores podem quebrar a execução
    page.current_window.resize_to(1440, 900) # sempre verificar com o dev, a menor resolução possível aceitável e assim utilizar nela, se funcionar
    # nas outras também irá funcionar.
end

Before("@login") do
    user = CONFIG["users"]["cat_manager"]
    @login_page.go
    @login_page.with(user["email"], user["pass"])
end

After do |scenario|
    #if scenario.failed?
    temp_shot = page.save_screenshot("log/temp_shot.png")
    screenshot = Base64.encode64(File.open(temp_shot).read)
    embed(screenshot, "image/jpg", "Screenshot")
    #end
end