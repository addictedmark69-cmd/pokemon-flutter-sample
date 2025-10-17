import 'package:flutter/material.dart';
import 'modules/globals.dart';
import 'models/users.dart'; 

class PokemonCreatePage extends StatefulWidget{

  const PokemonCreatePage({super.key});

  @override
  State<PokemonCreatePage> createState()=>MyPokemonCreateActivity();

}

class MyPokemonCreateActivity extends State<PokemonCreatePage>{

final tfpokemonName = TextEditingController();
final tfpokemonType = TextEditingController();
final tfimageLink = TextEditingController();

String pokenameInfo = "";
String poketypeInfo = "";
String pokeimagelinkInfo = "";

//functions

addPokemon(){

  setState(() {

    pokenameInfo = tfpokemonName.text;
    poketypeInfo = tfpokemonType.text;
    pokeimagelinkInfo = tfimageLink.text;

    PokemonCredentials newPokemon = PokemonCredentials(
      pokemonname: pokenameInfo, 
      pokemontype: poketypeInfo, 
      imagelink: pokeimagelinkInfo);

    SharedData.allPokemons.add(newPokemon);
    
    tfpokemonName.clear();
    tfpokemonType.clear();
    tfimageLink.clear();

     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Pokemon Added"),
          backgroundColor: const Color.fromARGB(255, 10, 248, 70),
        ),
      );
  });
  
}

  @override
  Widget build(BuildContext context) {

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [

            Text("Pokemon Creation Page"),
            //pokemon tf
             TextField(
              controller: tfpokemonName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Enter your pokemon name here!",
                labelText: "Pokemon name",
                suffix: IconButton(onPressed: (){tfpokemonName.clear();}, icon: Icon(Icons.clear)) 
              ),
           ),

              TextField(
            controller: tfpokemonType,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Enter your pokemon type here!",
                labelText: "Pokemon type",
                suffix: IconButton(onPressed: (){tfpokemonType.clear();}, icon: Icon(Icons.clear)) 
              ),
           ),

              TextField(
              controller: tfimageLink,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Enter your image link here!",
                labelText: "Image link",
                suffix: IconButton(onPressed: (){tfimageLink.clear();}, icon: Icon(Icons.clear)) 
              ),
           ),

           MaterialButton(onPressed: (){addPokemon();},
           color:Colors.blue,
           minWidth: double.infinity,
           child: Text("Add pokemon"),
           ),

           Text("Recently AddedPokemon"),

     pokenameInfo.isNotEmpty ? 
           Container(
            width: 300,
            height: 100,
            color: const Color.fromARGB(255, 153, 171, 185),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [

                CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(pokeimagelinkInfo), // Use AssetImage('assets/profile.jpg') for local images
                backgroundColor: Colors.grey[300],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text("$pokenameInfo"),
                  Text("$poketypeInfo")
                ],
              )
              ],
            ),
           )
           :

           Text("Put atleast one pokemon",style:TextStyle(
          color: const Color.fromARGB(153, 0, 0, 0),
          fontSize: 30,
          fontWeight: FontWeight.bold,
          ),)

          ],
        ),
      ),
    );
  }
}