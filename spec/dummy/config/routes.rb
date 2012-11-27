Rails.application.routes.draw do
  mount StatBoard::Engine => "/stats"
end
