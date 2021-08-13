import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; 

Future<void> userSetup(String displayName, String email) async {
  CollectionReference users=FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid.toString();
  users.add({
    'displayName': displayName,
    'uid': uid,
    'email':email
  });
  return;

}