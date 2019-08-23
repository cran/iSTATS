 shinyServer(function(input, output, session) {

   options(shiny.maxRequestSize=100*1024^2)

   source('uploader_server.R', local = T)

   source('plot_interativo_server.R', local = T)

   source('select_signals_server.R', local = T)

   source('stocsy_i_server.R', local = T)

   source('stocsy_is_server.R', local = T)

   source('stocsy_rt_server.R', local = T)

   source('example_data_server.R', local = T)

   source('functions.R', local = T)

})
