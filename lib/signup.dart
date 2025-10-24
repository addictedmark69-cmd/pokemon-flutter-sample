import 'package:flutter/material.dart';
import 'modules/globals.dart';
import 'models/users.dart'; // Add this import

class SignupPage extends StatefulWidget{

  const SignupPage({super.key});

   @override
  State<SignupPage> createState()=>MySignupActivity(); 
}

class MySignupActivity extends State<SignupPage>{


final tfFullname = TextEditingController();
final tfUsername = TextEditingController();
final tfBirthday = TextEditingController();
final tfEmail = TextEditingController();
final tfPassword = TextEditingController();
final tfRetypepass = TextEditingController();

String FullnameInfo = "";
String UsernameInfo = "";
String BirthdayInfo = "";
String EmailInfo = "";
String PasswordInfo = "";
String RetypepassInfo = "";

//functions-----------


// add account
addAccount(){
  setState(() {

    FullnameInfo = tfFullname.text;
    UsernameInfo = tfUsername.text;
    BirthdayInfo = tfBirthday.text;
    EmailInfo = tfEmail.text;
    PasswordInfo = tfPassword.text;
    RetypepassInfo = tfRetypepass.text;

  if (tfPassword.text != tfRetypepass.text) {
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password Not matched!"),
          backgroundColor: const Color.fromARGB(255, 235, 8, 8),
        ),
      );
    return;
  }

  if(
    FullnameInfo == "" ||
    UsernameInfo == "" ||
    BirthdayInfo == "" ||
    EmailInfo == "" ||
    PasswordInfo == "" ||
    RetypepassInfo == ""
  ){
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Fill all required fields!"),
          backgroundColor: const Color.fromARGB(255, 235, 8, 8),
        ),
      );
    return;
  }

    if(
    FullnameInfo.length < 3 ||
    UsernameInfo.length < 3 ||
    BirthdayInfo.length < 3 ||
    EmailInfo.length < 3 ||
    PasswordInfo.length < 3 ||
    RetypepassInfo.length < 3
  ){
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Fill up the feilds that are less tah 3 characters!"),
          backgroundColor: const Color.fromARGB(255, 235, 8, 8),
        ),
      );
    return;
  }

UserCredentials newUser = UserCredentials(
  fullname: FullnameInfo, 
  username: UsernameInfo,
   birthday: BirthdayInfo, 
   email: EmailInfo, 
   password: PasswordInfo);


   SharedData.allUsers.add(newUser);

  tfFullname.clear();
  tfUsername.clear();
  tfBirthday.clear();
  tfEmail.clear();
  tfPassword.clear();
  tfRetypepass.clear();

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Account Added!"),
          backgroundColor: const Color.fromARGB(255, 8, 235, 46),
        ),
      );
    
  });
}

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Signup",style: TextStyle(
          color: Colors.white60,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
        backgroundColor: Colors.cyan,
        
      ),

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,

          children: [
            Text("Signup Page"),

            TextField(
              // keyboardType: TextInputType.number,
              controller: tfFullname,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Enter your fullname here!",
                labelText: "fullname",
                suffix: IconButton(onPressed: (){tfFullname.clear();}, icon: Icon(Icons.clear)) 
              ),
           ),

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
              controller: tfBirthday,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Enter your birthday here!",
                labelText: "birthday",
                suffix: IconButton(onPressed: (){tfBirthday.clear();}, icon: Icon(Icons.clear)) 
              ),
           ),

            TextField(
              // keyboardType: TextInputType.number,
              controller: tfEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Enter your Email here!",
                labelText: "Email",
                suffix: IconButton(onPressed: (){tfEmail.clear();}, icon: Icon(Icons.clear)) 
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

            TextField(
              // keyboardType: TextInputType.number,
              controller: tfRetypepass,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Enter your retype pass here!",
                labelText: "Re type password",
                suffix: IconButton(onPressed: (){tfRetypepass.clear();}, icon: Icon(Icons.clear)) 
              ),
           ),


           
            MaterialButton(onPressed: (){addAccount();},
            color: const Color.fromARGB(255, 18, 201, 201),
            minWidth: double.infinity,
            child: Text("Add Account"),
            ),

            MaterialButton(onPressed: (){ Navigator.pushNamed(context, "/login");},
            color: const Color.fromARGB(255, 18, 201, 201),
            minWidth: double.infinity,
            child: Text("Go to Login"),
            ),

          ],
        ),
      ),
      
    );
  }
}