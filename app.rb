require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do

  @the_num = params.fetch("number").to_f

  @the_result = @the_num ** 2

  erb(:square_new_results)
end


get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do

  @the_num2 = params.fetch("user_number").to_f

  @the_result2 = @the_num2 ** 0.5

  erb(:square_root_results)
end


get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @principal = params.fetch("user_pv").to_f

  @m_apr= @apr/ 100 / 12
  @m_n = @years * 12

  @numerator = @principal * @m_apr
  @denominator = 1 - (1+@m_apr) ** (-@m_n)

  @m_payment = @numerator / @denominator
  @payment = @m_payment.to_fs(:currency, {:precision => 2})

  @fapr=@apr.to_fs(:percentage, {:precision => 4})
  @fprincipal=@principal.to_fs(:currency, {:precision => 2})


  erb(:payment_results)
end


get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f

  @random_num = rand(@min..@max)

  @fmin = @min.round(1)
  @fmax = @max.round(1)

  erb(:random_results)
end

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
