//import 'package:traveller/main.dart';
//import 'package:traveller/screens/homepage.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';
//
//class RegisterPage extends StatefulWidget {
//  @override
//  _RegisterPageState createState() => _RegisterPageState();
//}
//
//class _RegisterPageState extends State<RegisterPage> {
//  final _nameController = TextEditingController();
//  final _passwordController = TextEditingController();
//  final _emailController = TextEditingController();
//
//  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final GoogleSignIn googleSignIn = GoogleSignIn();
//
//  Future<String> SignINWithGoogle() async {
//    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
//        .authentication;
//    final AuthCredential credential = await GoogleAuthProvider
//        .getCredential(
//        idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
//    final AuthResult authResult=await _auth.signInWithCredential(credential);
//    final FirebaseUser user=authResult.user;
//    assert(!user.isAnonymous);
//    assert(await user.getIdToken() !=null);
//    final FirebaseUser currentUser=await _auth.currentUser();
//    assert(user.uid==currentUser.uid);
//    return 'sign in With Google succeeded: $user';
//
//  }
//
//  void signOutWithGoogle()async{
//    await googleSignIn.signOut();
//    print('User Signed Out');
//  }
//
//  Widget  _signInButton() {
//    return OutlineButton(
//      splashColor: Colors.grey,
//      onPressed: () {
//        SignINWithGoogle().whenComplete((){
//          Navigator.pop(context);
//        });
//
//      },
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
//      highlightElevation: 0,
//      borderSide: BorderSide(color: Colors.grey),
//      child: Padding(
//        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            Image(
//              image: AssetImage("assets/google_logo.png"),
//              height: 35.0,
//            ),
//            Padding(
//              padding: EdgeInsets.only(left: 10),
//              child: Text(
//                'Sign in with Google',
//                style: TextStyle(fontSize: 20, color: Colors.grey),
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SafeArea(
//        child: ListView(
//          padding: EdgeInsets.symmetric(horizontal: 24.0),
//          children: <Widget>[
//            SizedBox(height: 80.0),
//            Column(
//              children: <Widget>[
//                Image.asset('assets/diamond.png'),
//                SizedBox(height: 16.0),
//                Text('SHRINE'),
//              ],
//            ),
//
//            SizedBox(height: 120.0),
//            TextField(
//              controller: _nameController,
//              decoration: InputDecoration(
//                  border: CutCornersBorder(), labelText: 'Name'),
//            ),
//            SizedBox(
//              height: 12,
//            ),
//            TextField(
//              controller: _emailController,
//              decoration: InputDecoration(
//                  border: CutCornersBorder(), labelText: 'Email'),
//            ),
//            SizedBox(
//              height: 12,
//            ),
//            TextField(
//
//              controller: _passwordController,
//              obscureText: true,
//
//              decoration: InputDecoration(
//                  labelText: 'Password', border: CutCornersBorder()),
//            ),
////            FlatButton(onPressed: () {
////              _nameController.clear();
////              _passwordController.clear();
////              _emailController.clear();
////              Navigator.push(context,
////                  MaterialPageRoute(builder: (context) => LoginPage()));
////            },
////                child: Text("Already have an account?",
////                  style: TextStyle(fontWeight: FontWeight.w400),)),
//
//            ButtonBar(
//              children: <Widget>[
//                FlatButton(
//                    onPressed: () {
//                      _nameController.clear();
//                      _passwordController.clear();
//                      _emailController.clear();
//                    }, shape: BeveledRectangleBorder(
//                    borderRadius: BorderRadius.all(Radius.circular(8))
//                ),
//                    child: Text('Cancel')),
//                RaisedButton(
//                  color: Color(0xFFFEDBD0),
//                  onPressed: () {
//                  },
//                  shape: BeveledRectangleBorder(
//                      borderRadius: BorderRadius.all(Radius.circular(7))),
//                  child: Text('Register'),
//                  elevation: 8,
//                )
//              ],
//            ),
//
//            _signInButton(),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
