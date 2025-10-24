import 'package:flutter/material.dart';
import 'package:practice_flutter/main.dart';
import 'modules/globals.dart';
import 'models/users.dart'; 

class PokedexPage extends StatefulWidget{

  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState()=>MyPokedexActivity();

}

class MyPokedexActivity extends State<PokedexPage>{


//functions

//edit modal

void showEditPokemonModal(BuildContext context,String name, String type, String image,int index){
   showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      
final tfpokemonName = TextEditingController(text: name);
final tfpokemonType = TextEditingController(text: type);
final tfimageLink = TextEditingController(text: image);


      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(radius: 40, backgroundImage: NetworkImage(image)),
            SizedBox(height: 20),

            TextField(
            controller: tfpokemonName, 
            decoration: InputDecoration(
            labelText: 'Name',
            hintText:"Enter your Pokemon Name here!",
            suffix: IconButton(onPressed: (){tfpokemonName.clear();}, icon: Icon(Icons.clear)) 
            )),

            TextField(controller: tfpokemonType,
             decoration: InputDecoration(
            labelText: 'Type',
            hintText:"Enter your Pokemon Type here!",
            suffix: IconButton(onPressed: (){tfpokemonType.clear();}, icon: Icon(Icons.clear)) 
            )),

            TextField(controller: tfimageLink, 
            decoration: InputDecoration(
            labelText: 'Image Link',
            hintText:"Enter your Image Link here!",
            suffix: IconButton(onPressed: (){tfimageLink.clear();}, icon: Icon(Icons.clear)) 
            )),

            SizedBox(height: 20),
            Row(
              children: [
                 ElevatedButton(
              onPressed: () {
                try{
                setState(() {
                
                  //get data from the textfield
                  String pokenameHold = tfpokemonName.text;
                  String poketypeHold = tfpokemonType.text;
                  String imageLinkHold = tfimageLink.text;

                  //Conditions
                  if(poketypeHold.isEmpty && poketypeHold.isEmpty && imageLinkHold.isEmpty){
                     ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                    content: Text("Fill out the required Fields"),
                    backgroundColor: const Color.fromARGB(255, 235, 8, 8),
                 ),
                 );
                    return;
                  }

                  //Edit Data Now
                  SharedData.allPokemons[index]=PokemonCredentials(
                    pokemonname: pokenameHold, 
                    pokemontype: poketypeHold, 
                    imagelink: imageLinkHold
                    );
                });
                }
                catch(e){
                  print("Something's wrong with the edit");
                }
                finally{
                 Navigator.pop(context); //close the modal to all situation
                }
              },
              child: Text('Save Changes'),
            ),
             ElevatedButton(
              onPressed: () {
              Navigator.pop(context);
              },
              child: Text('Cancel Edit'),
            ),
              ],
            ),
           
            SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}

//style pokemon loop

Widget styleListPokemon(String name, String type, String image,int index) {
  return Container(  // ✅ Just return Container, no Expanded
    width: 400,
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
            Text(type),
            
          ],
        ),
         MaterialButton(onPressed: (){showEditPokemonModal(context,name,type,image,index);},
            color: const Color.fromARGB(255, 18, 201, 201),
            minWidth: 50,
            child: Text("Edit pokemon"),
            ),
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
      SharedData.allPokemons[i].imagelink,
      i
      ),
      
  ]
  );
}
  @override
  Widget build(BuildContext context){

  SharedData.allPokemons.sort((a,b)=>a.pokemonname.compareTo(b.pokemonname)); //sort pokemon to A-Z first

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