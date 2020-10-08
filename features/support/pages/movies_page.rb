class MoviePages 
    include Capybara::DSL

    def initialize
        @movie_list_css = "table tbody tr"
    end

    def add
        find(".nc-simple-add").click
    end

    def alert
        find(".alert").text
    end

    def select_status(status)
        #combobox customizada - com LIS, lista
        find("input[placeholder=Status").click
        find(".el-select-dropdown__item", text: status).click
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

        select_status(movie["status"]) unless movie["status"].empty?

        find("input[name=year]").set movie["year"]
        find("input[name=release_date]").set movie["release_date"]

        cast_add(movie["cast"])       

        find("textarea[name=overview").set movie["overview"]

        upload(movie["cover"]) unless movie["cover"].empty?     
        
        find("#create-movie").click
    end

    def movie_tr(title)
        find(@movie_list_css, text: title)
    end

    def remove(title)         
        movie_tr(title).find(".btn-trash").click        
    end

    def swal2_confirm
        find(".swal2-confirm").click
    end

    def swal2_cancel
        find(".swal2-cancel").click
    end

    def has_no_movie(title)
        page.has_no_css?(@movie_list_css, text: title)
    end

    def has_movie(title)
        page.has_css?(@movie_list_css, text: title)
    end

end