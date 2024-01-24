class Auth {
  /*  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  } */
}





// Assets

 /*  Future<void> signUpWithFacebook() async {
    setState(() {
      isLoading = true;
    });
    final FacebookAuth _facebookAuth = FacebookAuth.instance;
    try {
      final LoginResult result = await _facebookAuth.login(
        permissions: [
          'public_profile',
        ], // Only request public_profile permission
      );
      print("...................here1 excuted...................");
      if (result.status == LoginStatus.success) {
        print("...............here 2 excuted.......................");

        final AccessToken accessToken = result.accessToken!;

        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        print(
            "........................here 3 excuted.............................");
        final User? user = userCredential.user;
        print("user credential is ${user}");
        if (user != null) {
          setState(() {
            fullNameController?.text = user.displayName ?? "";
            emailController?.text = user.email ?? '';
            phoneNumberController?.text = user.phoneNumber ?? '';
          });
        }
      } else if (result.status == LoginStatus.cancelled) {
        print("Facebook login cancelled");
      } else {
        print("Facebook login failed: ${result.message}");
      }
    } catch (e) {
      print("Error signing in with Facebook: $e");
    }
    setState(() {
      isLoading = false;
    });
  }

  bool isLoadingGoogle = false;

  void signUpWithGoogle() async {
    setState(() {
      isLoadingGoogle = true;
    });
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      // Sign out the user to refresh the user information
      await _googleSignIn.signOut();
      // Sign the user back in
      final GoogleSignInAccount? refreshedUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication refreshedAuth =
          await refreshedUser!.authentication;
      // Refresh the authentication to get a non-stale credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: refreshedAuth.accessToken,
        idToken: refreshedAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;
      print("user credential is ${user}");
      print('User: ${userCredential.user!.displayName}');
      String? fullname = userCredential.user!.displayName;
      String? email = userCredential.user!.email;
      String? phoneNumber = userCredential.user!.phoneNumber;
      print("unknown component");
      // String? ID = await retrieveUserId(email!);
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        fullNameController?.text = fullname ?? "";
        emailController?.text = email ?? '';
        phoneNumberController?.text = phoneNumber ?? '';
      });
    } catch (e) {
      print("Error signing in with Google: $e");
    }
    setState(() {
      isLoadingGoogle = false;
    });
  }
 */