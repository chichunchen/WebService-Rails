User.delete_all
create_account = for i in 1..10 do
                    User.create([
                      email: "example#{i}@gmail.com", 
                      password: "12345678", 
                      password_confirmation: "12345678", 
                      name: "測試用帳號no.#{i}",
                      address: "地址#{i}",
                      phone: "12345678",
                      confirmed_at: Time.now,
                      auth_token: "#{rand(100000000000)}"   
                    ])
                  end

Product.delete_all
create_product = for i in 1..10 do
                  Product.create!([
                    name: "no.#{i}個種子測試商品",
                    price: "#{i*rand(100) + 100}",
                    description: "這是第#{i}件商品"
                  ])
                end