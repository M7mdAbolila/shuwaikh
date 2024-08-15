import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shuwaikh/features/login/data/models/login_with_socail_request_body.dart';
import '../networking/failure.dart';

class LoginWithSocailService {
  LoginWithSocailRequestBody? loginWithSocailRequestBody;
  Future<Either<Failure, LoginWithSocailRequestBody?>> loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final loginWithSocailRequestBody = LoginWithSocailRequestBody(
        email: googleUser!.email,
        username: googleUser.displayName ?? 'Unknown',
        providerId: googleUser.id,
        provider: 'google',
        photoUrl: googleUser.photoUrl,
      );
      log(loginWithSocailRequestBody.toString());
      return right(
        loginWithSocailRequestBody,
      );
    } catch (error) {
      log('Google sign-in error: $error');
      return left(
        ServerFailure('Google sign-in error: $error'),
      );
    }
  }
}
