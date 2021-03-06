# README

## Getting started:

* Install Ruby, Rails, and Postgres on your machine ([guide](https://gorails.com/setup/osx/10.12-sierra))

* Clone the git repository:

    - In a terminal session, change to the directory you want the files to live in and run `git clone https://github.com/destiny-aviato/intense-spire.git`

    - Once that's done, change into the intense-spire directory

* Run `bundle install` in terminal

* For local development, run `figaro install`. This will create a file called /config/application.yml. Open it up and add the following lines: 

```ruby 
    CLIENT_ID: '<client_id>'
    CLIENT_SECRET: '<client_secret>'
    X_API_KEY: '<client api key>'
    REDIRECT_URL: "https://glacial-savannah-28014.herokuapp.com/users/auth/bungie/callback" #for development
    API_TOKEN: '<client api key>' #this can be the same as the one above, you'll need it for API requests (for now)
```

>You will want to create an application on <https://www.bungie.net/en/Application/> to generate these keys. Select **OAuth Client Type = Confidential**, and add the same redirect_url above to the application settings. Select all permissions under scope except for "Move or equip Destiny gear and other items." Finally add `*` as the Origin header. 

* Now you should be able to run `rails db:migrate` (if it fails, try `rake db:create` first). This will create all of the databases

* If those have been successful, you should now be able to start the rails server by typing `rails server`. Navigate to http://localhost:3000 to see if it works. 

## Contributing

For all contributions, please fork the repository and make a pull request with detailed information outlining your changes. Follow [this guide](https://help.github.com/articles/fork-a-repo/) to do so. Thanks!
