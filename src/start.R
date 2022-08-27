library(shidashi)

# Render this project
shidashi::template_settings$set(root_path = './src')

# Render project
shidashi::render(host = '127.0.0.1', port = 8310L, as_job = FALSE)
