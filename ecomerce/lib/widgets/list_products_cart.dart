import 'package:ecomerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/products_cart_provider.dart';

class ListProductsCart extends StatelessWidget {
  ListProductsCart({
    super.key, required this.product
  });
  final CartProduct product;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ShoppingCartProvider>(context);

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: Provider.of<ShoppingCartProvider>(context).productsQuantity.length,
      itemBuilder: (context, index) {
        final cartProduct= cartProvider.productsQuantity[index];

        return Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Image.network(
                    cartProduct.imgUrl,
                  ),
                  SizedBox(height: 50)
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartProduct.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 8.0,),
                        Text(
                          cartProduct.description,
                          style: const TextStyle(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              cartProvider.removeFromCart(cartProduct);
                            },
                            color: Colors.green,
                            icon: Icon(Icons.remove_circle_outline),
                          ),
                          SizedBox(
                            width: 40.0,
                            child: Text(
                              '${cartProduct.quantity}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                             cartProvider.addToCart(cartProduct);
                            },
                            color: Colors.green,
                            icon: Icon(Icons.add_circle_outline),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          cartProvider.clearCart(cartProduct);

                        },
                        color: Colors.grey,
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },

      separatorBuilder: (context, index) {
        return SizedBox(height: 20.0,);
      },
    );
  }
}