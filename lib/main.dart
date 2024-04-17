import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   final fAuth = FirebaseAuth.instance;
//   String email = "";
//   String password = "";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(
//           "Register",
//           style: Theme.of(context).textTheme.headlineMedium,
//         ),
//       ),
//       body: Center(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Email:',
//                 ),
//                 TextFormField(
//                   onChanged: (value) {
//                     setState(() {
//                       email = value;
//                     });
//                   },
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                       hintText: "Enter your Email Here",
//                       border: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.red[900]!, width: 3))),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text(
//                   'Password:',
//                 ),
//                 TextFormField(
//                   onChanged: (value) {
//                     setState(() {
//                       password = value;
//                     });
//                   },
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                       hintText: "Enter your password here",
//                       border: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Colors.red[900]!, width: 3))),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final credentials = await fAuth
//               .createUserWithEmailAndPassword(
//             email: email,
//             password: password,
//           )
//               .catchError((error) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text("Account couldn't created"),
//               ),
//             );
//           }).whenComplete(() {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text("Account created"),
//               ),
//             );
//           });
//           log(credentials.toString());
//         },
//         tooltip: 'Register',
//         child: const Icon(Icons.person),
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final fAuth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Login",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Email:',
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                      hintText: "Enter your Email Here",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red[900]!, width: 3))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Password:',
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  controller: _passwordController,
                  decoration: InputDecoration(
                      hintText: "Enter your password here",
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red[900]!, width: 3))),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final credentials = await fAuth
              .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
              .catchError((error) {
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Account couldn't Logged in"),
              ),
            );
          }).whenComplete(() {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Account Logged in"),
              ),
            );
          });
          log(credentials.toString());
        },
        tooltip: 'Login',
        child: const Icon(Icons.person),
      ),
    );
  }
}
