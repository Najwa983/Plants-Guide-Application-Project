import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; 

import 'package:flutter/material.dart';
import 'package:internship_app/home_page.dart';
// import 'package:internship_app/log_in.dart';
import 'package:internship_app/main.dart';
// import 'package:internship_app/plantList.dart';
import 'package:internship_app/searchWidget.dart';

import 'widgets.dart';
import 'home_page.dart';
import 'main.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
}

class Authentication extends StatefulWidget {
  const Authentication({
    required this.loginState,
    required this.email,
    required this.startLoginFlow,
    required this.verifyEmail,
    required this.signInWithEmailAndPassword,
    required this.cancelRegistration,
    required this.registerAccount,
    required this.signOut,
  });

  final ApplicationLoginState loginState;
  final String? email;
  final void Function() startLoginFlow;
  final void Function(
    String email,
    void Function(Exception e) error,
  ) verifyEmail;
  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) signInWithEmailAndPassword;
  final void Function() cancelRegistration;
  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception e) error,
  ) registerAccount;
   
  final void Function() signOut;
 

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  // widgetsFlutterBinding.ensureInitialized();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // late User user;

  // get Firebase => null;
  
  @override
   void initState() {
    super.initState();
    // initUser();
  }

  // initUser() async {
  //   user = _auth.currentUser!;
  //   setState(() {});
  // }
  Widget build(BuildContext context) {
    switch (widget.loginState) {
      case ApplicationLoginState.loggedOut:
        return Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                Container(
            decoration: new BoxDecoration(
              shape: BoxShape.circle
            ),
            child: Image(
              image: AssetImage('assets/plant.jpg'),
              width: 300,
              height: 300,
              fit: BoxFit.fitWidth,
              
              
    
              ),
              padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
            
          ),
                Padding(
                padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    widget.startLoginFlow();
                  },
                  style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green[400]),
                fixedSize: MaterialStateProperty.all(Size(150,40),),
                textStyle: MaterialStateProperty.all(TextStyle(color: Colors.green[400],
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
                
                )),
                
                ),
                
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text('سجل الان  '),
                      Icon(Icons.login)
                    ],
                  ),
                ),
              ),
              
              ],
            ),
          ]
        );
      case ApplicationLoginState.emailAddress:
        return EmailForm(
            callback: (email) => widget.verifyEmail(
                email, (e) => _showErrorDialog(context, 'Invalid email', e)));
      case ApplicationLoginState.password:
        return PasswordForm(
          email: widget.email!,
          login: (email, password) {
            widget.signInWithEmailAndPassword(email, password,
                (e) => _showErrorDialog( context,'Failed to sign in', e));
          },
        );
      case ApplicationLoginState.register:
        return RegisterForm(
          email: widget.email!,
          cancel: () {
            widget.cancelRegistration();
          },
          registerAccount: (
            email,
            displayName,
            password,
          )
          
           {
            widget.registerAccount(
                email,
                displayName,
                password,
                (e) =>
                    _showErrorDialog(context, 'Failed to create account', e));
          },
        );


      case ApplicationLoginState.loggedIn:
            //  final User user = _auth.currentUser!;
      

        return
        //  FutureBuilder(
        // // future: Firebase.initializeApp(),
        // builder:(context, snapshot) {
        //   if (snapshot.hasError) {
        //   return Text('eror');
        // }
        //  if (snapshot.connectionState == ConnectionState.done) {
           Scaffold(
             appBar: AppBar(title:SearchWidget()),

// reset of code
drawer: Drawer(
  elevation: 10.0,
  child: ListView(
    children: <Widget>[
      // UserAccountsDrawerHeader(
      //   // accountName: Text("${user.displayName}"),
      //   // accountEmail: Text("${user.email}"),
      //   decoration: BoxDecoration(
      //     // image: DecorationImage(
      //     //   fit: BoxFit.fill,
      //     //   image: NetworkImage("${user.photoUrl}"),
      //     // ),
      //   ),
      // ),
    ],
  ),
),
             
     
             
           body:
          // Padding(
          //       padding: const EdgeInsets.fromLTRB(130, 0, 0, 0),
          //       child: ElevatedButton(
          //         onPressed: () {
          //           widget();
          //         },
          //         style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all(Colors.green[400]),
          //       fixedSize: MaterialStateProperty.all(Size(150,40),),
          //       textStyle: MaterialStateProperty.all(TextStyle(color: Colors.green[400],
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //       fontStyle: FontStyle.italic
                
          //       )),
                
          //       ),
                
          //         child: const Text('سجل الان'),
          //       ),
          //     ),
              
              
                
                     
                         
                         
                         Container(
                           
                         child: PlantInformation()
                         ),
            floatingActionButton: FloatingActionButton(
              // shape: ShapeBorder.lerp(a, b, t),
              onPressed: () {
                widget.signOut();
              },
              child:Icon(Icons.logout),
              ),
            
                         
                     
              
            
                   
                 
          //     ? HeadingItem('Heading $i')
          //     : MessageItem('Sender $i', 'Message body $i'),
              
        
                         
        
                    
                // Divider(
                //   height: 50,
                //   thickness: 5,
                //   color: Colors.green[700],
                //   // endIndent: 200,
                //   // indent: 70,
        
                // ),
              
              
            
          
           );
         
         

      default:
        return Row(
          children: const [
            Text("Internal error, this shouldn't happen..."),
          ],
        );
    }
  }

  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            StyledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'حسنا',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }
}

class EmailForm extends StatefulWidget {
  const EmailForm({required this.callback});
  final void Function(String email) callback;
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_EmailFormState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header('تسجيل الدخول بالبريد الإلكتروني'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'أدخل بريدك الإلكتروني',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'أدخل عنوان بريدك الإلكتروني للمتابعة';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 30),
                      child: StyledButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            widget.callback(_controller.text);
                          }
                        },
                        child: const Text('التالي'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    required this.registerAccount,
    required this.cancel,
    required this.email,
  });
  final String email;
  final void Function(String email, String displayName, String password)
      registerAccount;
      
  final void Function() cancel;
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header('إنشاء حساب'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'أدخل بريدك الإلكتروني',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'أدخل عنوان بريدك الإلكتروني للمتابعة';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _displayNameController,
                    decoration: const InputDecoration(
                      hintText: 'الاسم بالكامل',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'أدخل اسم حسابك';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'كلمة المرور',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ادخل كلمة المرور';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: widget.cancel,
                        child: const Text('إلغاء'),
                      ),
                      const SizedBox(width: 16),
                      StyledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.registerAccount(
                              _emailController.text,
                              _displayNameController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        child: const Text('حفظ'),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                ),
                
        // brightness: Brightness.light,
      IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>HomeNajwa(),
              ));
          },
          icon: Icon(Icons.arrow_back_ios_new,
          size: 20,
          color: Colors.black,),
          ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordForm extends StatefulWidget {
  const PasswordForm({
    required this.login,
    required this.email,
  });
  final String email;
  final void Function(String email, String password) login;
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header('تسجيل الدخول'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'أدخل بريدك الإلكتروني',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'أدخل بريدك الإلكتروني للمتابعة';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      hintText: 'كلمة المرور',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'ادخل كلمة المرور';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: 16),
                      
                      StyledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.login(
                              _emailController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        child: const Text('تسجيل الدخول'),
                      ),
                      const SizedBox(width: 30),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
// class UserInformation extends StatefulWidget {
//   @override
//     _UserInformationState createState() => _UserInformationState();

// }


// class _UserInformationState extends State<UserInformation> {
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Users').snapshots();

//   get index => null;
  
//   snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> userdata = document.data() as Map<String, dynamic>;})


//   Widget build(BuildContext context) {
//     // Container( child:SearchWidget());
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: Text("Loading"));
//         }

//         return Scaffold(
//         drawer: Drawer(
//           child: 
             
//               // return Container();:
         
          
//         )
//         )
//         );
//       },
//     );
//   }
// }