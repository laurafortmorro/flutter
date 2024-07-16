import 'package:bootcamp_laura/login/widgets/my_painter.dart';
import 'package:bootcamp_laura/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController pssController = TextEditingController();
  bool? isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //la següent condició serveix per evitar que es moguin els Stack quan s'activa el keyboard
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
    body:
    ClipRect(
      clipBehavior: Clip.hardEdge,
      child: Align(
        alignment: AlignmentDirectional.topEnd,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
              painter: MyPainter(),
            ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Align(
                    alignment: Alignment.topLeft,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const RadialGradient(
                          center: Alignment.topLeft,
                          radius: 1.8,
                          colors: <Color>[Colors.deepPurple, Colors.lightBlueAccent],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Lato'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: const TextSpan(
                        text:"Don't have an account? ",
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: 'Create your account.',style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                        suffixIcon:Padding(
                          padding: EdgeInsetsDirectional.only(end: 12.0),
                          child: Icon(Icons.person_2_outlined, color: Colors.blue),
                    ),
                  ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: pssController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      suffixIcon:Padding(
                        padding: EdgeInsetsDirectional.only(end: 12.0),
                        child: Icon(Icons.lock_outline_rounded, color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                      ),
                      const Expanded(child: Text('Remember Me', textAlign: TextAlign.left,)),
                      const Expanded(child: Text('Forgot Password?', textAlign: TextAlign.right,))
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      minimumSize: const Size(200, 50)
                    ),
                      onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const MyHomePage(title: 'Primera activitat'),
                        ),
                      );
                      },
                      child: const Text('LOGIN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 30),

                  const Text('Or Login with'),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,),

                          child: Image.asset('assets/facebook_logo.png', width: 20, height: 20),
                      ),
                      const SizedBox(width: 10,),

                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,),

                        child: Image.asset('assets/twitter_logo.png', width: 20, height: 20),
                      ),
                      const SizedBox(width: 10,),

                      ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,),

                        child: Image.asset('assets/google_logo.png', width: 20, height: 20),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
          ],
        ),
      ),
    )
    
    );
  }

}