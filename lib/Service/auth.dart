import 'package:chatapp/Components/sharedPreferences.dart';
import 'package:chatapp/Screen/Home_Screen/Screen/homePage.dart';
import 'package:chatapp/Screen/Home_Screen/body.dart';
import 'package:chatapp/Screen/Login_Screen/Body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'database_Service.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

  // login
  Future loginWithUserNameandPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register
  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // call our database service to update the user data.
        await DatabaseService(uid: user.uid).savingUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
//login with google
Future loginwithgoogle(BuildContext context)async{
   GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount!.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
  UserCredential authResult = await firebaseAuth.signInWithCredential(credential);
  if(authResult.additionalUserInfo!.isNewUser){
  await DatabaseService(uid: authResult.user!.uid).savingUserData(authResult.user!.displayName!, authResult.user!.email!);
  await SharedDataFunctions.saveUserLoggedInStatus(
                              true);
                          await SharedDataFunctions.saveUserEmailSF(authResult.user!.email!);
                          await SharedDataFunctions.saveUserNameSF(
                              authResult.user!.displayName!);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
  }else{
     QuerySnapshot snapshot = await DatabaseService(
                                    uid: authResult.user!.uid)
                                .gettingUserData(authResult.user!.email!);
                            await SharedDataFunctions.saveUserLoggedInStatus(
                                true);
                            await SharedDataFunctions.saveUserEmailSF(
                                authResult.user!.email!);
                            await SharedDataFunctions.saveUserNameSF(
                                snapshot.docs[0]['fullName']);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
  }
}
  // signout
  Future signOut(BuildContext context) async {
    try {
      await SharedDataFunctions.saveUserLoggedInStatus(false);
      await SharedDataFunctions.saveUserEmailSF("");
      await SharedDataFunctions.saveUserNameSF("");
      await firebaseAuth.signOut();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => loginScreen(),), (route) => false);
    } catch (e) {
      return null;
    }
  }
}
