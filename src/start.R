library(shidashi)

# Render this project
shidashi::template_settings$set(root_path = file.path(Sys.getenv("runpath"),"src"))

# Render project
shidashi::render(host = '127.0.0.1', port = 8310L)
