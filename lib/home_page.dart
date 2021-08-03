import 'package:flutter/material.dart';
import 'main.dart';


void main() {
  runApp(MaterialApp(
    home:HomeNajwa()
  )
  );
}

class HomeNajwa extends StatelessWidget {
  const HomeNajwa({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}