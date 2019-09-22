#empress kombucha rating app
library(shiny)
library(shinyjs)
library(shiny.semantic)
library(shinydashboard)
library(ShinyRatingInput)
library(shinydashboardPlus)
library(bs4Dash)
library(shinyEffects)
library(shinyWidgets)
library(tidyverse)

#NB! - write_delim converts all to utf-8
data <- read_delim("data/ratinglog.csv", delim=",")

# User interface:
ui <- dashboardPage(skin="black",
  dashboardHeader(title="Empress Kombucha",
                  tags$li(a(href = 'https://www.facebook.com/drinkempress/?__tn__=%2Cd%2CP-R&eid=ARAp6qTgKc3rauaXAGgn9v16zuN0MGHWuJ_yc-V_mVakFA8DVi5H8VxRm9imOeuoLRP7a2Z_NOw-riIs',
                            img(src = 'empress_logo_lady.png',
                                title = "Empress Kombucha", height = "30px"),
                            style = "padding-top:10px; padding-bottom:10px;"),
                          class = "dropdown")
                  ), 
  dashboardSidebar(collapsed=TRUE,
    sidebarMenu(id="menu",
                menuItem("Rating", tabName = "rating", icon=icon("star")),
                menuItem("Takk", tabName = "thankyou", icon=icon("heart")),
                menuItem("Resultater", tabName = "results", icon=icon("chart-bar")),
                menuItem("Testing", tabName = "testing", icon=icon("chart-bar"))
    )
  ),
  dashboardBody(
    tags$head(tags$style(HTML('

                                /* body */
                                .content-wrapper, .right-side {
                                background-color: #ebebe8;
                                }

                                '))),
    
    setZoom(class = "box"),
    setZoom(class = "button"),
    tabItems(
      tabItem(tabName="rating",
              h2("Fortell oss hva DU synes!"),
              fluidRow(
                ### BEETROOT ####
                boxPlus(title = "",
                        closable = FALSE,
                        #status = "warning",
                        collapsible = FALSE,
                        fluidRow(
                        column(width=6,
                               
                               img(src='Empress_Beet.png', align = "left", height = 180, width = 180)
                               
                               #br(),
                        ),
                        column(width=6,                        
                               h1("Rødbete"),
                               br(),
                               ratingInput("rating_beet", label="", 
                                           dataFilled="fa fa-star fa-2x orange", 
                                           dataEmpty="fa fa-star-o fa-2x orange")
                               
                        )
                        ),

                    fluidRow(
                      column(width=6,offset=3,
                      radioButtons("radio_beet_tasted", label = h3("Har du smakt Kombucha før?"),
                                           choices = list("Ja" = 1, "Nei" = 2), 
                                           selected = 2,inline=TRUE)
                      )
                      ),
                    fluidRow(
                    column(width=6,
                    checkboxGroupInput("checkGroup_beet", label = h3("Hva synes du om smaken?"), 
                                       choices = list("Forfriskende" = 1, "Søt" = 2, "Sur" = 3, "Merkelig" = 4),
                                       selected = 1)
                    ),
                    column(width=6,
                    radioButtons("radio_beet_again", label = h3("Ville du ha drukket Kombucha igjen?"),
                                 choices = list("Ja" = 1, "Nei" = 2), inline=TRUE)
                    )
                    )
                     # htmlOutput("rating_beetroot")
                    
                    ),
                #### GINGER ######
                
                boxPlus(title = "",
                        closable = FALSE,
                        #status = "warning",
                        collapsible = FALSE,
                        fluidRow(
                          column(width=6,
                                 
                                 img(src='Empress_Ginger.png', align = "left", height = 180, width = 180)
                                 
                                 #br(),
                          ),
                          column(width=6,                        
                                 h1("Ingefær"),
                                 br(),
                                 ratingInput("rating_ginger", label="", 
                                             dataFilled="fa fa-star fa-2x orange", 
                                             dataEmpty="fa fa-star-o fa-2x orange")
                                 
                          )
                        ),
                        
                        fluidRow(
                          column(width=6,offset=3,
                                 radioButtons("radio_ginger_tasted", label = h3("Har du smakt Kombucha før?"),
                                              choices = list("Ja" = 1, "Nei" = 2), 
                                              selected = 2,inline=TRUE)
                          )
                        ),
                        fluidRow(
                          column(width=6,
                                 checkboxGroupInput("checkGroup_ginger", label = h3("Hva synes du om smaken?"), 
                                                    choices = list("Forfriskende" = 1, "Søt" = 2, "Sur" = 3, "Merkelig" = 4),
                                                    selected = 1)
                          ),
                          column(width=6,
                                 radioButtons("radio_ginger_again", label = h3("Ville du ha drukket Kombucha igjen?"),
                                              choices = list("Ja" = 1, "Nei" = 2), inline=TRUE)
                          )
                        )
                        # htmlOutput("rating_beetroot")
                        
                )#end box
                
              ),
              fluidRow(
                
                ###### STRAWBERRY #########
                
                boxPlus(title = "",
                        closable = FALSE,
                        #status = "warning",
                        collapsible = FALSE,
                        fluidRow(
                          column(width=6,
                                 
                                 img(src='Empress_Straw.png', align = "left", height = 180, width = 180)
                                 
                                 #br(),
                          ),
                          column(width=6,                        
                                 h1("Jordbær"),
                                 br(),
                                 ratingInput("rating_straw", label="", 
                                             dataFilled="fa fa-star fa-2x orange", 
                                             dataEmpty="fa fa-star-o fa-2x orange")
                                 
                          )
                        ),
                        
                        fluidRow(
                          column(width=6,offset=3,
                                 radioButtons("radio_straw_tasted", label = h3("Har du smakt Kombucha før?"),
                                              choices = list("Ja" = 1, "Nei" = 2), 
                                              selected = 2,inline=TRUE)
                          )
                        ),
                        fluidRow(
                          column(width=6,
                                 checkboxGroupInput("checkGroup_straw", label = h3("Hva synes du om smaken?"), 
                                                    choices = list("Forfriskende" = 1, "Søt" = 2, "Sur" = 3, "Merkelig" = 4),
                                                    selected = 1)
                          ),
                          column(width=6,
                                 radioButtons("radio_straw_again", label = h3("Ville du ha drukket Kombucha igjen?"),
                                              choices = list("Ja" = 1, "Nei" = 2), inline=TRUE)
                          )
                        )
                        
                        
                )
                
                ,
                
                ###### ROSE ######
                
                
                boxPlus(title = "",
                        closable = FALSE,
                        #status = "warning",
                        collapsible = FALSE,
                        fluidRow(
                          column(width=6,
                                 
                                 img(src='Empress_Rose.png', align = "left", height = 180, width = 180)
                                 
                                 #br(),
                          ),
                          column(width=6,                        
                                 h1("Rose"),
                                 br(),
                                 ratingInput("rating_rose", label="", 
                                             dataFilled="fa fa-star fa-2x orange", 
                                             dataEmpty="fa fa-star-o fa-2x orange")
                                 
                          )
                        ),
                        
                        fluidRow(
                          column(width=6,offset=3,
                                 radioButtons("radio_rose_tasted", label = h3("Har du smakt Kombucha før?"),
                                              choices = list("Ja" = 1, "Nei" = 0), 
                                              selected = 2,inline=TRUE)
                          )
                        ),
                        fluidRow(
                          column(width=6,
                                 checkboxGroupInput("checkGroup_rose", label = h3("Hva synes du om smaken?"), 
                                                    choices = list("Forfriskende" = 1, "Søt" = 2, "Sur" = 3, "Merkelig" = 4),
                                                    selected = 1)
                          ),
                          column(width=6,
                                 radioButtons("radio_rose_again", label = h3("Ville du ha drukket Kombucha igjen?"),
                                              choices = list("Ja" = 1, "Nei" = 0), inline=TRUE)
                          )
                        )
                        # htmlOutput("rating_beetroot")
                        
                )
                
              ),
              fluidRow(
                actionButton(inputId="save_rating", label = "SEND", width='100%',
                icon("telegram-plane"),#icon("share"),
                style="color: #fff; background-color: #212322; border-color: #ebebe8")
                
              )
              ),
      tabItem(tabName="thankyou",
              
              
              widgetUserBox(
                title = "",
                subtitle = "",
                type = NULL,
                width = 12,
                src = "empress_logo_black.png",
                background = TRUE,
                #backgroundUrl = "https://images.pexels.com/photos/531880/pexels-photo-531880.jpeg?auto=compress&cs=tinysrgb&h=350",
                backgroundUrl = "empress_bottle_bkg.jpg",
                closable = FALSE,
                collapsible = FALSE,
                "",
                footer = 
              fluidRow(
                column(width=12,
                       align="center",
                  h1("Takk for ditt bidrag!"),
                  h2("Vite mer?"),
                  h2("Følg oss på:"),
                  socialButton(
                    url = "https://www.facebook.com/drinkempress/?__tn__=%2Cd%2CP-R&eid=ARAp6qTgKc3rauaXAGgn9v16zuN0MGHWuJ_yc-V_mVakFA8DVi5H8VxRm9imOeuoLRP7a2Z_NOw-riIs",
                    type = "facebook"
                  ),
                  socialButton(
                    url = "https://www.pictosee.com/drinkempress/",
                    type = "instagram"
                  ),
                  br(),
                  br(),
                  actionButton(inputId="goto_rating", label = "Tilbake til rating", width='100%',
                               icon("share"),
                               style="color: #fff; background-color: #212322; border-color: #ebebe8")
                )
              )
              )#end widgetUserBox
                
              
              
              
             
              ),
      tabItem(tabName="results",
              
              flipBox(id=10,
               
               main_img = "empress_logo_black.png",
               header_img = "empress_bottle_bkg.jpg",
               front_title = "Resultater",
               back_title = "Tittel bakside",
               "evt tekst her",
               
               fluidRow(
                 boxPlus(
                     closable = FALSE,
                     status = "warning",
                     collapsible = FALSE,
                     img(src='Empress_Beet.png', align = "center", height = 75, width = 75),
                     br(),
                     starBlock(grade = mean(data$rating_beet,na.rm=TRUE)),
                     #starBlock(grade = uiOutput("avg_beet"))
                     textOutput("avg_beet"),
                     appButton(
                       url = "",
                       label = "Antall stemmer",
                       icon = "fa fa-users",
                       enable_badge = TRUE,
                       badgeColor = "purple",
                       #badgeLabel = NROW(na.omit(data$rating_beet))
                       badgeLabel = textOutput("nr_beet")
                     )
                 ),
                 
                 boxPlus(
                   closable = FALSE,
                   status = "warning",
                   collapsible = FALSE,
                   img(src='Empress_Ginger.png', align = "center", height = 75, width = 75),
                   br(),
                   starBlock(grade = mean(data$rating_ginger,na.rm=TRUE)),
                   textOutput("avg_ginger"),
                   appButton(
                     url = "",
                     label = "Antall stemmer",
                     icon = "fa fa-users",
                     enable_badge = TRUE,
                     badgeColor = "purple",
                     badgeLabel = textOutput("nr_ginger")
                   )
                 ),
                 
                 boxPlus(closable = FALSE,
                         status = "warning",
                         collapsible = FALSE,
                         img(src='Empress_Straw.png', align = "center", height = 75, width = 75),
                         br(),
                         starBlock(grade = mean(data$rating_straw,na.rm=TRUE)),
                         textOutput("avg_straw"),
                         appButton(
                           url = "",
                           label = "Antall stemmer",
                           icon = "fa fa-users",
                           enable_badge = TRUE,
                           badgeColor = "purple",
                           badgeLabel = textOutput("nr_straw")
                         )
                 ),
                 
                 boxPlus(closable = FALSE,
                         status = "warning",
                         collapsible = FALSE,
                         img(src='Empress_Rose.png', align = "center", height = 75, width = 75),
                         br(),
                         starBlock(grade = mean(data$rating_rose,na.rm=TRUE)),
                         #starBlock(grade = uiOutput("avg_beet"))
                         textOutput("avg_rose"),
                         appButton(
                           url = "",
                           label = "Antall stemmer",
                           icon = "fa fa-users",
                           enable_badge = TRUE,
                           badgeColor = "purple",
                           #badgeLabel = NROW(na.omit(data$rating_beet))
                           badgeLabel = textOutput("nr_rose")
                         )
                 )
                 
               ),
               back_content = tagList(
                 column(
                   width = 4,
                   align = "center",
                   h3("Hent ut rapport her:")
                 )
               )#end back_content
               )#end flipBox
              
              
              
              
              ),
      tabItem("testing",
              tableOutput("filedataTable")
              
              )
              
    
  )
))

server <- function(input, output, session) {

########### save rating #######
  
  observeEvent(input$save_rating, {
    
    # df_names <- c("date","latitude","longitude",
    #               "rating_beet",  "tasted_before_beet",  "flavour_beet",  "taste_again_beet",
    #               "rating_ginger","tasted_before_ginger","flavour_ginger","taste_again_ginger",
    #               "rating_straw", "tasted_before_straw", "flavour_straw", "taste_again_straw",
    #               "rating_rose",  "tasted_before_rose",  "flavour_rose",  "taste_again_rose")
    
    df_names_beet <- c("date","latitude","longitude",
                       "rating_beet",  "tasted_before_beet",  "flavour_beet",  "taste_again_beet")
    
    
    #print(df_names)
    dfLog_beet <- setNames(data.frame(matrix(ncol = 7, nrow = 1)), df_names_beet)
    #str(dfLog)
    #populate dataframe with inputs:
    
    dfLog_beet = data.frame(
    
    date = Sys.Date(),
    latitude = 59.911491,
    longitude = 10.757933,
    
    rating_beet = input$rating_beet,
    tasted_before_beet = input$radio_beet_tasted,
    flavour_beet = input$checkGroup_beet,
    taste_again_beet = input$radio_beet_again)
    
    # rating_ginger = input$rating_ginger,
    # tasted_before_ginger = input$radio_ginger_tasted,
    # flavour_ginger = input$checkGroup_ginger,
    # taste_again_ginger= input$radio_ginger_again,
    # 
    # rating_straw = input$rating_straw,
    # tasted_before_straw = input$radio_straw_tasted,
    # flavour_straw = input$checkGroup_straw,
    # taste_again_straw = input$radio_straw_again,
    # 
    # rating_rose = input$rating_rose,
    # tasted_before_rose = input$radio_rose_tasted,
    # flavour_rose = input$checkGroup_rose,
    # taste_again_rose= input$radio_rose_again
    #)
                       
    # print(ncol(data))
    # print(ncol(dfLog))
    # print(dfLog)
      
    dfLog_beet <- rbind(data,dfLog_beet)
  
    #dfLog <- as.data.frame(dfLog)
    write_delim(dfLog_beet,"data/dfLog_beet.csv",delim=",")
    
  })

  fileData <- reactiveFileReader(100,NULL,filePath="data/ratinglog_beet.csv", readFunc=read.csv)
  
  output$filedataTable <- renderTable({
    fileData()
  })

#### dynamic outputs per product #######    
  # output$nr_beet <- renderText({ 
  #   NROW(na.omit(fileData()$rating_beet))
  # })
  # output$avg_beet <- renderText({
  #   round(mean(fileData()$rating_beet,na.rm=TRUE),1)
  # })
  # 
  # 
  # output$nr_ginger <- renderText({ 
  #   NROW(na.omit(fileData()$rating_ginger))
  # })
  # output$avg_ginger <- renderText({
  #   round(mean(fileData()$rating_ginger,na.rm=TRUE),1)
  # })
  # 
  # output$nr_straw <- renderText({ 
  #   NROW(na.omit(fileData()$rating_straw))
  # })
  # output$avg_straw <- renderText({
  #   round(mean(fileData()$rating_straw,na.rm=TRUE),1)
  # })
  # 
  # output$nr_rose <- renderText({ 
  #   NROW(na.omit(fileData()$rating_rose))
  # })
  # output$avg_rose <- renderText({
  #   round(mean(fileData()$rating_rose,na.rm=TRUE),1)
  # })
  # 
  
  
  
  
  # ##### test rating #####
  #   output$rating_beet <- renderText({
  #     paste("Rated: ",input$rating_beet)
  #   }) 
  
  
######### thank you tab/confirmation ######   
  observeEvent(input$save_rating, {
    updateTabItems(session, 'menu', 'thankyou')
  })
  
  observeEvent(input$goto_rating, {
    updateTabItems(session, 'menu', 'rating')
  }) 
  
  
  
}#end server

# Run the application 
shinyApp(ui = ui, server = server)
