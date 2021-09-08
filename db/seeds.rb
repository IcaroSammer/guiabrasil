# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Admin.all.empty?
  puts 'Administrador do Sistema Guia Brasil Digital Criado com Sucesso.' if Admin.create(email: 'rsbfreitas@hotmail.com', password: 'rsbfreitas@2020')
  puts 'Administrador do Sistema Guia Brasil Digital Criado com Sucesso.' if Admin.create(email: 'caiohenriquehortencio50@gmail.com', password: 'caio@2020')
  puts 'Administrador do Sistema Guia Brasil Digital Criado com Sucesso.' if Admin.create(email: 'felipedpf@hotmail.com', password: '235689Fe')

  puts 'Administrador do Sistema Guia Brasil Digital Criado com Sucesso.' if Admin.create(email: 'marcia.akiko76@gmail.com', password: 'marcia@2020')
end
if User.all.empty?
  puts 'Administrador do Sistema Guia Brasil Digital Criado com Sucesso.' if User.create(email: 'rsbfreitas@hotmail.com', password: 'rsbfreitas@2020')
  puts 'Administrador do Sistema Guia Brasil Digital Criado com Sucesso.' if User.create(email: 'caiohenriquehortencio50@gmail.com', password: 'caio@2020')
  puts 'Administrador do Sistema Guia Brasil Digital Criado com Sucesso.' if User.create(email: 'felipedpf@hotmail.com', password: '235689Fe')
  puts 'Administrador do Sistema Guia Brasil Digital Criado com Sucesso.' if User.create(email: 'marcia.akiko76@gmail.com', password: 'marcia@2020')  
end


if Icon.all.empty?
	puts 'Icone criado  com sucess ! 'if Icon.create(name: "almoço executivo", description: "Default", active: :true, business_establishment: "RESTAURANTES")
	puts 'Icone criado  com sucess ! 'if Icon.create(name: "ar-condicionado", description: "Default", active: :true, business_establishment: "RESTAURANTES")
	puts 'Icone criado  com sucess ! 'if Icon.create(name: "espaço crianças", description: "Default", active: :true, business_establishment: "RESTAURANTES")
	puts 'Icone criado  com sucess ! 'if Icon.create(name: "estacionamento grátis", description: "Default", active: :true, business_establishment: "RESTAURANTES")
	puts 'Icone criado  com sucess ! 'if Icon.create(name: "estacionamento pago", description: "Default", active: :true, business_establishment: "RESTAURANTES")
	puts 'Icone criado  com sucess ! 'if Icon.create(name: "manobrista pago", description: "Default", active: :true, business_establishment: "RESTAURANTES")
	puts 'Icone criado  com sucess ! 'if Icon.create(name: "prato infantil", description: "Default", active: :true, business_establishment: "RESTAURANTES")
	puts 'Icone criado  com sucess ! 'if Icon.create(name: "wi-fi", description: "Default", active: :true, business_establishment: "RESTAURANTES")
	puts 'Icone criado  com sucess ! 'if Icon.create(name: "vinho em taça", description: "Default", active: :true, business_establishment: "RESTAURANTES")
	puts 'Icone criado  com sucess ! 'if Icon.create(name: "vinho meia garrafa", description: "Default", active: :true, business_establishment: "RESTAURANTES")
end

if PriceRange.all.empty?
	puts 'Faixa de Preço Criada com sucesso ! 'if PriceRange.create(range_init: 0, range_end: 150, description: "até R$ 150", active: :true,  business_establishment:  ["HOTEIS"])
	puts 'Faixa de Preço Criada com sucesso ! 'if PriceRange.create(range_init: 150, range_end: 300, description: "de R$ 150 a R$ 300", active: :true, business_establishment: ["HOTEIS"])
	puts 'Faixa de Preço Criada com sucesso ! 'if PriceRange.create(range_init: 300, range_end: 500, description: "de R$ 300 a R$ 500", active: :true, business_establishment: ["HOTEIS"])
	puts 'Faixa de Preço Criada com sucesso ! 'if PriceRange.create(range_init: 500, range_end: 1000, description: "de R$ 500 a R$ 1000", active: :true, business_establishment: ["HOTEIS"])
	puts 'Faixa de Preço Criada com sucesso ! 'if PriceRange.create(range_init: 100, range_end: 200, description: "acima de R$ 1000", active: :true, business_establishment: ["HOTEIS"])

	
	puts 'Faixa de Preço Criada com sucesso ! 'if PriceRange.create(range_init: 0, range_end: 100, description: "até R$ 100", active: :true,  business_establishment:  [ "ATRACOES", "CIDADES", "RESTAURANTES"])
	puts 'Faixa de Preço Criada com sucesso ! 'if PriceRange.create(range_init: 100, range_end: 200, description: "de R$ 100 a R$ 200", active: :true,  business_establishment:  [ "ATRACOES", "CIDADES", "RESTAURANTES"])
	puts 'Faixa de Preço Criada com sucesso ! 'if PriceRange.create(range_init: 200, range_end: 300, description: "de R$ 200 a R$ 300", active: :true,  business_establishment:  [ "ATRACOES", "CIDADES", "RESTAURANTES"])
	puts 'Faixa de Preço Criada com sucesso ! 'if PriceRange.create(range_init: 300, range_end: 0, description: "acima de R$ 300", active: :true,  business_establishment:  [ "ATRACOES", "CIDADES", "RESTAURANTES"])
	
end

if Lodging.all.empty?
	puts 'Tipo de Acomodação Criada com sucesso ! 'if Lodging.create(name: "Apartamento", description: "Default", active: :true, business_establishment: ["HOTEIS"])
	puts 'Tipo de Acomodação Criada com sucesso ! 'if Lodging.create(name: "Bangalô", description: "Default", active: :true, business_establishment: ["HOTEIS"])
	puts 'Tipo de Acomodação Criada com sucesso ! 'if Lodging.create(name: "Casa", description: "Default", active: :true, business_establishment: ["HOTEIS"])
	puts 'Tipo de Acomodação Criada com sucesso ! 'if Lodging.create(name: "Chalé", description: "Default", active: :true, business_establishment: ["HOTEIS"])
	puts 'Tipo de Acomodação Criada com sucesso ! 'if Lodging.create(name: "Quarto", description: "Default", active: :true, business_establishment: ["HOTEIS"])
end


if Environment.all.empty?
	puts 'Ambiente Criado com sucesso !' if  Environment.create(name:"Beira-Mar", active: :true, business_establishment: "RESTAURANTES")
	puts 'Ambiente Criado com sucesso !' if  Environment.create(name:"Beira-Rio", active: :true, business_establishment: "RESTAURANTES")
	puts 'Ambiente Criado com sucesso !' if  Environment.create(name:"Fazenda", active: :true, business_establishment: "RESTAURANTES")
	puts 'Ambiente Criado com sucesso !' if  Environment.create(name:"Parque", active: :true, business_establishment: "RESTAURANTES")
	puts 'Ambiente Criado com sucesso !' if  Environment.create(name:"Praia", active: :true, business_establishment: "RESTAURANTES")
	puts 'Ambiente Criado com sucesso !' if  Environment.create(name:"Represa ", active: :true, business_establishment: "RESTAURANTES")
	puts 'Ambiente Criado com sucesso !' if  Environment.create(name:"Serra", active: :true, business_establishment: "RESTAURANTES")
end


if Speciality.all.empty? 
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Alemã", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Amazonense", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Árabe", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Argentina", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Asiática", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Baiana ", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Belga ", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Brasileira", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Capixaba", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Carnes", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Carnes  (Rodízio)", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Chinesa", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Coreana", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Contemporânea", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Espanhola", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Feijoada", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Francesa", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Grega", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Húngara", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Indiana", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Italiana", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Italana (Cantina)", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Japonesa", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Latina", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Maranhense", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Mexicana", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Mineira", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Nordestina", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Norte-Americana", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Paraense", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Pantaneira", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Pernambucana", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Peruana", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Pescados", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Pizzaria", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Portuguesa", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Suíça", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Sul-Matogrossense", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Tailandesa", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Turca", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Uruguaia", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Variado", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Variado (Bufê)", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Vegetariano", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Vietnamita", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Bares", active: :true,  business_establishment: "RESTAURANTES")
	puts 'Especialidade criado com sucesso !' if Speciality.create(name: "Comida De Mão", active: :true,  business_establishment: "RESTAURANTES")
end

if CommfortClassification.all.empty?
	puts 'Classificação de conforto Criado com sucesso !' if CommfortClassification.create(name: "Simples 1 Estrela", active: :true,  business_establishment: "HOTEIS")
	puts 'Classificação de conforto Criado com sucesso !' if CommfortClassification.create(name: "Simples Premium 2 Estrelas", active: :true,  business_establishment: "HOTEIS")
	puts 'Classificação de conforto Criado com sucesso !' if CommfortClassification.create(name: "Confortável 3 Estrelas", active: :true,  business_establishment: "HOTEIS")
	puts 'Classificação de conforto Criado com sucesso !' if CommfortClassification.create(name: "Confortável Premium 4 Estrelas", active: :true,  business_establishment: "HOTEIS")
	puts 'Classificação de conforto Criado com sucesso !' if CommfortClassification.create(name: "Luxo 5 Estrelas", active: :true,  business_establishment: "HOTEIS")
	puts 'Classificação de conforto Criado com sucesso !' if CommfortClassification.create(name: "Luxo Premium 6 Estrelas", active: :true,  business_establishment: "HOTEIS")	
end


if FormPayment.all.empty?
	puts 'Forma de Pagamento Criado com sucesso !' if FormPayment.create(name: "Crédito", active: :true,  business_establishment: [ "ATRACOES", "CIDADES", "HOTEIS", "RESTAURANTES"])
	puts 'Forma de Pagamento Criado com sucesso !' if FormPayment.create(name: "Débito", active: :true,  business_establishment: [ "ATRACOES", "CIDADES", "HOTEIS", "RESTAURANTES"])
	puts 'Forma de Pagamento Criado com sucesso !' if FormPayment.create(name: "Boleto", active: :true,  business_establishment: [ "ATRACOES", "CIDADES", "HOTEIS", "RESTAURANTES"])
	puts 'Forma de Pagamento Criado com sucesso !' if FormPayment.create(name: "Duplicata", active: :true,  business_establishment: [ "ATRACOES", "CIDADES", "HOTEIS", "RESTAURANTES"])
	puts 'Forma de Pagamento Criado com sucesso !' if FormPayment.create(name: "Fatura", active: :true,  business_establishment: [ "ATRACOES", "CIDADES", "HOTEIS", "RESTAURANTES"])
	puts 'Forma de Pagamento Criado com sucesso !' if FormPayment.create(name: "Em Dinheiro", active: :true,  business_establishment: [ "ATRACOES", "CIDADES", "HOTEIS", "RESTAURANTES"])
end

if AccommodationType.all.empty?
	puts 'Tipo de Acomodação Criado com sucesso !' if AccommodationType.create(name: "Camping",special: :false,active: :true,  business_establishment: "HOTEIS")
	puts 'Tipo de Acomodação Criado com sucesso !' if AccommodationType.create(name: "Hospedagem Rural",special: :false,active: :true,  business_establishment: "HOTEIS")
	puts 'Tipo de Acomodação Criado com sucesso !' if AccommodationType.create(name: "Hostel",special: :false,active: :true,  business_establishment: "HOTEIS")
	puts 'Tipo de Acomodação Criado com sucesso !' if AccommodationType.create(name: "Hotel",special: :false,active: :true,  business_establishment: "HOTEIS")
	puts 'Tipo de Acomodação Criado com sucesso !' if AccommodationType.create(name: "Hotel Fazenda",special: :false,active: :true,  business_establishment: "HOTEIS")
	puts 'Tipo de Acomodação Criado com sucesso !' if AccommodationType.create(name: "Pousada",special: :false,active: :true,  business_establishment: "HOTEIS")
	puts 'Tipo de Acomodação Criado com sucesso !' if AccommodationType.create(name: "Resort",special: :false,active: :true,  business_establishment: "HOTEIS")
	puts 'Tipo de Acomodação Criado com sucesso !' if AccommodationType.create(name: "Charme",special: :true, active: :true,  business_establishment: "HOTEIS")
	puts 'Tipo de Acomodação Criado com sucesso !' if AccommodationType.create(name: "Conceitual",special: :true, active: :true,  business_establishment: "HOTEIS")
	puts 'Tipo de Acomodação Criado com sucesso !' if AccommodationType.create(name: "Histórico",special: :true, active: :true,  business_establishment: "HOTEIS")
	puts 'Tipo de Acomodação Criado com sucesso !' if AccommodationType.create(name: "Lgbt",special: :true, active: :true,  business_establishment: "HOTEIS")
	puts 'Tipo de Acomodação Criado com sucesso !' if AccommodationType.create(name: "Pet Friendly",special: :true, active: :true,  business_establishment: "HOTEIS")
end

if AccommodationSize.all.empty?
	puts 'Porte da Acomodação Criado com sucesso !' if AccommodationSize.create(name: "Single", active: :true,  number_of_guest: 1)
	puts 'Porte da Acomodação Criado com sucesso !' if AccommodationSize.create(name: "Duplo", active: :true,  number_of_guest: 2)
	puts 'Porte da Acomodação Criado com sucesso !' if AccommodationSize.create(name: "Triplo", active: :true,  number_of_guest: 3)
end

if Structure.all.empty?
	puts 'Estrutura criado com sucesso !' if Structure.create(name: "Aceita Animais", active: :true,  business_establishment: "HOTEIS")
	puts 'Estrutura criado com sucesso !' if Structure.create(name: "Copa Infantil", active: :true,  business_establishment: "HOTEIS")
	puts 'Estrutura criado com sucesso !' if Structure.create(name: "Coworking", active: :true,  business_establishment: "HOTEIS")
	puts 'Estrutura criado com sucesso !' if Structure.create(name: "Estacionamento", active: :true,  business_establishment: "HOTEIS")
	puts 'Estrutura criado com sucesso !' if Structure.create(name: "Estacionamento Pago", active: :true,  business_establishment: "HOTEIS")
	puts 'Estrutura criado com sucesso !' if Structure.create(name: "Facilidades Para Portadores De Necessidades Especiais", active: :true,  business_establishment: "HOTEIS")
	puts 'Estrutura criado com sucesso !' if Structure.create(name: "Wi-Fi Grátis", active: :true,  business_establishment: "HOTEIS")
	puts 'Estrutura criado com sucesso !' if Structure.create(name: "Wi-Fi Pago", active: :true,  business_establishment: "HOTEIS")
end

if Rule.all.empty?
	puts 'Regra criada com sucesso !' if Rule.create(name: "Não aceita Fumantes", active: :true, business_establishment: ["HOTEIS"])
	puts 'Regra criada com sucesso !' if Rule.create(name: "Não aceita menores de 10 anos", active: :true, business_establishment: ["HOTEIS"])


end

if RecreationArea.all.empty?
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Academia", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Arco E Flecha", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Arvorismo", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Barco", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Bicicleta", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Bocha", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Boliche", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Cachoeira", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Caiaque", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Cavalo", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Charrete", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Curral", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Day-Use", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Futebol", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Futebol Oficial", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Golfe", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Hidromassagem", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Horta", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Kids Clube", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Massagem", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Mergulho", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Minigolfe", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Muiro De Escalada", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Piscina", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Piscina Infantil", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Piscina Natural", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Piscina Térmica", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Piscina Termal", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Playground", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Pomar", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Quadra Poliesportiva", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Recreação", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Sala De Jogos", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Sauna Seca ", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Sauna A Vapor", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Spa", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Stand-Up Padle", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Tênis", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Tirolesa", active: :true,  business_establishment: "HOTEIS")
	puts 'Area de Lazer criado com sucesso !' if RecreationArea.create(name: "Vôlei", active: :true,  business_establishment: "HOTEIS")
end

if SocialItem.all.empty?
	puts 'Item Social criado com sucesso !' if SocialItem.create(name: "Adega", active: :true,  business_establishment: "HOTEIS")
	puts 'Item Social criado com sucesso !' if SocialItem.create(name: "Bar", active: :true,  business_establishment: "HOTEIS")
	puts 'Item Social criado com sucesso !' if SocialItem.create(name: "Restaurante", active: :true,  business_establishment: "HOTEIS")
end


if Service.all.empty?
	puts 'Serviço criado com sucesso !' if Service.create(name: "Auto-Locadora", active: :true,  business_establishment: "HOTEIS")
	puts 'Serviço criado com sucesso !' if Service.create(name: "Concierge", active: :true,  business_establishment: "HOTEIS")
	puts 'Serviço criado com sucesso !' if Service.create(name: "Day-Use", active: :true,  business_establishment: "HOTEIS")
	puts 'Serviço criado com sucesso !' if Service.create(name: "Lavanderia", active: :true,  business_establishment: "HOTEIS")
	puts 'Serviço criado com sucesso !' if Service.create(name: "Manobrista", active: :true,  business_establishment: "HOTEIS")
	puts 'Serviço criado com sucesso !' if Service.create(name: "Mensageiro", active: :true,  business_establishment: "HOTEIS")
	puts 'Serviço criado com sucesso !' if Service.create(name: "Mordomo", active: :true,  business_establishment: "HOTEIS")
	puts 'Serviço criado com sucesso !' if Service.create(name: "Room Service", active: :true,  business_establishment: "HOTEIS")
	puts 'Serviço criado com sucesso !' if Service.create(name: "Room Service 24 Horas", active: :true,  business_establishment: "HOTEIS")
	puts 'Serviço criado com sucesso !' if Service.create(name: "Serviço De Praia", active: :true,  business_establishment: "HOTEIS")
end

if AccommodationItem.all.empty?
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Ar-Condicionado", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Ar-Condicionado Split", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Calefação", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Cama Boxe", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Cama Convencional", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Cofre", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Cozinha Equipada", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Frigobar", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Hidromassagem", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Ipad", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Janela Antirruído", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Lareira", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Mesa Trabalho", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Tv", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Tv Lcd", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Tv Assinatura ", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Tv Smart", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Banheiro/Chuveiro Elétrico", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Banheiro/Chuveiro Gás Ou Solar", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Banheiro/Pia Monocomando", active: :true,  business_establishment: "HOTEIS")
	puts 'Item de Acomodação criado com sucesso !' if AccommodationItem.create(name: "Banheiro/Secador De Cabelo", active: :true,  business_establishment: "HOTEIS")
end

if TypeAttraction.all.empty?
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Compras", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Eventos", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Centros Culturais", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Construções Históricas", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Fortes", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Igrejas", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Museus", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Parques", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Parques Estaduais", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Parques Nacionais", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Parques Temáticos", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Passeios", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Praias", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Barracas De Praia", active: :true,  business_establishment: "ATRACOES")
	puts 'Tipos de Atração criado com sucesso !' if TypeAttraction.create(name: "Turismo De Aventura", active: :true,  business_establishment: "ATRACOES")
end

if Commfort.all.empty?
	puts 'Item de Conforto Criado com sucesso !' if  Commfort.create(name: "Simples", active: :true, business_establishment: "RESTAURANTES")
	puts 'Item de Conforto Criado com sucesso !' if  Commfort.create(name: "Confortável", active: :true, business_establishment: "RESTAURANTES")
	puts 'Item de Conforto Criado com sucesso !' if  Commfort.create(name: "Luxo", active: :true, business_establishment: "RESTAURANTES")
	puts 'Item de Conforto Criado com sucesso !' if  Commfort.create(name: "Super Luxo", active: :true, business_establishment: "RESTAURANTES")
	puts 'Item de Conforto Criado com sucesso !' if  Commfort.create(name: "Conceitual Luxo", active: :true, business_establishment: "RESTAURANTES")
end
