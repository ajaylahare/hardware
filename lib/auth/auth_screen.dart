import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
 import 'package:cloud_firestore/cloud_firestore.dart';


class AuthScreen extends StatefulWidget {
  
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var _isloading =false;
   final  _auth = FirebaseAuth.instance;
  void _submitauthform(
    String email,
    String username,
    String password,
    bool islogin,
    BuildContext ctx,
  ) async {
          AuthResult authResult;
    try {
      
      setState(() {
        var _isloading =true;
      });
      if (islogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
         
            
            
             await Firestore.instance.collection('users').document(authResult.user.uid).setData(
               {
                 'username':username,
                 'email':email,
                 
                 
               }
             );
      }
     
    } on PlatformException catch (err) {
      var message = 'an error occured pls check urs credentials';
      if (err.message != null) message = err.message;

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
     setState(() {
        var _isloading =false;
      });
    }
    catch(error)
    {
      print(error);
      setState(() {
        var _isloading =false;
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitauthform,_isloading),
    );
  }
}
