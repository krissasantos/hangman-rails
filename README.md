# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies


Hangman
A game of hangman which can be played by a user "against" the computer. Hangman is a game where the  secret-keeper  (in this case, the computer) thinks of a word, and the  guesser  (the user) tries to guess it one letter at a time. The g  uesser  has six guesses. If the guesser  guesses a letter which is part of the word, the s  ecret-keeper  will reveal all occurrences of that letter in the word. If the  guesser  guesses a correct letter such that all letters are now revealed, the game is over and player 2 has won. Instead if player 2 runs out of guesses before the whole word is discovered, the game is over and player 1 has won. Check out  https://en.wikipedia.org/wiki/Hangman_(game)  for more details.


Game rules
- At the start of the game the computer/secret-keeper will choose a dictionary word
- The guesser loses the game if they guess 6 letters that are not in the secret word
- The guesser wins the game if they guess all letters in the secret word correctly and have
not already lost the game per the conditions above


Logic:

In each guess made by the user, the value of the guess is checked if it is included in the secret word.
If the guess is wrong, it is considered as a miss and is counted a strike, decreasing the number of guesses the user makes.
If otherwise, meaning the value (the letter) given by the user is correct,  a string variable containing blanks, switches the 'blank' character into that chosen letter at the same indices that letter is positioned at the secret word. The string variable of blanks has the same number of characters with the secret word itself.

Once the blanks are successully "filled up" with (technically switched into) the right letters without surpassing the maximum number of missess allowed, the user wins, otherwise, the user loses.



Framework:

This application uses Ruby On Rails with the MVC (Models, Views, Controller) design pattern.

The models contain the data and state of the application. 
The views handle the interaction with the user sending the values to the controller to further interact with the models and displays whatever is sent back as well.

The controller is the middleman that receives the values based on the events happening through the views. It follows the CRUD (create read update destroy)  framework to allow the application create, read, update and destroy instances of the classes/models of the app.

The resources method found in routes.rb (router) makes it possible for the app to be RESTFUL. The router directs the process into the controller through its corresponding CRUD operations.


This app has 5 main models with its own specific attributes:

User
  The user contains sign-up details such as name, age,email and password.
Session
  The session contains login details such as email and password.
Game 
  The game contains settings such as difficulty and maxLength to tweak the mode of the game preferred
Miss
  The miss contains the letter chosen and the game_id as assignment
Guess
  The guess contains the letter chosen and the game_id as assignment


The controller methods such as new, create, update and destroy are all found in the 5 models.

In terms of game process/flow, the game model contains important methods such as:

missed_letters
  returns an array of misses by the user in this particular game

guessed_letters
  returns an array of misses by the user in this particular game

selected_letters
  return the total number of letters selected (uncategorized)

guessed?
  returns a boolean to check whether the secret word has been figured out.

guessed_word?
  returns a boolean to check whether the secret word has been figured out via word value (not individual letters).

finished?
  returns a boolean to check if the secret word has been guessed or the maximum number of guesses has been reached
  
update_blanks(letter)
  returns an updated string of blanks based on the letter being a hit or a miss
 
  
select!(letter)
  creates instances of the letter as a miss or a guess.
    

The methods above are used by the games controller, specifically inside the 'update' method. This happens upon the submit event of the user when one hits any of the letters found in the view page of the game (your window/browser). 

That button contains a corresponding value, picked up via params which is sent straight to the update method. The button (technically, a form with only a submit button) is assigned to the 'PATCH' method leading it to the update method of the game controller itself. See below:


def update
    @game = Game.find(params[:id])

    if params[:letter].size == 1

      @game.select!(params[:letter]) 
    elsif params[:letter].size > 1
      
      @game.update_blanks(params[:letter])
    end      
    #byebug #select! method happens here upon submit with method patch

    @game.update_blanks(params[:letter])
    @game.update_attribute(:blanks_spaces, @game.update_blanks(params[:letter]))
   
    render :show
end 
  

The update_attribute is an ActiveRecord method that updates an attribute after manipulating the such via the controller/model methods.

In terms of retrieving the secret word from the Dictionary REST API provided, the app includes a method called DictionaryAdapter. Here the API call is made, the response is parsed, made into an array and sampled via Ruby sample method (getting a random element within the array).The addtional queries used, difficulty and maxLength are based on the user's preferences. 

User Authentication & Security

The app uses a gem called bcrypt, a password hashing function. 

Other tools:


For Database: MySQL and Active Record

ActiveRecord is a Ruby library for working with Relational SQL Databases like MySQL and Postgres. It provides an Object Relational Mapping (ORM) with these core features: a single Ruby object maps to a database table. columns are accessed by methods, and are inferred from the database schema.


Installation:

Download the zipfile.
Make sure gems are bundled/installed with 'bundle install'
Migrate tables with 'rake db:migrate'
Open rails server with 'rails s'
Open the app via http://localhost:3000

Enjoy!









