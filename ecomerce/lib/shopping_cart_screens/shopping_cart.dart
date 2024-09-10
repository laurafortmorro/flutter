import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/provider/products_cart_provider.dart';
import 'package:ecomerce/widgets/list_products_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});


  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {

  @override
  void initState(){
    super.initState();


    Future.delayed(Duration.zero, () async {
      callProducts();

    });
  }

  @override
  void dispose(){
    super.dispose();
  }



  Future<void> callProducts() async {
    ShoppingCartProvider notifier = Provider.of<ShoppingCartProvider>(context, listen: false);

    await notifier.productsQuantity;
  }


  @override
  Widget build(BuildContext context) {
    double priceProducts = 0.0;

    for (CartProduct product in Provider.of<ShoppingCartProvider>(context).productsQuantity) {
      priceProducts += product.price * product.quantity;
    }

    double totalPrice = priceProducts + 10;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        leading: BackButton(
          color: Theme.of(context).colorScheme.primary,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        title: Text("Carrito"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 20.0,
              bottom: 100.0,
            ),
            child: Column(
              children: [
                Provider.of<ShoppingCartProvider>(context).productsQuantity.isEmpty
                ? SizedBox(height: 40)
                : ListProductsCart(
              product: Provider.of<ShoppingCartProvider>(context).productsQuantity.last),

                Divider(
                  height: 60.0,
                  color: Colors.grey,
                ),
                //resumen y precio total:
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Precio",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "$priceProducts€",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Gastos de envío",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "10€",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Precio total",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "$totalPrice€",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                },
                child: Text("COMPRAR", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                  minimumSize: MaterialStateProperty.all(Size(260.0, 40.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


