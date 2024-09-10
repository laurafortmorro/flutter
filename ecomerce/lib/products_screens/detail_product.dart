import 'package:ecomerce/models/product.dart';
import 'package:ecomerce/provider/products_cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

class DetailProduct extends StatefulWidget {
  DetailProduct({super.key, required this.product});
  final Product product;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  late GoogleMapController mapController;
  late ShoppingCartProvider notifier = Provider.of<ShoppingCartProvider>(context, listen: false);

  late LatLng _center = LatLng(widget.product.location.latitude, widget.product.location.longitude);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Hero(
        transitionOnUserGestures: true,
        tag: widget.product.name,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CustomScrollView(
              slivers: [
                buildSliverAppBar(),
                buildSliverToBoxAdapter(context),
              ],
            ),
            Positioned(
              bottom: 20.0,
              left: 0.0,
              right: 0.0,
              child: Center(
                child: buildElevatedButton(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context) {
    return ElevatedButton(
                onPressed: ()
                {
                  Provider.of<ShoppingCartProvider>(context, listen: false).addToCart(
                      CartProduct(
                          quantity: 1,
                          id: widget.product.id,
                          name: widget.product.name,
                          imgUrl: widget.product.imgUrl,
                          price: widget.product.price,
                          description: widget.product.description,
                          category: widget.product.category,
                          location: widget.product.location
                      )
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('¡Producto añadido!'),
                      duration: Duration(milliseconds: 200),
                    ),
                  );
                },

                child: Text("AÑADIR AL CARRITO", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                  minimumSize: MaterialStateProperty.all(Size(260.0, 40.0)),
                ),
              );
  }

  SliverToBoxAdapter buildSliverToBoxAdapter(BuildContext context) {
    return SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        widget.product.name,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0,),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Text(
                        '${widget.product.price}€',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.green,
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Text(
                        "Descripción",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                      ),
                    ),
                    SizedBox(height: 16.0,),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Text(
                          widget.product.description,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.grey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0,),
                    SizedBox(
                      height: 200,
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 11.0,
                          )
                      ),
                    ),
                    SizedBox(height: 200.0,),
                  ],
                ),
              );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
                collapsedHeight: kToolbarHeight,
                expandedHeight: 300.0,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  background: Swiper(
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index)=>
                    Image.network(
                      widget.product.imgUrl,
                      fit: BoxFit.cover,
                    ),
                    autoplay: true,
                  ),
                )
              );
  }
}


