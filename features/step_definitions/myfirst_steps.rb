Dado('que acesso a página') do
    visit ('http://www.pontodecoleta.com.br') 
end
Quando('adiciono o item') do
    arquivo1 = Dir.pwd + '/spec/fixtures/image1.png'
    arquivo2 = Dir.pwd + '/spec/fixtures/image2.jpg'
    arquivo3 = Dir.pwd + '/spec/fixtures/image3.png'
    click_on ('Acesse')
    expect(page).to have_content('Utilize o formulário para acessar sua conta.')
    find(:css, 'input[name="email"]').set 'naeltomf@gmail.com'
    find(:css, 'input[name="password"]').set 'N4elton123'
    click_button('Acessar Conta')
    click_on ('Itens')
    find(:xpath,'//a[contains(@href, "create")]').click
    find(:css, 'input[name="title"]').set 'item teste'
    find(:css, 'textarea[name="info_add"]').set 'Esta sendo rodado um script de testes'
    attach_file('image1', arquivo1)
    attach_file('image2', arquivo2)
    attach_file('image3', arquivo3)
    click_on ('Salvar')
end
Então('desejo ver o item na listagem') do
    expect(page).to have_content('Itens...')
end
