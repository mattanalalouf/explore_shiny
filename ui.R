# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Hello Shiny!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      fluidRow(
        column(12,
               dataTableOutput('jobs_table')
        )
      )
      
    )
  )
)


# App idea
# Pull job listings from various sources
# e.g. https://www.healthecareers.com/acog/search-jobs/?locationtext=Maryland%2C+USA&remote=false&catid=2445
# Flag new jobs in addition to past searches
# Flag jobs that are no longer listed on the site
# Create a table with a list of jobs of interest
# delete jobs that are definitely not interesting (e.g. locum tenens)
# Make a map of job locations
# Track the date a job was first posted
# identify the date a job was deleted
# Set up a lambda program to update the database (daily?) 
# Allow user input to whether a job is interesting or not
# Create a model that tries to predict user interest based on
#   how user has rated past jobs (text based)