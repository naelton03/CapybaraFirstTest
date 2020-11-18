Quando('adiciono o FYS') do
        arquivo1 = Dir.pwd + '/spec/fixtures/image1.png'
        arquivo2 = Dir.pwd + '/spec/fixtures/image2.jpg'
        arquivo3 = Dir.pwd + '/spec/fixtures/image3.png'
        within("header") do
            click_on ("FYS")
          end
        find(:xpath,'//a[contains(@href, "create")]').click
        find(:css, 'input[name="title"]').set 'Fys Teste'
        find(:css, 'textarea[name="info_add"]').set 'Esta sendo rodado um script de testes'
        attach_file('image1', arquivo1)
        attach_file('image2', arquivo2)
        attach_file('image3', arquivo3)
        click_button('Salvar')
end

Então('desejo ver o FYS na listagem') do
    expect(page).to have_content('free your stuff ')
end

