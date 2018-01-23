configure do
  set :root, ROOT_PATH
  set :views, File.join(ROOT_PATH, 'app/views')
end

get '/' do
  erb :'index.html'
end
