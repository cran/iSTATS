 fluidPage(theme = 'zoo.css',

    fluidRow(column(12, align="center",

      column(3,align = "left",

        radioButtons("radio", label = h5("Correlation Type"), selected = 1,
                     choices = list("Pearson" = 1, "Spearman" = 2,"PearSpear" = 3)
        )
        ),

      column(9,align = "center",

      selectInput("spectrum_list_stocsy_i","Which spectrum do you want to see?",file_names[], selectize = FALSE),

      p(strong("To perform STOCSY analysis, double click on the desired driver peak in the spectrum below."))

      )
    )
      ),


    fluidRow(align = "center",

      column(2, align="center",

        fluidRow(

          sliderInput("cutoff_stocsy_i", label = h5("Correlation Cutoff"), min = 0,
                      max = 1, value = 0.9 , step= 0.01)
        ),

        fluidRow(

          tags$button(id = "x2_stocsy_i",
                      class = "btn action-button",
                      tags$img(src = "bx2.png",
                               height = "35px", width = "40px")
          ),

          tags$button(id = "x8_stocsy_i",
                      class = "btn action-button",
                      tags$img(src = "bx8.png",
                               height = "35px", width = "40px")
                           )
          ),

           fluidRow(div(style="height:5px")),

             fluidRow(

                tags$button(id = "q2_stocsy_i",
                             class = "btn action-button",
                             tags$img(src = "bq2.png",
                                      height = "35px", width = "40px")
                ),

                tags$button(id = "q8_stocsy_i",
                            class = "btn action-button",
                            tags$img(src = "bq8.png",
                                     height = "35px", width = "40px")
                           )
                ),

            br(),

            fluidRow(

              tags$button(id = "s_left_stocsy_i",
                          class = "btn action-button",
                          tags$img(src = "s_left.png",
                                   height = "35px", width = "40px")
                           ),

                           tags$button(
                             id = "s_right_stocsy_i",
                             class = "btn action-button",
                             tags$img(src = "s_right.png",
                                      height = "35px", width = "40px")
                           )
              ),

            fluidRow(div(style="height:5px")),

            fluidRow(

              tags$button(id = "s_left_f_stocsy_i",
                          class = "btn action-button",
                          tags$img(src = "s_left_f.png",
                                   height = "35px", width = "40px")
              ),

              tags$button(id = "s_right_f_stocsy_i",
                          class = "btn action-button",
                          tags$img(src = "s_right_f.png",
                                   height = "35px", width = "40px")
               )
              ),

             br(),

             fluidRow(

               tags$button(id = "all_stocsy_i",
                           class = "btn action-button",
                           tags$img(src = "all.png",
                           height = "35px", width = "40px")
               ),

             br()

              )
        ),


        column(10, align="center",

          plotOutput("plot_stocsy_i", width = "100%", height = "500px", click = "click_stocsy_i", dblclick = "dblclick_stocsy_i",
                     brush = brushOpts(id = "plot_brush_stocsy_i",delay = 5000,
                     fill = "#ccc", direction = "xy", resetOnNew = TRUE)

           )

        )
      )
  )





