
  observeEvent(input$file1, {

    buma <<- 0

    if(is.null(input$file1))  return(NULL)

      up <<-input$file1

      if (length(up$name) < 2) {

        showModal(modalDialog(
          title = "Warning!!!",
          "Please select two or more files before to continue!",
          easyClose = TRUE,
          footer = modalButton("Close"),
          size = "l"
        ))

        buma <<- 1

      }

      else {

      upfile <<-list()

    # Upload of samples
    for(l in 1:length(up$name)) {

      upfile[[l]] <<- read.csv(up$datapath[l],
                               header = FALSE)

    }

      }

  })

  # Built Matrix
  observeEvent(input$import1,{

    if(!is.null(input$file1) && buma == 0) {


    lslim = as.numeric(input$ls_lims)

    hslim = as.numeric(input$hs_lims)


    file_names_full <<- up$name

    file_names <<- substr(basename(file_names_full),1, nchar(basename(file_names_full))-4)

    file_names_full <<- gtools::mixedsort(file_names_full)

    file_names <<- gtools::mixedsort(file_names)


    Datatemp <- upfile[[1]]

    ci <- dim(Datatemp)[1]

    CS_values <<- (Datatemp[1:ci,1])

    NMRData_temp <- matrix(data = NA, nrow = length(file_names_full), ncol = length(CS_values))

    for (j in 1:length(file_names_full)) {

      Datatemp <- upfile[[j]]

      NMRData_temp[j,1:ci] <- Datatemp[1:ci,2]

    }


    hspoint <- which(abs(CS_values-lslim)==min(abs(CS_values-lslim)))

    lspoint <- which(abs(CS_values-hslim)==min(abs(CS_values-hslim)))

    lspoint <- lspoint[1]

    hspoint <- hspoint[1]

    np = hspoint - lspoint

    np = np + 2


    NMRData <<- matrix(data = 0, nrow = length(file_names_full), ncol = np)

    npo = np

    CS_values_real <<- matrix(data = 0, nrow = length(file_names_full), ncol = npo)


    for (spec in 1:length(file_names_full)) {

      Datatemp <- upfile[[spec]]

      CS_values_temp <- t(Datatemp[,1])

      hspoint <- which(abs(CS_values_temp-lslim)==min(abs(CS_values_temp-lslim)))

      lspoint <- which(abs(CS_values_temp-hslim)==min(abs(CS_values_temp-hslim)))

      lspoint <- lspoint[1]

      hspoint <- hspoint[1]

      nppp <- hspoint - lspoint

      kkk = 1


      for (ld in lspoint:hspoint) {

        CS_values_real[spec,kkk] <<- t(Datatemp[ld,1])

        kkk = kkk + 1

      }


      kkk = 1


      for (ld in lspoint:hspoint) {

        NMRData[spec,kkk] <<- NMRData_temp[spec,ld] #duvida

        kkk = kkk + 1

      }

    }


    refreshval()

    updateSelectInput(session, "spectrum_list_multi", choices = file_names[])

    updateSelectInput(session, "spectrum_list_stocsy_i", choices = file_names[])

    updateSelectInput(session, "spectrum_list_stocsy_is", choices = file_names[])

    updateSelectInput(session, "spectrum_list_stocsy_rt", choices = file_names[])

    updateTabsetPanel(session, "main_bar", "Plot Spectra")

    }

    else {

        showModal(modalDialog(
          title = "Warning!!!",
          "No file was selected. Please select two or more files before to continue!",
          easyClose = TRUE,
          footer = modalButton("Close"),
          size = "l"
        ))

      }


 })



  ###################################################################################################



  output$imputa <- renderUI({

    tagList(

      (fluidPage(theme = 'zoo.css',

        fluidRow(align = "center",

          fluidRow(div(style="height:30px")),

          fileInput("file1", "Choose CSV Files",
                    multiple = TRUE,
                    accept = c("text/csv",
                    "text/comma-separated-values,
                    text/plain",".csv",".CSV")
                    ),

          tags$button(id = "import1",
                      class = "btn action-button btn_lmax",
                      tags$img(src = "csv_i.png",
                      height = "50px", width = "50px")
                      ),

          fluidRow(div(style="height:30px")),

          fluidRow( tags$b("Choose a minimum and a maximum frequency (ppm) for the working spectra:")),

            fluidRow(div(style="height:15px")),

              fluidRow(column(5),
                       column(1, align="center",
                              textInput("ls_lims", "min","0.0",
                                        width = "150px")
                              ),


                              column(1, align="center",
                                    textInput("hs_lims", "max","10.0", width = "150px")
                              ),

                              column(5)

                              ),


                              fluidRow(div(style="height:30px")),

                              fluidRow( tags$b("IMPORTANT: the CSV files must contain only NMR chemical shift and intensity columns, respectively, separated by commas.")),




          mainPanel(

           )

        )

      )))

    })


    ###################################################################################################


