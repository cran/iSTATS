

fluidPage(title="iSTATS",

  fluidRow(

    column(12, align="center",

           navbarPage(id = "main_bar",title = div(style = "vertical-align: top",img(src="ISTATS.1.png", heigth = "80px",
                                                                                    width = "80px")), selected = "Home", inverse = T,
                      navbarMenu("Data",

                                  tabPanel("Import CSV data",
                                           uiOutput('imputa')),

                                  tabPanel("Example Data",
                                          source('example_data_ui.R', local = T)[1]),

                                 tabPanel("Plot Spectra",

                                          source('plot_interativo_ui.R', local = T)[1])


                      ),

                      navbarMenu("STOCSY",


                                 tabPanel("Select Signals",
                                          source('select_signals_ui.R', local = T)[1]
                                 ),
                                 tabPanel("STOCSY-i",
                                          source('stocsy_i_ui.R', local = T)[1]
                                 ),
                                 tabPanel("STOCSY-is",
                                          source('stocsy_is_ui.R', local = T)[1]
                                 )
                                 ,
                                 tabPanel("STOCSY-rt",
                                          source('stocsy_rt_ui.R', local = T)[1]

                                 )
                      ),

                      navbarMenu("More",

                                 tabPanel("Home",
                                          source('home_ui.R', local = T)[1]),

                                 tabPanel("Contact",
                                          source('about_ui.R', local = TRUE)[1]
                                 )
                      )

           ),


           conditionalPanel(condition="$('html').hasClass('shiny-busy')",
                            tags$div("Loading...",id="loadmessage"))


    )


  )



)
