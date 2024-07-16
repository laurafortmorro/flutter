import 'package:bootcamp_laura/json/data/services.dart';
import 'package:bootcamp_laura/json/models/user.dart';
import 'package:flutter/material.dart';



class JsonHome extends StatelessWidget {
  const JsonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: FutureBuilder<User>(
            future: loadUserData(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }else if(snapshot.hasError){
                print("ERROR: ${snapshot.stackTrace}");
                return Text("Error: ${snapshot.error}");
              }else{
                User user= snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Usuario: ${user.toString()}'),
                );
                    }
            }
                ),
      ),
    );

  }
}
