import 'package:ecomerce/models/product.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  CardProduct({
    super.key, required this.product
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
                child: Hero(
                  tag: product.name,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0)
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(product.imgUrl),
                          )
                      ),
                    ),
                  )

                ),
            ),
            Expanded(
              flex: 2,
                child: Column(
                  children: [
                    const SizedBox(height: 8.0,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          product.name,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '${product.price}€',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0,),

                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}