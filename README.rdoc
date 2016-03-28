== How to run app on localhost on Ubuntu 

rails 4.2.6

postgresql 9.5

If you want to use your own postresql login and password for connection to db, you will need to change settings in myblog/config *database.yml* file. Change username and password values on the lines 24-25 . Or you can create the same db user as mine.

[Create a PostgreSQL superuser user in Ubuntu with this commands:] 
* $sudo -u postgres createuser -s vitaliy 
* $sudo -u postgres psql \password vitaliy
* Enter password "12345" at the prompt without quotes, and confirm it.
* Now you may exit the PostgreSQL console by entering this command: \\q


[Enter to MyBlog directory at the promt and create database with this command:] ~/myblog$ rake db:create

[Install gems:] ~/myblog$ bundle install

[Run the migration:] ~/myblog$ rake db:migrate

[And run server:] ~/myblog$ rails s

Now you should be able to access MyBlog app in a web browser via http://localhost:3000

Second frontend task available on clicking "Simple Budget" tab on menu
