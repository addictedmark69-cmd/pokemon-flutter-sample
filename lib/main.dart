import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';
import 'pokemoncreate.dart';
import 'pokedex.dart';
main(){
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget{
  //constructor 
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        "/signup":(context)=>SignupPage(),
        "/login":(context)=>LoginPage(),
        "/pokemoncreation":(context)=>PokemonCreatePage(),
        "/pokedex":(context)=>PokedexPage()
        },
      home: SignupPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//tf holder

final tfFullname = TextEditingController();
final tfUsername = TextEditingController();
final tfBirthday = TextEditingController();
final tfEmail = TextEditingController();
final tfPassword = TextEditingController();
final tfRetypepass = TextEditingController();


List<String> pokemonName=["pikachu","raichu","meowth","charmander","pikachu"];
//pokemonName[0]
Set<String> pokemonElements={"fire","leaf ","water","earth"};
//pokemonElements.elementAt(0)
List<Text> theseareTexts=[Text("wew"),Text("wow")];

var imagecard= Container(
    width: 70,
    height: 70,
    color: Colors.blue,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.time_to_leave),
        Text("label")
      ],
    ),
);





// cImageCard(label,selicon,bgcolor,status){

//   if(status=="Inactive")
//   {
//     bgcolor=Colors.black;

//   }
//   bgcolor=(status=="Inactive")?Colors.black:bgcolor;

//   return 
//   Expanded(
//     flex: 1,
//     child: Container(
//           width: 70,
//           height: 70,
//           color: bgcolor,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(selicon),
//               Text(label)
//             ],
//           )
//   )
//   );
// }

// counterLoop(){
//   for(int i=0;i<4;i++)
//   {
//     print("Hello");
//   }
// }

// createRow(numofImageCard){

//   return Row(
//     spacing: 5,
//     children: [
//       for(int i=0;i<numofImageCard;i++)
//       cImageCard(pokemonElements.elementAt(i), Icons.ac_unit_rounded, Colors.amber, "Active"),
//      Text("INF225_SIM8_Nieva_Mark_fgrh6sh4HnsPtyUfm225"),
//     ],
//     );

// }



class MyHomePage extends StatelessWidget{
  //constructor 
  const MyHomePage({super.key});

//functions

addAccount(){

}
  

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My First App",style: TextStyle(
          color: Colors.white60,
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(onPressed: (){Navigator.pushReplacementNamed(context, "/profile",arguments: {"theMessage":"Hello There"});}, icon: Icon(Icons.adb_rounded,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.login)),
          IconButton(onPressed: (){}, icon: Icon(Icons.logout)),
          
        ],
      ),
    body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [


            // createRow(4),
            // createRow(3),
            // createRow(2),
            // // Text("${pokemonName[0]} - first pokemon"),
            // // Text("${pokemonElements.elementAt(0)} - first pokemon"),
            // for(int i=0;i<theseareTexts.length;i++)
            // theseareTexts[i]
          ],
        ),
    ),
    floatingActionButton: FloatingActionButton(onPressed: (){}),
    bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(label: "Home",icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "Contact",icon: Icon(Icons.contact_phone)),
        BottomNavigationBarItem(label: "Location",icon: Icon(Icons.location_city)),
    ],
      ),
    );
  }
}