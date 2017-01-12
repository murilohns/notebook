namespace :utils do
  desc "Preencher o banco de dados"
  task seed: :environment do
 
  puts "Criando os contatos..."   
  100.times do |i|
    Contact.create!(
        [
            {nome: Faker::Name.name,
             email: Faker::Internet.email,
             type: Type.all.sample,
             rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample)
            }
        ]
    )
  end
  puts "Os contatos foram criados! [OK]"
  
  puts "Gerando os Endereços..."
  
  Contact.all.each do |contact|
    Address.create!(
      [
        {street: Faker::Address.street_address,
         city: Faker::Address.city,
         state: Faker::Address.state_abbr,
         contact: contact
          
        }
      ]
    )
  end
  puts "Endereços criados [OK]"
  
  puts "Gerando os telefones..."
  
  Contact.all.each do |contact|
    Random.rand(1..5).times do |i|
      Phone.create!(
        [
          {
            telephone: Faker::PhoneNumber.phone_number,
            contact: contact
          }
        ]
      )
    end
  end
  
  puts "Telefones gerados com sucesso [OK]"
  
  end

end
