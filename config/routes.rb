Molecule::ApiGateway.define_routes do
  get    '/users/:id',                                       to: 'users#show'
  post   '/users',                                           to: 'users#create'
  put    '/users/:id',                                       to: 'users#update'
  delete '/users/:id',                                       to: 'users#destroy'

  get    '/sessions/:id',                                    to: 'sessions#show'
  post   '/sessions',                                        to: 'sessions#create'
  delete '/sessions/:id',                                    to: 'sessions#destroy'

  get    '/message_threads',                                 to: 'message_threads#index'
  get    '/message_threads/:id',                             to: 'message_threads#show'
  post   '/message_threads',                                 to: 'message_threads#create'
  delete '/message_threads/:id',                             to: 'message_threads#destroy'

  get    '/message_threads/:message_thread_id/messages',     to: 'messages#index'
  get    '/message_threads/:message_thread_id/messages/:id', to: 'messages#show'
  post   '/message_threads/:message_thread_id/messages',     to: 'messages#create'
  delete '/message_threads/:message_thread_id/messages/:id', to: 'messages#destroy'

  get    '/notifications',                                   to: 'notifications#index'
  get    '/notifications/:id',                               to: 'notifications#show'
end
