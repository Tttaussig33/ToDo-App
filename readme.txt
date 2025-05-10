ToDo App - Final Project (COM214 - Spring 2025)

Team Members:
- Teddy Taussig
- Nick Essery
- Evan Lyons

Development Process:
Our development process was to thoroughly go through each step of the project
and smoothly complete each part. We focused on ensuring that core functionality 
(delete ToDos, manage categories, login/logout, etc.) was solid before polishing 
the design. Bootstrap and custom CSS were then used to enhance visual appearance.

How to Run Locally:

1. Clone the repo:
   git clone https://github.com/Tttaussig33/ToDo-App.git

2. Install dependencies:
   bundle install

3. Set up the database:
   bin/rails db:migrate

4. Run the server:
   bin/rails server
   Visit http://localhost:3000 in your browser.

Packages and Libraries Used:
- Ruby 3.4.1
- Rails 7.2.2.1
- sqlite3 for local and production database
- bootstrap ~> 5.3.0 for styling
- bcrypt for password hashing
- puma as the web server
- importmap-rails, turbo-rails, stimulus-rails for frontend interactivity
- brakeman, rubocop-rails-omakase for security and code style (dev/test)

GitHub Repository:
https://github.com/Tttaussig33/ToDo-App

Live Deployment:
https://todo-app-wkma.onrender.com


