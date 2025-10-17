import 'package:flutter/material.dart';
import 'modules/globals.dart';
import 'models/users.dart'; 

class LoginPage extends StatefulWidget{

  const LoginPage({super.key});

  @override
  State<LoginPage> createState()=>MyLoginActivity();
}

class MyLoginActivity extends State<LoginPage>{

final tfUsername = TextEditingController();
final tfPassword = TextEditingController();


//functions


//login acc
loginAccount(){

  setState(() {
    String UsernameInfo = tfUsername.text;
    String PasswordInfo = tfPassword.text;

    for(int i = 0; i<SharedData.allUsers.length; i++ ){

      String unameHold = SharedData.allUsers[i].username;
      String passHold = SharedData.allUsers[i].password;

      //if found
      if(UsernameInfo == unameHold && passHold == PasswordInfo){

       Navigator.pushNamed(context, "/pokemoncreation");
    
      }else{
          ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Incorrect Username or Password!"),
          backgroundColor: const Color.fromARGB(255, 235, 8, 8),
        ),
      );
      }
      SharedData.loggedIn = true;
      SharedData.loggedUser = unameHold;
      tfUsername.clear();
      tfPassword.clear();

    }
  });

}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
          title: Text("Login",style: TextStyle(
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
            Text("Login Page"),

              TextField(
              // keyboardType: TextInputType.number,
              controller: tfUsername,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Enter your username here!",
                labelText: "username",
                suffix: IconButton(onPressed: (){tfUsername.clear();}, icon: Icon(Icons.clear)) 
              ),
           ),

           TextField(
              // keyboardType: TextInputType.number,
              controller: tfPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Enter your password here!",
                labelText: "Password",
                suffix: IconButton(onPressed: (){tfPassword.clear();}, icon: Icon(Icons.clear)) 
              ),
           ),

           MaterialButton(onPressed: (){loginAccount();},
            color: const Color.fromARGB(255, 18, 201, 201),
            minWidth: double.infinity,
            child: Text("LOGIN"),
            ),
             MaterialButton(onPressed: (){Navigator.pushNamed(context, "/signup");},
            color: const Color.fromARGB(255, 18, 201, 201),
            minWidth: double.infinity,
            child: Text("Signup"),
            ),
          ],
        ),
      ),
    );
  }
}