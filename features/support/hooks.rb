Before do
    @login_page = LoginPage.new
    @movie_page = MoviePages.new
    @sidebar = SideBarView.new

    # page.driver.browser.manage.window.maximize, não é uma boa técnica, visto que alguns monitores podem quebrar a execução
    page.current_window.resize_to(1440, 900) # sempre verificar com o dev, a menor resolução possível aceitável e assim utilizar nela, se funcionar
    # nas outras também irá funcionar.
end

Before("@login") do
    @login_page.go
    @login_page.with("henrique@henrique.com", "123456")
end