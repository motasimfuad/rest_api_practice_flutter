import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rest_api_practice/models/product_data.dart';
import 'package:http/http.dart' as http;

List<Product> products = [];
var productsLength = products.length;
var totalProducts = 0;
int currentPage = 1;
var totalPage;
final ScrollController scrollController = ScrollController();
final RefreshController refreshController = RefreshController();

Future getProducts() async {
  try {
    var url =
        'https://sabziwala-admin.bdlancers.com/api/products?page=$currentPage';
    var productUrl = Uri.parse(url);
    var response = await http.get(productUrl);
    Map<String, dynamic> result = await jsonDecode(response.body);
    var data = ProductData.fromJson(result);

    if (response.statusCode == 200) {
      products.addAll(data.data);
      print('data added');
      totalPage = data.meta.lastPage;
      if (currentPage < totalPage) {
        currentPage++;
      } else {
        return;
      }
      productsLength = products.length;
      return products;
    } else {
      return products;
    }
  } catch (e) {
    print(e);
    throw Exception;
  }
}

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: SafeArea(
        child: FutureBuilder(
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
                    Text('Products: $productsLength'),
                    Text('Current Page: $currentPage'),
                    Expanded(
                      child: GridView.builder(
                        controller: scrollController,
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
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = products[index];
                          return Stack(
                            children: [
                              Card(
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
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
                                            'Quantity: 1 ${product.unit?.name}',
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
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.red.shade50,
                                                elevation: 0,
                                                fixedSize: const Size(10, 10)),
                                            onPressed: () {},
                                            child: const Icon(
                                              Icons.shopping_cart_outlined,
                                              size: 18,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 15.0,
                                top: 15.0,
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





                        // controller: refreshController,
                        // enablePullUp: true,
                        // enablePullDown: false,
                        // onLoading: () async {
                        //   final result = await getProducts();
                        //         // print('load more - Current Page: $currentPage');
                        //   if (result) {
                        //     refreshController.loadComplete();
                        //   } else {
                        //     refreshController.loadFailed();
                        //   }
                        // },