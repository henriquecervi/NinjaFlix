Before do
    @login_page = LoginPage.new
    @movie_page = MoviePages.new
    @sidebar = SideBarView.new
end

Before("@login") do
    @login_page.go
    @login_page.with("henrique@henrique.com", "123456")
end