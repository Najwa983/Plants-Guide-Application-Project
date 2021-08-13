// import 'dart:developer';

// import 'dart:ffi';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

// import 'package:firebase_firestore/firebase_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


// import 'package:firebase_core/firebase_core.dart'; // new
import 'package:firebase_auth/firebase_auth.dart'; //
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:internship_app/log_in.dart';
import 'package:internship_app/plantList.dart';
import 'package:internship_app/searchWidget.dart';
import 'package:internship_app/user.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:internship_app/log_in.dart';
// import 'package:internship_app/plantList.dart';

import 'package:provider/provider.dart';           // new

import 'authentication.dart';                  // new
// import 'read_data.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => Home(),
    ),
  );
}

class Home extends StatelessWidget{
  // This widget is the root of your application.
  @override
  // _HomeState createState() => _HomeState();


// classHome extends State<Home> {
//   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.green[200],
            ),
        primarySwatch: Colors.green,
        fontFamily: 'Amiri' ,
        
        ),
     home: Scaffold(
        backgroundColor: Colors.lightGreen[100],
        
       
        // appBar:AppBar(
        //   title:
        //   Text('دليلك النباتي',
        //   style:TextStyle( 
        //   fontSize:30,
        //   fontFamily:  'Rubik',
        //   ),
          
          
        //   ),
          
          
          
        //   centerTitle: true,
        //   backgroundColor: Colors.green[800],
        //   ) ,
          
          body:SafeArea(
            child:Container(
              width: double.infinity,
              //height: MediaQuery.of(context).size.height,
              child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
    
            children: [
//               ReadMoreText(
//   'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
//   trimLines: 2,
//   colorClickableText: Colors.pink,
//   trimMode: TrimMode.Line,
//   trimCollapsedText: 'Show more',
//   trimExpandedText: 'Show less',
//   moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
// ),
              
          //   Container(
          //     child: Text('Votre guide des plantes', 
          //         textAlign:TextAlign.center,
          //         style: TextStyle(
          //           color:Colors.green[300],
          //           fontSize: 20,
          //           //fontWeight: FontWeight.bold,
          //           //fontStyle: FontStyle.italic,
          //           fontFamily: 'OtomanopeeOne',
    
            
          //   //fontFamily:'NotoSansJP-Medium',
          //    ),
          //    ),
             
          //     padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          // ),
    
          
            Column(
              children:[
              Text('دليل النبات الخاص بك', 
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
            // //  Image.asset('assets/logo.jpg',fit: BoxFit.cover),
            // //   // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          
              ],
          ),
          
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.values.first,
        //   crossAxisAlignment: CrossAxisAlignment.stretch ,
        //    children:[
    //       Container(
    //         child:Text('Cette application est le fruit d\'un travail qui a commencé depuis 2011, après la collecte des informations et maintenant on a arrivé au stade de la réalisation de cette app qui va vous aider à identifier un certain nombre des plantes les plus utilisées au Maroc...Bienvenue!',
    //                 textAlign:TextAlign.left ,
    //                 style: TextStyle(
    //                   fontSize: 17,
    //                   fontFamily: 'STIX',
    // ),
    // ),
    //         padding:EdgeInsets.fromLTRB(0, 0, 0, 10),
    
    //       ),
    //       Container(
    //         child:Text('هذا التطبيق هو نتاج عمل بدأ عام 2011. بعد جمع المعلومات ،الآن جاءت فرصة برمجته. دون ادنى شك،هذا  التطبيق  سيساعدك على تحديد معلومات مفيدة حول عدد مهم من النباتات الأكثر استخدامًا في المغرب ...مرحبا!',
    //                 textAlign:TextAlign.right ,
    //                 textDirection: TextDirection.rtl,
    //               style: TextStyle(
    //                 fontSize:20,
    //                 fontFamily: 'Mirza',
    // ),
    // ),
    //         padding:EdgeInsets.fromLTRB(0, 0, 0, 60),
    
    //       ),
          Expanded(

            child:SizedBox(
              height: 200.0,
              child: Consumer<ApplicationState>(
                
                  builder: (context, appState, _) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  ),
                ),
            ),
          ),
          // Future widget _getImage(BuildContext context,String imageName) async {
          //                 Image image;
          //                 await FireStoreageService.loadImage(context, imageName).then((value){
          //                   image = Image.network(
          //                   value.toString(),
          //                   fit: BoxFit.scaleDown,);
          //                 });

          //               }
            
           
          //   IconButton(
          // onPressed: (){
          //   Navigator.pop(context);
          // },
          // icon: Icon(Icons.arrow_back_ios_new,
          // size: 20,
          // color: Colors.black,),
          // ),
        // ]
        // ),
                 
          // ElevatedButton(
          //   onPressed: (){
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => LogIn())
          //     );
          //   }, 
          //   child: IconButton(
          // onPressed: (){
          //   Navigator.pop(context);
          // },
          // icon: Icon(Icons.arrow_back_ios_new,
          // size: 20,
          // color: Colors.black,),
          // ),
    
          //   ),
          //   ElevatedButton(
          //    onPressed: (){
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) =>SignUp())
          //     );
          //   },  
          //   child: const Text('Sign up'),
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(Colors.green[200]),
          //     fixedSize: MaterialStateProperty.all(Size(150,40),),
          //     textStyle: MaterialStateProperty.all(TextStyle(color: Colors.lightBlue,
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //     fontStyle: FontStyle.italic
          //     )),
    
          //     )
    
    
          //   ),
            
            
                
                 
                  
                 
    
              
    
          ],
          ) ,
          )
          )
      ),
    );
   
    
  
  }
}


class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  Future<void> init() async {
    await Firebase.initializeApp();

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
      } else {
        _loginState = ApplicationLoginState.loggedOut;
      }
      notifyListeners();
    });
  }

  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  ApplicationLoginState get loginState => _loginState;

  String? _email;
  String? get email => _email;

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  void registerAccount(String email, String displayName, String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // ignore: deprecated_member_use
      await credential.user!.updateProfile(displayName: displayName);
      userSetup(displayName, email);

    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}




  // Widget signOut() {
  //   return Row(
  //         children: [
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [ 
  //               Container(
  //           decoration: new BoxDecoration(
  //             shape: BoxShape.circle
  //           ),
  //           child: Image(
  //             image: AssetImage('assets/plant.jpg'),
  //             width: 300,
  //             height: 300,
  //             fit: BoxFit.fitWidth,
              
              
    
  //             ),
  //             padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
            
  //         ),
  //               Padding(
  //               padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
  //               child: ElevatedButton(
  //                 onPressed: () {
  //                   signOut();
  //                 },
  //                 style: ButtonStyle(
  //               backgroundColor: MaterialStateProperty.all(Colors.green[400]),
  //               fixedSize: MaterialStateProperty.all(Size(150,40),),
  //               textStyle: MaterialStateProperty.all(TextStyle(color: Colors.green[400],
  //               fontSize: 20,
  //               fontWeight: FontWeight.bold,
  //               fontStyle: FontStyle.italic
                
  //               )),
                
  //               ),
                
  //                 child: const Text('سجل الان'),
  //               ),
  //             ),
              
  //             ],
  //           ),
  //         ]
  //       );
  // }
  class PlantInformation extends StatefulWidget {
  @override
    _PlantInformationState createState() => _PlantInformationState();

}


class _PlantInformationState extends State<PlantInformation> {
  final Stream<QuerySnapshot> _plantsStream = FirebaseFirestore.instance.collection('Plant').snapshots();
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Users').snapshots();


  get index => null;
  


  


  


  Widget build(BuildContext context) {
    // Container( child:SearchWidget());
    return StreamBuilder<QuerySnapshot>(
      stream: _plantsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text("Loading"));
        }

        return Scaffold(

          body: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              return Container(
                 padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  border: index == 0
                      ? Border() // This will create no border for the first item
                      : Border(
                          top: BorderSide(
                              width: 0,
                              color: Theme.of(context)
                                  .bottomAppBarColor)), // This will create top borders for the rest
                ),
                child: ListTile(
                
                 
                  // autofocus: true,
                  tileColor: Colors.green[200],
                  // selected: true,
                  // isThreeLine: true,
                  title: 
                    
                      Column(
                        children: [
                          Text('${data['الإسم بالعربية']}',textAlign: TextAlign.center),
                          Image.network('${data['imageURL']}', 
                          width: 100,
                          height: 100,
                          ),
                           
                          
                        
                        ],
                      ),
        
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        MaterialApp(
              theme: ThemeData(
          buttonTheme: Theme.of(context).buttonTheme.copyWith(
                highlightColor: Colors.green[400],
              ),
          primarySwatch: Colors.green,
          fontFamily: 'Amiri' ,
          
          ),
             home: Scaffold(
               appBar: AppBar(
          //  backgroundColor: Colors.black26,
           
          title:Text('${data['الإسم بالعربية']}', textAlign: TextAlign.center,),
          ),
          
          backgroundColor: Colors.green[200],
          body:
                       
                              
                      ListView(
                        children:[ Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 textDirection: TextDirection.rtl,
                                 children: [
                                  Text('الإسم بالعربية:${data['الإسم بالعربية']}',style:
                                   TextStyle(
                                     color: Colors.black,
                                     fontSize: 20,
                      
                                     ),textAlign: TextAlign.center 
                                   ),
                                   Image.network('${data['imageURL']}',
                                   width: 300,
                                   height: 300,
                                   ),
                                  Text('الإسم بالأمازيغية:${data['الإسم بالأمازيغية']}',style:
                                   TextStyle(
                                     color: Colors.black,
                                     fontSize: 10,
                      
                                     ),
                                     textAlign: TextAlign.center),
                                  Text('${data['الاسم العلمي']} الاسم العلمي',style:
                                   TextStyle(
                                     color: Colors.black,
                                     fontSize: 20,
                      
                                     ),
                                     textAlign: TextAlign.center),
                                  Text('${data['العائلة التي تنتمي إليها']} العائلة التي تنتمي إليها',style:
                                   TextStyle(
                                     color: Colors.black,
                                     fontSize: 10,
                      
                                     ),
                                     textAlign: TextAlign.center),
                                  Text('${data['نوع النبتة ']} نوع النبتة',style:
                                   TextStyle(
                                     color: Colors.black,
                                     fontSize: 10,
                      
                                     ),
                                      textAlign: TextAlign.center),
                                      
                                  Column(
                                    children: [
                                      Text( 'المزايا والإستعمالات '),
                                      Text('${data['مزايا']} ',style:
                                       TextStyle(
                                         color: Colors.black,
                                         fontSize: 10,
                      
                                         ),
                                         textAlign: TextAlign.end),
                                    ],
                                  ),
                                  //                      Padding(
                                  //   padding: const EdgeInsets.fromLTRB(130, 10, 10, 0),
                                  //   child: ElevatedButton(
                                  //         onPressed: () {
                                  //           widget.signOut();
                                  //         },
                                  //         style: ButtonStyle(
                                  //   backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                                  //   fixedSize: MaterialStateProperty.all(Size(160,40),),
                                  //   textStyle: MaterialStateProperty.all(TextStyle(color: Colors.greenAccent,
                                  //   fontSize: 20,
                                  //   fontWeight: FontWeight.bold,
                                  //   fontStyle: FontStyle.italic
                          
                                  //   ),),
                                  //        ),
                                  //        child: const Text('تسجيل الخروج'),
                      
                                         
                                  //   ),
                                  // ),
                      
                      
                      
                                 ],
                               ),
                        ]
                      ),
                             
                             
             ),
                        ),
        
                             
                           
                        
                        
                         
                       
        
            
                        
                       
                        
                        
          
           
                        
                        ));
                      },
                     
                    
                  
                ),
                
              );
            }).toList(),
          ),
        )
        ;
      },
    );
    // Padding(
    //           padding: const EdgeInsets.fromLTRB(130, 10, 10, 0),
    //           child: ElevatedButton(
    //                 onPressed: () {
                      
    //                 },
    //                 style: ButtonStyle(
    //           backgroundColor: MaterialStateProperty.all(Colors.green[400]),
    //           fixedSize: MaterialStateProperty.all(Size(160,40),),
    //           textStyle: MaterialStateProperty.all(TextStyle(color: Colors.greenAccent,
    //           fontSize: 20,
    //           fontWeight: FontWeight.bold,
    //           fontStyle: FontStyle.italic
    
    //           ),),
    //                ),
    //                child: const Text('تسجيل الخروج'),

                   
    //           ),
    //         );
                       
                     
  }
}

 

 
 
