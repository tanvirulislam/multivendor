import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // Function to upload picked image to storage
  _uploadImageToStorage(Uint8List image) async {
    Reference ref =
        _firebaseStorage.ref().child('profiles').child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // FUnction to pick an image from gallery or camera
  Future pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? file = await _imagePicker.pickImage(source: source);
    if (file != null) {
      return file.readAsBytes();
    } else {
      print('No image sellected');
    }
  }

  Future<String> signUpUsers({
    required String fullName,
    required String email,
    required String password,
    required Uint8List? image,
  }) async {
    String res = 'Something is wrong';

    try {
      if (fullName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadImageToStorage(image);
        await _firestore.collection('customers').doc(credential.user!.uid).set({
          'fullName': fullName,
          'email': email,
          'image': downloadUrl,
        });
        res = 'success';
        print('Account created');
      } else {
        res = 'Field must not be empty';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        res = e.toString();
      } else if (e.code == 'email-already-in-use') {
        res = e.toString();
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  loginUsers({required String email, required String password}) async {
    String res = 'Something is Wrong';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        res = 'success';
        print('Login successfull');
      } else {
        res = 'Field must not be empty';
      }
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        res = 'user-not-found';
      } else if (e.code == 'wrong-password') {
        res = 'wrong-password';
      }
    }
    return res;
  }
}
