import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: LogIn(),

  ));
  
}
class LogIn extends StatefulWidget {

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();


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
               Text('Log in', style: 
               TextStyle(
                 color:Colors.white,
                 fontWeight:FontWeight.bold,
                 fontFamily: 'Rubik',
                 fontSize: 40)
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
                   child: Text('Log in'))
             ],) ,
         )

          
          
    );
  }
}