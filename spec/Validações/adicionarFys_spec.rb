

describe 'Adicionar Fys', :testeaddfys do

    def generate_code(number)
        charset = Array(0..9) 
        Array.new(number) { charset.sample }.join
      end

    before(:each) do
       visit ('http://www.pontodecoleta.com.br')
       @arquivo1 = Dir.pwd + '/spec/fixtures/image1.png'
       @arquivo2 = Dir.pwd + '/spec/fixtures/image2.jpg'
       @arquivo3 = Dir.pwd + '/spec/fixtures/image3.png'
    end
    it 'Visit' do
        click_on ('Acesse')
        expect(page).to have_content('Utilize o formulário para acessar sua conta.')
        find(:css, 'input[name="email"]').set 'naeltomf@gmail.com'
        find(:css, 'input[name="password"]').set 'N4elton123'
        click_button('Acessar Conta')
        within("header") do
            click_on ("FYS")
          end
        find(:xpath,'//a[contains(@href, "create")]').click
        find(:css, 'input[name="title"]').set 'Fys Teste'
        find(:css, 'textarea[name="info_add"]').set 'Esta sendo rodado um script de testes'
        attach_file('image1', @arquivo1)
        attach_file('image2', @arquivo2)
        attach_file('image3', @arquivo3)
        click_button('Salvar')
        expect(page).to have_content('free your stuff ')
    end
end