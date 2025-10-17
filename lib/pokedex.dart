import 'package:flutter/material.dart';
import 'modules/globals.dart';
import 'models/users.dart'; 

class PokedexPage extends StatefulWidget{

  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState()=>MyPokedexActivity();

}

class MyPokedexActivity extends State<PokedexPage>{


//functions

//style pokemon loop

Widget styleListPokemon(String name, String type, String image) {
  return Container(  // ✅ Just return Container, no Expanded
    width: 300,
    height: 100,
    margin: EdgeInsets.symmetric(vertical: 5),
    color: const Color.fromARGB(255, 153, 171, 185),
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 30,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(image),
          backgroundColor: Colors.grey[300],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(name),
            Text(type)
          ],
        )
      ],
    ),
  );
}

//create loop pokemon list

createRowPokemon(){
  return Column(

  children: [
    for(int i=0; i<SharedData.allPokemons.length;i++)
    styleListPokemon(
      SharedData.allPokemons[i].pokemonname,
      SharedData.allPokemons[i].pokemontype,
      SharedData.allPokemons[i].imagelink
      )
  ]
  );
}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
          centerTitle: true,
        title: Text("Pokemon Creation",style: TextStyle(
          color: Colors.white60,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
      backgroundColor: Colors.cyan,

        actions: [
          Row(
            spacing: 10,
          children: [

            Text(SharedData.loggedIn ? "Welcome ${SharedData.loggedUser}" : ""),

              Column(

            children: [

           IconButton(onPressed: (){loggedInBtnFunc("creation",context);}, icon: Icon(Icons.catching_pokemon_outlined)),
           Text("Create Pokemon",style: TextStyle(fontSize: 10))
            ],
          ),

          Column(

            children: [

           IconButton(onPressed: (){loggedInBtnFunc("pokedex",context);}, icon: Icon(Icons.book)),
          Text("Pokedex",style: TextStyle(fontSize: 10))

            ],
          ),

          Column(

          children: [

          IconButton(onPressed: (){loggedOut(context);}, icon: Icon(Icons.logout)), 
          Text("Logout",style: TextStyle(fontSize: 10))

            ],
          )

          ]
        
       )
        ],
      ),

      body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("List of pokemons"),
      
          
          createRowPokemon()
      
          ],
        ),
      ),
      )
    );
  }
}