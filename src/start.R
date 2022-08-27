library(shidashi)

# Render this project
shidashi::template_settings$set(root_path = 'C:\\Users\\StuartMalcolm\\work\\metadata\\src')

# Render project
shidashi::render(host = '127.0.0.1', port = 8310L)
