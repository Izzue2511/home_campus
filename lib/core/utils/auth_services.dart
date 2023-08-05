import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homecampus/presentation/home_student_screen/home_student_screen.dart';
import 'package:homecampus/presentation/login_student_screen/login_student_screen.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<String?> login(
      String tenant_email, String tenant_password, Function navigateToHome) async {
    try {
      if (tenant_email != null && tenant_password != null) {
        await _auth.signInWithEmailAndPassword(
          email: tenant_email.trim(),
          password: tenant_password.trim(),
        );

        // Success
        navigateToHome(HomeStudentScreen());
        return null;
      } else {
        throw Exception("Email and password cannot be null");
      }
    } catch (e) {
      return e.toString();
    }
  }
}
