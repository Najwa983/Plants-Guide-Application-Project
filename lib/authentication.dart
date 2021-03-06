import 'package:flutter/material.dart';
import 'package:internship_app/home_page.dart';
import 'package:internship_app/log_in.dart';
import 'package:internship_app/main.dart';

import 'widgets.dart';
import 'home_page.dart';

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
  @override
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
                
                  child: const Text('?????? ????????'),
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
          ) {
            widget.registerAccount(
                email,
                displayName,
                password,
                (e) =>
                    _showErrorDialog(context, 'Failed to create account', e));
          },
        );
      case ApplicationLoginState.loggedIn:
        return Row(
          children: [
            
            Padding(
              padding: const EdgeInsets.fromLTRB(130, 10, 10, 0),
              child: ElevatedButton(
                onPressed: () {
                  widget.signOut();
                },
                style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green[400]),
              fixedSize: MaterialStateProperty.all(Size(160,40),),
              textStyle: MaterialStateProperty.all(TextStyle(color: Colors.greenAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
    
              ),),
               ),
               child: const Text('?????????? ????????????'),

               
              ),
            ),
          ],
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
                '????????',
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
        const Header('?????????? ???????????? ?????????????? ????????????????????'),
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
                      hintText: '???????? ?????????? ????????????????????',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '???????? ?????????? ?????????? ???????????????????? ????????????????';
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
                        child: const Text('????????????'),
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
        const Header('?????????? ????????'),
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
                      hintText: '???????? ?????????? ????????????????????',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '???????? ?????????? ?????????? ???????????????????? ????????????????';
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
                      hintText: '?????????? ??????????????',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '???????? ?????? ??????????';
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
                      hintText: '???????? ????????????',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '???????? ???????? ????????????';
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
                        child: const Text('??????????'),
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
                        child: const Text('??????'),
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
        const Header('?????????? ????????????'),
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
                      hintText: '???????? ?????????? ????????????????????',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '???????? ?????????? ???????????????????? ????????????????';
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
                      hintText: '???????? ????????????',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '???????? ???????? ????????????';
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
                        child: const Text('?????????? ????????????'),
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
