
observeEvent(input$file3, {

  buma <<- 0

  if(is.null(input$file3))  return(NULL)

  up3 <<-input$file3

  if (length(up3$name) < 1) {

    showModal(modalDialog(
      title = "Warning!!!",
      "Please select file before to continue!",
      easyClose = TRUE,
      footer = modalButton("Close"),
      size = "l"
    ))

    buma <<- 1

  }


  else {

    upfile3 <<-list()

    # Upload of samples


    load(up3$datapath, envir = .GlobalEnv)

    # for(l in 1:length(up3$name)) {
    #
    #   upfile3[[l]] <<- data.table::fread(up3$datapath[l],
    #                         header = FALSE, sep = ",",data.table=FALSE)
    #
    # }

#
#     lslim = as.numeric(input$ls_lims)
#     hslim = as.numeric(input$hs_lims)
#
#     file_names_full <<- up3$name
#
#     file_names <<- substr(basename(file_names_full),1, nchar(basename(file_names_full))-4)
#
#     file_names_full <<- gtools::mixedsort(file_names_full)
#
#     file_names <<- gtools::mixedsort(file_names)
#
#     upfile <<- lapply(upfile, function(k) if(anyNA(k)) k[-1,c(4,2)] else k[,c(4,2)])
#
#     list_len <- length(upfile)
#
#     CS_values <<- unlist((upfile[[1]][1]),use.names = FALSE, recursive = FALSE)
#
#     NMRData_temp <<- t(lapply(upfile, function(k) k[,2]))
#
#     hspoint <- which(abs(CS_values-lslim)==min(abs(CS_values-lslim)))[1]
#
#     lspoint <- which(abs(CS_values-hslim)==min(abs(CS_values-hslim)))[1]
#
#     npf = hspoint - lspoint
#
#     np = npf + 1
#
#     CS_values_temp <- lapply(upfile, function(k) k[,1])
#
#     hspoint <- sapply(CS_values_temp, function (v) which(abs(v-lslim)==min(abs(v-lslim)))[1])
#
#     CS_ind <- which.min(abs(mapply(function(x,y) x[hspoint[y]],CS_values_temp, 1:list_len)))
#
#     CS_values <<- CS_values_temp[[CS_ind]][(hspoint[CS_ind]-npf):hspoint[CS_ind]]
#
#     NMRData <<- t(mapply(function(x,y) x[(hspoint[y]-npf):hspoint[y]],NMRData_temp, 1:list_len))
#
#     CS_values_real <<- rbind(CS_values,CS_values)
#
#     NMRData <<- NMRData + abs(min(NMRData))
#

    refreshval()

    updateSelectInput(session, "spectrum_list_multi", choices = file_names[])

    updateSelectInput(session, "spectrum_list_stocsy_i", choices = file_names[])

    updateSelectInput(session, "spectrum_list_stocsy_is", choices = file_names[])

    updateSelectInput(session, "spectrum_list_stocsy_rt", choices = file_names[])

    updateTabsetPanel(session, "main_bar", "Plot Spectra")

  }

})



output$imputa3 <- renderUI({

  tagList(

    (fluidPage(theme = 'zoo.css',

               fluidRow(align = "center",

                        fluidRow(div(style="height:30px")),

                        fileInput("file3", "Choose RData Files",
                                  multiple = F,
                                  accept = c(".Rdata")
                        ),

                        fluidRow(div(style="height:30px")),

                        fluidRow( tags$b("IMPORTANT: the RData files must contain only NMRData (matrix with intensity) CS_Values_Real (matrix of chemical shift) and file_names (list of sample names).")),


                        mainPanel(

                        )

               )

    )))

})
