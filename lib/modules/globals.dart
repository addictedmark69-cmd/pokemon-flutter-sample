import 'package:flutter/material.dart';

import '../models/users.dart';

class SharedData{
  static String globalData="default";
  static String userName="UUuu";
  static List<UserCredentials> allUsers=[];
  static String loggedUser = "";
  static bool loggedIn = false;

  static List<PokemonCredentials> allPokemons=[];

}

//log out
void loggedOut(BuildContext context){
    SharedData.loggedIn = false;
   SharedData.loggedUser = "";
     Navigator.pushNamed(context, "/login");
}

//button login comfirm

void loggedInBtnFunc(buttonNav,BuildContext context){



    if(SharedData.loggedIn){
    buttonNav == "creation" ?  Navigator.pushNamed(context, "/pokemoncreation") : 
    buttonNav == "pokedex" ?  Navigator.pushNamed(context, "/pokedex") :
    '';
     } 
     else{
         ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login to your account first!"),
          backgroundColor: const Color.fromARGB(255, 235, 8, 8),
        ),
      );
     }    


}
