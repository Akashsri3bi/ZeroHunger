import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String userName = '';
String userSurname = '';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<User?> signIn(String email, String password) async {
    var user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    getData();
    return user.user;
  }

  signOut() async {
    return await auth.signOut();
  }

  Future<User?> register(
      String name, String surname, String email, String password) async {
    var user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    user.user!.updateDisplayName(name);
    await firestore.collection('Person').doc(user.user?.uid).set({
      'Name': name,
      'Surname': surname,
      'Email': email,
    });
    getData();
    return user.user;
  }

  getData() async {
    //userName = firestore.collection('Person').where(FieldPath.documentId, isEqualTo: user?.uid).get().toString();
    //userSurname = firestore.collection('Person').where(FieldPath.documentId, isEqualTo: user?.uid).get().toString();
  }
}
