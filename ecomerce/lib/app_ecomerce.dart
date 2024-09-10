import 'package:ecomerce/provider/categoria_provider.dart';
import 'package:ecomerce/products_screens/home_products.dart';
import 'package:ecomerce/provider/products_cart_provider.dart';
import 'package:ecomerce/provider/user_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EcomerceApp extends StatefulWidget {
  const EcomerceApp({super.key});

  @override
  State<EcomerceApp> createState() => _EcomerceAppState();
}

class _EcomerceAppState extends State<EcomerceApp> {
  @override
  Widget build(BuildContext context) {{
      return MultiProvider(
          providers:[
            ChangeNotifierProvider(
              create: (_) => UserProvider(),
            ),
            ChangeNotifierProvider(
                create: (_) => AppProvider(),
            ),
            ChangeNotifierProvider(
                create: (_) => ShoppingCartProvider())
          ],
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
          ),
          debugShowCheckedModeBanner: false,
          title: 'Ecomerce',
          home: HomeProducts(),
        ),
      );
    }
  }
}
