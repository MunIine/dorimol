import 'dart:async';
import 'package:dorimol/api/api.dart';
import 'package:dorimol/models/jwt_tokens_anwer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AuthService {
  AuthService({required this.apiClient});

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final DorimolApiClient apiClient;

  User? get currentUser => firebaseAuth.currentUser;
  String? _verificationId;

  Future<void> signIn({required String phone}) async {
    final completer = Completer<void>();

    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await firebaseAuth.signInWithCredential(credential);
        completer.complete();
      },
      verificationFailed: (FirebaseAuthException e) {
        completer.completeError(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        completer.complete();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );

    return completer.future;
  }

  Future<UserCredential> verifyCode(String smsCode) async {
    if (_verificationId == null) {
      throw Exception("Verification ID is null. Please request a new code.");
    }

    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: smsCode,
    );

    return await firebaseAuth.signInWithCredential(credential);
  }

  Future<JwtTokensAnwer> getJwtToken(String idToken) async {
    try {
      final JwtTokensAnwer anwer = await apiClient.createJwtToken({'id_token':idToken});
      return anwer;

    } catch (e, st) {
      GetIt.I<Talker>().error(e, st);
      rethrow;
    }
  }
}
