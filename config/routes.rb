LvTest::Application.routes.draw do
  root "import#index"
  post "upload", :to=>"import#upload"
end
