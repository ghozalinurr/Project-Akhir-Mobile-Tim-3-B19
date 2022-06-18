import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pamob/alert.dart';
import 'package:get/get.dart';
import 'package:pamob/mainmenu.dart';

class regisHome extends StatefulWidget {
  const regisHome({Key? key}) : super(key: key);

  @override
  State<regisHome> createState() => _regisHomeState();
}

class _regisHomeState extends State<regisHome> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return regispage();
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class regispage extends StatefulWidget {
  const regispage({Key? key}) : super(key: key);

  @override
  State<regispage> createState() => _regispageState();
}

class _regispageState extends State<regispage> {
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController sandi_controller = TextEditingController();

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomAlert(context, "Sandi Lemah!");
      } else if (e.code == 'email-already-in-use') {
        CustomAlert(context, "Email Sudah Terpakai!");
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF009393),
        title: Text(
          'Registrasi',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Halaman Registrasi",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF016170),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: email_controller,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Masukan Email",
                  suffixIcon: Icon(Icons.email),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              TextFormField(
                obscureText: true,
                controller: sandi_controller,
                decoration: InputDecoration(
                  labelText: "Sandi",
                  hintText: "Masukan Sandi",
                  suffixIcon: Icon(Icons.password_outlined),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF009393),
                  minimumSize: Size(100, 50),
                ),
                onPressed: () async {
                  User? user = await loginUsingEmailPassword(
                      email: email_controller.text,
                      password: sandi_controller.text,
                      context: context);
                  print(user);
                  if (user != null) {
                    Get.off(MyHomePage());
                  }
                },
                child: Text(
                  "Registrasi",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
