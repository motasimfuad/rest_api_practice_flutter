import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_practice/models/product_data.dart';
import 'package:http/http.dart' as http;

List<Product> products = [];
int productsLength = 0;

Future<ProductData> getProducts() async {
  print('Products: ${products.length}');
  try {
    var productUrl =
        Uri.parse('https://sabziwala-admin.bdlancers.com/api/products');
    var response = await http.get(productUrl);
    print(response.statusCode);
    Map<String, dynamic> result = await jsonDecode(response.body);
    print('Result: $result');

    if (response.statusCode == 200) {
      // for (dynamic item in data.data) {
      //   var prod = Product.fromJson(item);
      //   products.add(prod);
      // }
      // return products;
      // products = data.data;

      return ProductData.fromJson(result);
    } else {
      // return products;
      return ProductData.fromJson(result);
    }
  } catch (e) {
    print(e);
    rethrow;
  }
}

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products: $productsLength'),
      ),
      body: SafeArea(
        child: FutureBuilder<ProductData>(
          future: getProducts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Container(
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 10,
                          right: 10,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.63,
                        ),
                        itemCount: snapshot.data.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = snapshot.data.data[index];
                          return Stack(
                            children: [
                              Card(
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 1.1,
                                            child: Image.network(
                                              '${product.thumbnailMediaUrl}',
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            '${product.name}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            'Quantity: 1 ${product.unit!.name}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                '\$${product.salePrice}',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                '\$${product.actualPrice}',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.red.shade50,
                                                  elevation: 0,
                                                  fixedSize:
                                                      const Size(10, 10)),
                                              onPressed: () {},
                                              child: const Icon(
                                                Icons.shopping_cart_outlined,
                                                size: 18,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15,
                                top: 15,
                                child: Icon(
                                  Icons.favorite_border_outlined,
                                  size: 28,
                                  color: Colors.grey.shade400,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('ERROR'),
              );
            }
          },
        ),
      ),
    );
  }
}


// ListView.builder(
//                         itemCount: products.length,
//                         itemBuilder: (context, index) {
//                           final product = products[index];
//                           return Card(
//                             child: Text('${product.name}'),
//                           );
//                         },
//                       ),