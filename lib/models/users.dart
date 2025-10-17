import 'dart:collection';

class UserCredentials{

  final String fullname;
  final String username;
  final String birthday; 
  final String email;
  final String password;


  UserCredentials({
  required this.fullname,
  required this.username,
  required this.birthday,
  required this.email, 
  required this.password, 
  });


//methods
  String getUsername(){
    return username;
  }

  greetMe(){

    print("HI $username");
  }
}

class PokemonCredentials{

  final String pokemonname;
  final String pokemontype;
  final String imagelink; 

  PokemonCredentials({

    required this.pokemonname,
    required this.pokemontype,
    required this.imagelink,

  });

}


