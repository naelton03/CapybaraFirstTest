Quando('adiciono o Coletor') do
    arquivo1 = Dir.pwd + '/spec/fixtures/image1.png'
    within("header") do
        click_on ("Coletores")
      end
    find(:xpath,'//a[contains(@href, "create")]').click
    find(:css, 'input[name="place"]').set 'Coletor Teste'
    attach_file('image', arquivo1)
    find(:css, 'input[name="name"]').set 'Teste Automatizado'
    find(:css, 'input[name="email"]').set 'TesteAutomatizado@email.com'
    click_button('Salvar')
end

Então('desejo ver o Coletor na listagem') do
    expect(page).to have_content('Pontos de Coleta')
end


