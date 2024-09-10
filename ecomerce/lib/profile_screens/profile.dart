import 'dart:io';

import 'package:ecomerce/products_screens/home_products.dart';
import 'package:ecomerce/profile_screens/profile_edit.dart';
import 'package:ecomerce/provider/user_profile_provider.dart';
import 'package:ecomerce/widgets/popup_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState(){
    super.initState();
    callUser();
  }

  @override
  void dispose(){
    super.dispose();
  }


  void callUser()  {
    UserProvider notifier = Provider.of<UserProvider>(context, listen: false);

    notifier.user;
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    UserProvider notifier = Provider.of<UserProvider>(context, listen: false);
    File imageFile= File(notifier.image);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.deepPurple,
          ),
          onPressed: () {
            Navigator.of(context).push( MaterialPageRoute(builder: (context) => HomeProducts()));
          },
        ),
        title: const Text(
          'Perfil',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push( MaterialPageRoute(builder: (context) => ProfileEditPage()));
              },
              icon: Icon(Icons.edit))
        ]
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            CircleAvatar(
              radius: 60,
              backgroundImage: FileImage(imageFile),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                Provider.of<UserProvider>(context).user.name,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                Provider.of<UserProvider>(context).user.email,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                Provider.of<UserProvider>(context).user.phone,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
