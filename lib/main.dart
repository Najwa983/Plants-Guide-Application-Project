// import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart'; // new
import 'package:firebase_auth/firebase_auth.dart'; //
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_app/log_in.dart';

import 'package:provider/provider.dart';           // new

import 'authentication.dart';                  // new




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
            //  Image.asset('assets/logo.jpg',fit: BoxFit.cover),
            //   // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          
              ],
          ),
          
        Column(
          mainAxisAlignment: MainAxisAlignment.values.first,
          crossAxisAlignment: CrossAxisAlignment.stretch ,
           children:[
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
          //   IconButton(
          // onPressed: (){
          //   Navigator.pop(context);
          // },
          // icon: Icon(Icons.arrow_back_ios_new,
          // size: 20,
          // color: Colors.black,),
          // ),
        ]
        ),
                 
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
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
