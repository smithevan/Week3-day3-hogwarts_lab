require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')


# index
get '/students' do
  @students = Student.all()
  erb( :index )
end
# show
get '/students/:id' do
  @student = Student.find(params[:id])
  house_id = @student.house_id
  student_house = House.find(house_id)
  @student_house_name = student_house.name
  erb ( :show )
end

# new

get '/students/new' do
  erb ( :new )
end

# create

post '/students' do
  @student = Student.new( params )
  @student.save()
  erb ( :create )
end

# edit

get '/students/:id/edit' do
  @student = Student.find(params[:id])
  erb ( :edit)
end

# update

post '/students/:id' do
  Student.new(params).update
  redirect to '/students'
end

# destroy
