import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: SignUp(),

  ));
  
}
class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _usernameTextController = TextEditingController();


  //double _formProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new,
          size: 20,
          color: Colors.black,),
          ),
          ),
          body:
         Form(
           child:Column(
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               //LinearProgressIndicator(value:_formProgress),
               Text('Sign up', style: 
               TextStyle(
                 color:Colors.white,
                 fontWeight:FontWeight.bold,
                 fontFamily: 'Rubik',
                 fontSize: 40)
                 ),
                 Padding(
                   padding: EdgeInsets.all(8.0),
                   child: TextFormField(
                     controller: _firstNameTextController,
                     decoration:InputDecoration(hintText: 'First name'
                     ),
                   )


                 ),
                 Padding(
                   padding: EdgeInsets.all(8.0),
                   child: TextFormField(
                     controller: _lastNameTextController,
                     decoration:InputDecoration(hintText: 'Last name'
                     ),
                   )


                 ),

                  Padding(
                   padding: EdgeInsets.all(8.0),
                   child: TextFormField(
                     controller: _usernameTextController,
                     decoration:InputDecoration(hintText: 'Username'
                     ),
                   )


                 ),
                 Padding(
                   padding: EdgeInsets.all(8.0),
                   child: TextFormField(
                     controller: _passwordTextController,
                     decoration:InputDecoration(hintText: 'Password'
                     ),
                   )


                 ),
                 ElevatedButton(
                   style: ButtonStyle(
                     backgroundColor:  MaterialStateProperty.all(Colors.green[400]),
                     fixedSize:  MaterialStateProperty.all(Size(180, 40)),
                   ),
                   onPressed: (){}, 
                   child: Text('Register'))
             ],) ,
         )

          
          
    );

    
  }
}