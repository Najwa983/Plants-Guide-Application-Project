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
    
            
            
             ),
             ),
<<<<<<< HEAD
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
            
            
=======
           
              ],
          ),
          
        Column(
          mainAxisAlignment: MainAxisAlignment.values.first,
          crossAxisAlignment: CrossAxisAlignment.stretch ,
           children:[
    //     
          Consumer<ApplicationState>(
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
         
        ]
        ),
>>>>>>> 7577cb0781f894f63c29d85e4728e1b98c2a0c2e
                
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
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}

// class FireStoreService extends ChangeNotifier {
//     FireStoreService();
//     static Future<dynamic> loadImage(BuildContext context,String Image) async{
//       return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
//     }
// }

class UserInformation extends StatefulWidget {
  @override
    _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Plant').snapshots();

  get index => null;
  


  
  // var url =  ref.getDownloadURL() as String;

  // static get ref => null;
  // final ref = FirebaseStorage.instance.ref().child('1');
// no need of the file extension, the name will do fine.
// ignore: unnecessary_cast
// var url = await ref.getDownloadURL() as String;
// print(url);


  


  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return Container(
               padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                border: index == 0
                    ? Border() // This will create no border for the first item
                    : Border(
                        top: BorderSide(
                            width: 2,
                            color: Theme.of(context)
                                .primaryColor)), // This will create top borders for the rest
              ),
              child: ListTile(
                // autofocus: true,
                tileColor: Colors.green[200],
                // selected: true,
                // isThreeLine: true,
                title: 
                  
                    Column(
                      children: [
                        Text('${data['الإسم بالعربية']}'),
                        Image.network('${data['imageURL']}', 
                        width: 100,
                        height: 100,
                        ),
                         
                        // Image.network( downloadURL),
                        // Image.network(_downloadUrl)
                        
                      
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
        backgroundColor: Colors.lightGreen[300],
        body:
                     
                            
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             textDirection: TextDirection.rtl,
                             children: [
                              Text('${data['الإسم بالعربية']}',style:
                               TextStyle(
                                 color: Colors.black,
                                 fontSize: 20,

                                 ),
                               ),
                              Text('${data['الإسم بالأمازيغية']}',style:
                               TextStyle(
                                 color: Colors.black,
                                 fontSize: 10,

                                 ),),
                              Text('${data['الاسم العلمي']}',style:
                               TextStyle(
                                 color: Colors.black,
                                 fontSize: 20,

                                 ),),
                              Text('${data['العائلة التي تنتمي إليها']}',style:
                               TextStyle(
                                 color: Colors.black,
                                 fontSize: 10,

                                 ),),
                              Text('${data['نوع النبتة ']} ',style:
                               TextStyle(
                                 color: Colors.black,
                                 fontSize: 10,

                                 ),),
                              Text('${data['مزايا']} ',style:
                               TextStyle(
                                 color: Colors.black,
                                 fontSize: 10,

                                 ),),



                             ],
                           ),
     ),
                      ),

                           
                         
                      
                      
                       
                     

    
                      
                     
                      
                      
        // State > {
        //                 @override
        //                 Widget build(BuildContext context) {
        //                   return Container(
                            
        //                   );
        //                 }
        //               } {
                        
        //               }
                      
                      ));
                    },
                    // Image(image:data['image'])
                  
                
                // subtitle: Text(data['company']),
              ),
              
            );
          }).toList(),
        )
        ;
      },
    );
  }
}

 
//  // ignore: camel_case_types
//  class readData  extends StatelessWidget {
//   get index => null;

 
 
//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//         body:StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance.collection("Plant").snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//             if(!snapshot.hasData){
//               return Text('No data found ..');
//             }else{
//               return 
//           //       Expanded(
//           //         child: SizedBox(
//           //           height:100.0,
//           //           child: ListView.builder(
//           //           scrollDirection: Axis.vertical,
//           //           physics: ScrollPhysics(),
//           //           padding: EdgeInsets.only(top: 24),
//           //           itemCount: snapshot.data!.docs.length,
//           //           shrinkWrap: true,
//           //           itemBuilder: (context, index) {
//           //             var temp = snapshot.data!.docs[index];
//           //             return Text('${temp['الإسم بالعربية']}');
//           //           },
//           //                         ),
//           //         ),
//           //       )
              
//           //     ;
//           //   }

//           // }

//           // ),
          
       
     
//    }
//  }  
//   // FirebaseFirestore.instance.collection("Plant").get().then((querySnapshot) {
  //   querySnapshot.docs.forEach((result) {
  //     print(result.data());
  //   });
  // });body: new StreamBuilder(
    // ignore: unused_label
   
    
 

 

// ignore: camel_case_types
// class readData extends StatelessWidget {
  
//   final String documentId;
//   readData(this.documentId);


  

   
      
      // future: plants.doc(documentId).get(),
      

        
            // var id = int.parse(documentId);
           
          // Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          // for(id=1;id<6;id++){
          
           
      //   
      //   ?HeadingItem('${data['الإسم بالعربية']}'):
      //   BodyItem( '${data['الإسم بالأمازيغية']} ${data['الاسم العلمي']}  ${data['العائلة التي تنتمي إليها']} ${data['نوع النبتة ']} ')
      //       // ? HeadingItem('Heading $i')
            // : MessageItem('Sender $i', 'Message body $i'),
      
         
        


        
          
      
    
