// import 'dart:developer';

import 'package:flutter/material.dart';
import '../sign_up.dart';
import '../log_in.dart';


void main() {
  runApp(MaterialApp(
    home:Home()
    ));
}

class Home extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
     
      // appBar:AppBar(
      //   title: Text('GDP',
      //   style:TextStyle( 
      //   fontSize:30,
      //   // fontFamily:  'OtomanopeeOne',
      //   ),
        
        
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.green[800],
      //   ) ,
        
        body:SafeArea(
          child:Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            
          Container(
            child: Text('Votre guide des plantes', 
                textAlign:TextAlign.center,
                style: TextStyle(
                  color:Colors.green[300],
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic,
                  fontFamily: 'OtomanopeeOne',

          
          //fontFamily:'NotoSansJP-Medium',
           ),
           ),
           
            padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
        ),

        Container(
            child: Text('دليل النبات الخاص بك', 
                textAlign:TextAlign.center,
                style: TextStyle(
                  color:Colors.green[300],
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Amiri',

          
          //fontFamily:'NotoSansJP-Medium',
           ),
           ),
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
        ),
        Container(
          decoration: new BoxDecoration(
            shape: BoxShape.circle
          ),
          child: Image(
            image: AssetImage('assets/plant.jpg'),
            width: 300,
            height: 200,
            fit: BoxFit.fitWidth,
            

            ),
          //padding: ,
        ),
      Column(
        mainAxisAlignment: MainAxisAlignment.values.first,
        crossAxisAlignment: CrossAxisAlignment.stretch ,
         children:[
        Container(
          child:Text('Cette application est le fruit d\'un travail qui a commencé depuis 2011, après la collecte des informations et maintenant on a arrivé au stade de la réalisation de cette app qui va vous aider à identifier un certain nombre des plantes les plus utilisées au Maroc...Bienvenue!',
                  textAlign:TextAlign.left ,
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'STIX',
),
),
          padding:EdgeInsets.fromLTRB(0, 0, 0, 10),

        ),
        Container(
          child:Text('هذا التطبيق هو نتاج عمل بدأ عام 2011. بعد جمع المعلومات ،الآن جاءت فرصة برمجته. دون ادنى شك،هذا  التطبيق  سيساعدك على تحديد معلومات مفيدة حول عدد مهم من النباتات الأكثر استخدامًا في المغرب ...مرحبا!',
                  textAlign:TextAlign.right ,
                  textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize:20,
                  fontFamily: 'Mirza',
),
),
          padding:EdgeInsets.fromLTRB(0, 0, 0, 60),

        ),
      ]
      ),
                // ignore: deprecated_member_use
        ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>LogIn())
            );
          }, 
          child: const Text('Log in'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[400]),
            fixedSize: MaterialStateProperty.all(Size(150,40),),
            textStyle: MaterialStateProperty.all(TextStyle(color: Colors.lightBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic

            )),

            )


          ),
          ElevatedButton(
           onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>SignUp())
            );
          },  
          child: const Text('Sign up'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.green[200]),
            fixedSize: MaterialStateProperty.all(Size(150,40),),
            textStyle: MaterialStateProperty.all(TextStyle(color: Colors.lightBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
            )),

            )


          ),
          
          
              
               
                
               

            

        ],
        ) ,
        )
        )
    );
   
    
  
  }
}
