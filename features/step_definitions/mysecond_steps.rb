Quando('adiciono o Coletor') do
    click_on ('Acesse')
    expect(page).to have_content('Utilize o formulário para acessar sua conta.')
    find(:css, 'input[name="email"]').set 'naeltomf@gmail.com'
    find(:css, 'input[name="password"]').set 'N4elton123'
    click_button('Acessar Conta')
    within("header") do
        click_on ("Coletores")
      end
    find(:xpath,'//a[contains(@href, "create")]').click
    find(:css, 'input[name="place"]').set 'Coletor Teste'
    attach_file('image', @arquivo1)
    find(:css, 'input[name="name"]').set 'Teste Automatizado'
    find(:css, 'input[name="email"]').set 'TesteAutomatizado@email.com'
    click_button('Salvar')
end
  
Então('desejo ver o coletor na listagem') do
    expect(page).to have_content('Pontos de Coleta')
end
