

observeEvent(input$example_but,{

   file_names <<- iSTATS::file_names
   CS_values_real <<- iSTATS::CS_values_real
   NMRData <<- iSTATS::NMRData

   refreshval()



   updateSelectInput(session, "spectrum_list_multi", choices = file_names[])

   updateSelectInput(session, "spectrum_list_stocsy_i", choices = file_names[])

   updateSelectInput(session, "spectrum_list_stocsy_is", choices = file_names[])

   updateSelectInput(session, "spectrum_list_stocsy_rt", choices = file_names[])

   updateTabsetPanel(session, "main_bar", "Plot Spectra")


})

