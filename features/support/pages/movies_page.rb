class MoviePages 
    include Capybara::DSL

    def add
        find(".nc-simple-add").click
    end

    def upload(file)
        cover_file = File.join(Dir.pwd, "features/support/fixtures/cover/" + file)
        cover_file = cover_file.tr("/", "\\") if OS.windows? #isso quer dizer windows = true

        Capybara.ignore_hidden_elements = false
        attach_file("upcover", cover_file)
        Capybara.ignore_hidden_elements = true
    end

    def cast_add(cast)
         #neste caso como temos um array de string, é necessário efetuar desta forma
        #e o comportamento do new tag precisa de tab ou enter para efetuar à inclusão
        actor = find(".input-new-tag")
        cast.each do |a|
            actor.set a
            actor.send_keys :tab
        end
    end

    def create(movie)
        find('input[name=title]').set movie["title"]

        #combobox customizada - com LIS, lista
        find("input[placeholder=Status").click
        find(".el-select-dropdown__item", text: movie["status"]).click

        find("input[name=year]").set movie["year"]
        find("input[name=release_date]").set movie["realease_date"]

        cast_add(movie["cast"])       

        find("textarea[name=overview").set movie["overview"]

        upload(movie["cover"])     
        
        find("#create-movie").click
    end

    def movie_tr(movie)
        find('table tbody tr', text: movie['title'])
    end

end