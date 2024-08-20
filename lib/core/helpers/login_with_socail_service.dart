import 'package:dartz/dartz.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
        username: googleUser.displayName ?? '',
        providerId: googleUser.id,
        provider: 'google',
        photoUrl: googleUser.photoUrl,
      );
      return right(
        loginWithSocailRequestBody,
      );
    } catch (error) {
      return left(
        ServerFailure('Google sign-in error: $error'),
      );
    }
  }

  Future<Either<Failure, LoginWithSocailRequestBody?>>
      loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final facebookUser = await FacebookAuth.instance.getUserData();
      final loginWithSocailRequestBody = LoginWithSocailRequestBody(
        email: facebookUser['email'] ?? '',
        username: facebookUser['name'] ?? '',
        providerId: result.accessToken!.userId,
        provider: 'facebook',
        photoUrl: facebookUser['picture']['data']['url'] ?? '',
      );
      return right(
        loginWithSocailRequestBody,
      );
    } else {
      return left(
        ServerFailure('Facebook sign-in error: ${result.message}'),
      );
    }
  }
}
