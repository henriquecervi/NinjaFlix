Dado('que {string} é um novo filme') do |movie_code|
    file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml"))
    @movie = file[movie_code]
    DataBase.new.delete_movie(@movie["title"])
  end

  Dado('este filme já exite no catálogo') do
    DataBase.new.insert_movie(@movie)
  end
  
  Quando('eu faço o cadastro deste filme') do
   @movie_page.add
   @movie_page.create(@movie)
  end
  
  Então('devo ver o novo filme na lista') do
    result = @movie_page.movie_tr(@movie["title"])
    expect(result).to have_text @movie["title"]  
    expect(result).to have_text @movie["status"] 
  end

  Então('devo ter a notificação {string}') do |expect_alert|
    expect(@movie_page.alert).to eql expect_alert
  end

  Dado('que {string} está no catálogo') do |movie_code|
    steps %{
      Dado que "#{movie_code}" é um novo filme
      E este filme já exite no catálogo
    }
  end
  
  Quando('eu solicito a exlusão') do
    @movie_page.remove(@movie["title"])
  end
  
  Quando('eu confirmo a solicitação') do
    @movie_page.swal2_confirm   
  end
  
  Então('este item deve ser removido do catálogo') do
    expect(@movie_page.has_no_movie(@movie["title"])).to be true    
  end

  Quando('cancelo a solicitação') do
    @movie_page.swal2_cancel
  end
  
  Então('este item deve permanecer no catálogo') do
    expect(@movie_page.has_movie(@movie["title"])).to be true
  end