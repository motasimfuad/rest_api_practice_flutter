import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_practice/models/products_data.dart';
import 'package:http/http.dart' as http;

List<Product> products = [];

Future getProducts() async {
  try {
    print('Products: ${products.length}');
    var productUrl =
        Uri.parse('https://sabziwala-admin.bdlancers.com/api/products');
    var response = await http.get(productUrl);
    print(response.statusCode);
    var result = jsonDecode(response.body.toString());
    print(result);
    // var data = ProductsData.fromJson(result);
    if (response.statusCode == 200) {
      // for (dynamic item in data.data) {
      //   var prod = Product.fromJson(item);
      //   products.add(prod);
      // }
      // return products;

      return ProductsData.fromJson(result);
    }
  } catch (e) {
    print(e);
  }
}

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: SafeArea(
        child: FutureBuilder<dynamic>(
          future: getProducts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return Container(
                color: Colors.amber,
                child: Column(
                  children: [
                    Text('Products items: ${products.length}'),
                    Expanded(
                      child: ListView.builder(
                        // itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          // final product = products[index];
                          return Card(
                            child: Text('$index'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(
                child: Text('ERROR'),
              );
            }
          },
        ),
      ),
    );
  }
}
