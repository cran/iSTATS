  ndpi <<- 72

  ncor <<-  1

  rr <<- c()

  chkzoom_stocsy_i <<- 1

  idb_stocsy_i <<- 0

  peran_stocsy_i <<- 0

  ysup_stocsy_i <- max(NMRData[1,])

  yinf_stocsy_i <- ysup_stocsy_i*-0.03

  ysup_stocsy_i <- ysup_stocsy_i + ysup_stocsy_i*0.03

  testy_stocsy_i <<- data.frame(Chemical_Shift=CS_values_real[1,])

  ranges_stocsy_i <- reactiveValues(x = c((min(testy_stocsy_i$Chemical_Shift)), max(testy_stocsy_i$Chemical_Shift)), y = c(yinf_stocsy_i,ysup_stocsy_i))

  spectrums_stocsy_i <- reactiveValues(dat = data.frame(Chemical_Shift=CS_values_real[1,],Spectrum=NMRData[1,])) #, facs = data.frame(fac_stocsy_i = rr[])

  facts <<- reactiveValues(fac_stocsy_i = c())

  #Plot
  output$plot_stocsy_i <- renderPlot({

    ggplot2::ggplot(spectrums_stocsy_i$dat,ggplot2::aes(Chemical_Shift,Spectrum)) + ggplot2::geom_line(color='blue') +

      ggplot2::geom_line(ggplot2::aes(colour=facts$fac_stocsy_i,group=1)) + ggplot2::guides(colour = FALSE) + ggplot2::scale_colour_manual(values = c("red","blue")) +

      ggplot2::coord_cartesian(xlim = ranges_stocsy_i$x, ylim = ranges_stocsy_i$y, expand = FALSE) +

      ggplot2::scale_x_reverse() +

      ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12, color = "#000000"),
                     axis.text.y = ggplot2::element_text(size = 12, color = "#000000"),
                     title = ggplot2::element_text(face = "bold", color = "#000000", size = 17),
                     axis.title = ggplot2::element_text(face = "bold", color = "#000000", size = 15)
      ) +

      ggplot2::labs(x = "Chemical Shift", y = "Intensity")





    })


# Radio Button.

  observeEvent(input$radio, {

    value <<- (input$radio)

    if (value == 1){

      for (k in 1:dim(NMRData)[2]) {

        if (k %in% col_select) {

          z <<- which(col_select[] == k)

          if (cor_pearson[drv_pk,z] >= cor_cutoff_i) {

              rr[k] <<- "A"

            }

          else {

            rr[k] <<- "B"

          }
        }
      }

      facts$fac_stocsy_i <<- rr[]


    }

    if (value == 2) {

      for (k in 1:dim(NMRData)[2]) {

        if (k %in% col_select) {

            z <<- which(col_select[] == k)

            if (cor_spearman[drv_pk,z] >= cor_cutoff_i) {

              rr[k] <<- "A"

            }

            else {

              rr[k] <<- "B"

            }
          }

         else {

              rr[k] <<- "B"  #falta transformar 'rr' em variavel reativa

         }
        }

        facts$fac_stocsy_i <<- rr[]

      }

      if (value == 3) {

        for (k in 1:dim(NMRData)[2]) {

          if (k %in% col_select) {

            z <<- which(col_select[] == k)

            if (cor_pearson[drv_pk,z] >= cor_cutoff_i) {

              rr[k] <<- "A"

            }

            else {  }


            if (cor_spearman[drv_pk,z] >= cor_cutoff_i) {

              rr[k] <<- "A"

                  }
              else {

              }
            }

           else {  }

          }


        facts$fac_stocsy_i <<- rr[]

    }

    })

  observeEvent(input$plot_brush_stocsy_i,{
    brush <- input$plot_brush_stocsy_i
    if (!is.null(brush)) {

      ranges_stocsy_i$x <- c(brush$xmin, brush$xmax)

      ranges_stocsy_i$y <- c(brush$ymin, brush$ymax)

      idb_stocsy_i <<- 1

      peran_stocsy_i <<- (ranges_stocsy_i$x[2] - ranges_stocsy_i$x[1])*0.2

      }

      else {

        ranges_stocsy_i$x <- NULL

      }
    })




  observeEvent(input$x2_stocsy_i, {

    tryton <<- facts$fac_stocsy_i

    chkzoom_stocsy_i <<- chkzoom_stocsy_i*2


    spectrums_stocsy_i$dat$Spectrum <- spectrums_stocsy_i$dat$Spectrum*2

  })


  observeEvent(input$x8_stocsy_i, {

    chkzoom_stocsy_i <<- chkzoom_stocsy_i*8

    spectrums_stocsy_i$dat$Spectrum <- spectrums_stocsy_i$dat$Spectrum*8

  })

  observeEvent(input$q2_stocsy_i, {

    chkzoom_stocsy_i <<- chkzoom_stocsy_i/2

    spectrums_stocsy_i$dat$Spectrum <- spectrums_stocsy_i$dat$Spectrum/2

  })

  observeEvent(input$q8_stocsy_i, {

    chkzoom_stocsy_i <<- chkzoom_stocsy_i/8

    spectrums_stocsy_i$dat$Spectrum <- spectrums_stocsy_i$dat$Spectrum/8

  })



  observeEvent(input$all_stocsy_i, {

    ranges_stocsy_i$x <- c((min(testy_stocsy_i$Chemical_Shift)), max(testy_stocsy_i$Chemical_Shift))

    freshnum_stocsy_i <- which(file_names[] == input$spectrum_list_stocsy_i)

    ysup_stocsy_i <- max (NMRData[freshnum_stocsy_i,])

    yinf_stocsy_i <- ysup_stocsy_i*-0.03

    ysup_stocsy_i <- ysup_stocsy_i + ysup_stocsy_i*0.03

    ranges_stocsy_i$y <- c(yinf_stocsy_i,ysup_stocsy_i)

    spectrums_stocsy_i$dat$Spectrum <- spectrums_stocsy_i$dat$Spectrum/chkzoom_stocsy_i

    chkzoom_stocsy_i <<- 1

    idb_stocsy_i <<- 0

  })

  observeEvent(input$s_left_stocsy_i, {

    if (!(ranges_stocsy_i$x[1] <= min(testy_stocsy_i$Chemical_Shift))) {

    ranges_stocsy_i$x[1] <<- (ranges_stocsy_i$x[1] - peran_stocsy_i)

    ranges_stocsy_i$x[2] <<- (ranges_stocsy_i$x[2] - peran_stocsy_i)

    }

  })

  observeEvent(input$s_right_stocsy_i, {

    if (!(ranges_stocsy_i$x[2] >= max(testy_stocsy_i$Chemical_Shift))) {

    ranges_stocsy_i$x[1] <<- (ranges_stocsy_i$x[1] + peran_stocsy_i)

    ranges_stocsy_i$x[2] <<- (ranges_stocsy_i$x[2] + peran_stocsy_i)

    }

  })

  observeEvent(input$s_left_f_stocsy_i, {

    if (!(ranges_stocsy_i$x[1] <= min(testy_stocsy_i$Chemical_Shift))) {

    das_stocsy_i <<- (ranges_stocsy_i$x[2] - ranges_stocsy_i$x[1])

    ranges_stocsy_i$x[1] <<- min(testy_stocsy_i$Chemical_Shift)

    ranges_stocsy_i$x[2] <<- (min(testy_stocsy_i$Chemical_Shift) + das_stocsy_i)

    }

  })

  observeEvent(input$s_right_f_stocsy_i, {

    if (!(ranges_stocsy_i$x[2] >= max(testy_stocsy_i$Chemical_Shift))) {

      das_stocsy_i <<- (ranges_stocsy_i$x[2] - ranges_stocsy_i$x[1])

      ranges_stocsy_i$x[2] <<- max(testy_stocsy_i$Chemical_Shift)

      ranges_stocsy_i$x[1] <<- (max(testy_stocsy_i$Chemical_Shift) - das_stocsy_i)

    }

  })

  observeEvent(input$stocsy_i_, {

    ggsave("stocsy-i[1].pdf",width=195, height=105, units="mm", dpi = 1200)

  })


  observeEvent(input$spectrum_list_stocsy_i,{

    freshnum_stocsy_i <- which(file_names[] == input$spectrum_list_stocsy_i)

    spectrums_stocsy_i$dat <- data.frame(Chemical_Shift=CS_values_real[1,],Spectrum=NMRData[freshnum_stocsy_i,])

    if (!idb_stocsy_i && chkzoom_stocsy_i == 1) {

    ysup_stocsy_i <- max (NMRData[freshnum_stocsy_i,])

    yinf_stocsy_i <- ysup_stocsy_i*-0.03

    ysup_stocsy_i <- ysup_stocsy_i + ysup_stocsy_i*0.03

    ranges_stocsy_i$y <- c(yinf_stocsy_i, ysup_stocsy_i)

    }

    else {

        spectrums_stocsy_i$dat$Spectrum <- spectrums_stocsy_i$dat$Spectrum*chkzoom_stocsy_i

    }

    })


  observeEvent(input$dblclick_stocsy_i, {

    drv_pk_oi <<- which(abs(CS_values_real[1,]-input$dblclick_stocsy_i$x)==min(abs(CS_values_real[1,]-input$dblclick_stocsy_i$x)))

    if (drv_pk_oi %in% col_select) {

      drv_pk <<- which(col_select[] == drv_pk_oi)

      for (k in 1:dim(NMRData)[2]) {

        if (k %in% col_select) {

          z <<- which(col_select[] == k)

          if (cor_pearson[drv_pk,z] >= input$cutoff_stocsy_i) {

            rr[k] <<- "A"

          }

          else {

            rr[k] <<- "B"

          }

        }

        else {

          rr[k] <<- "B"  #falta transformar 'rr' em variavel reativa

        }

        }

        facts$fac_stocsy_i <<- rr[]

      }

      else {

        showModal(modalDialog(
          title = "Warning!!!",
          "The selected point is not inside the previously loaded regions. Please, click on another point or load a new group of signals!",
          easyClose = TRUE,
          footer = modalButton("Close"),
          size = "l",

          drv_pk <- drv_pk_oi

        ))

      }



    })


  observeEvent(input$cutoff_stocsy_i, {

    cor_cutoff_i <<- input$cutoff_stocsy_i

    for (k in 1:dim(NMRData)[2]) {

      if (k %in% col_select) {

        z <<- which(col_select[] == k)

        if (cor_pearson[drv_pk,z] >= cor_cutoff_i) {

          rr[k] <<- "A"

        }

        else {

          rr[k] <<- "B"

        }

        }

        else {

          rr[k] <<- "B"  #falta transformar 'rr' em variavel reativa

        }

      }

      facts$fac_stocsy_i <<- rr[]


       })


  observeEvent(input$hover_stocsy_i, {

    })


