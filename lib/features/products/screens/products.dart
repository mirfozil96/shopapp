import 'dart:developer';

import 'package:shopapp/features/products/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/all_product_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  AllProductModel? allProductModel;
  List<Products> list = [];
  bool isLoading = false;
  TextEditingController textEditingController = TextEditingController();
  String? selectedCategory;

  Future<void> fetchProducts([String? category]) async {
    isLoading = false;
    list = [];
    setState(() {});

    String api = NetworkService.apiGetAllProduct;
    Map<String, Object?> params = NetworkService.paramEmpty();

    if (category != '') {
      String? result = await NetworkService.getData(
          api: "/products/category/$category", param: params);
      if (result != null) {
        allProductModel = allProductModelFromJson(result);
        list = allProductModel!.products!;
        log(list.toString());
        isLoading = true;
        setState(() {});
      } else {
        isLoading = false;
        setState(() {});
      }
    } else {
      String? result = await NetworkService.getData(api: api, param: params);
      if (result != null) {
        allProductModel = allProductModelFromJson(result);
        list = allProductModel!.products!;
        log(list.toString());
        isLoading = true;
        setState(() {});
      } else {
        isLoading = false;
        setState(() {});
      }
    }
  }

  Future<void> getAllProducts() async {
    isLoading = false;
    String? result = await NetworkService.getData(
        api: NetworkService.apiGetAllProduct,
        param: NetworkService.paramEmpty());
    if (result != null) {
      allProductModel = allProductModelFromJson(result);
      list = allProductModel!.products!;
      log(list.toString());
      isLoading = true;
      setState(() {});
    } else {
      isLoading = false;
      setState(() {});
    }
  }

  Future<void> updateProduct(Products product) async {
    String? result = await NetworkService.updateData(
        api: NetworkService.apiGetAllProduct,
        param: NetworkService.paramEmpty(),
        data: product.toJson());
  }

  Future<void> searchProduct(String text) async {
    isLoading = false;
    list = [];
    setState(() {});

    if (int.tryParse(text) != null) {
      final int id = int.parse(text);
      String? result = await NetworkService.getData(
        api: "${NetworkService.apiGetAllProduct}/$id",
        param: NetworkService.paramEmpty(),
      );
      if (result != null) {
        final product = productsFromJson(result);
        list.add(product);
      }
    } else {
      String? result = await NetworkService.getData(
        api: NetworkService.apiSearchProduct,
        param: NetworkService.paramSearchProduct(text),
      );
      if (result != null) {
        allProductModel = allProductModelFromJson(result);
        list = allProductModel!.products!;
      }
    }

    isLoading = true;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //getAllProducts();
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          centerTitle: true,
        ),
        drawer: CategoryDrawer(
          onCategorySelected: (category) {
            setState(() {
              selectedCategory = category;
            });
            fetchProducts(category);
          },
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: TextField(
                onChanged: (text) async {
                  await searchProduct(text);
                  setState(() {});
                },
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: isLoading
                  ? ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, index) {
                        var pr = list[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Slidable(
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {},
                                  autoClose: false,
                                  backgroundColor: const Color(0xFF21B7CA),
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                  label: 'Edit',
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  autoClose: false,
                                  label: 'Delete',
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ],
                            ),
                            child: Card(
                              margin: EdgeInsets.zero,
                              color: Colors.blueGrey.withOpacity(0.3),
                              elevation: 0,
                              child: ListTile(
                                leading: Image.network(pr.images?.first ??
                                    "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg"),
                                title: Text(
                                    "${pr.title ?? "No title"}\nID: ${pr.id}"),
                                subtitle: Text("Price: ${pr.price}\$"),
                                trailing: Text(pr.category ?? ""),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            )
          ],
        ));
  }
}

class CategoryDrawer extends StatelessWidget {
  final Function(String) onCategorySelected;

  const CategoryDrawer({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Categories'),
          ),
          ListTile(
            title: const Text('All'),
            onTap: () {
              onCategorySelected(
                  ''); // Empty category for fetching all products
              Navigator.pop(context);
            },
          ),
          ...[
            "smartphones",
            "laptops",
            "fragrances",
            "skincare",
            "groceries",
            "home-decoration",
            "furniture",
            "tops",
            "womens-dresses",
            "womens-shoes",
            "mens-shirts",
            "mens-shoes",
            "mens-watches",
            "womens-watches",
            "womens-bags",
            "womens-jewellery",
            "sunglasses",
            "automotive",
            "motorcycle",
            "lighting"
          ].map((category) => ListTile(
                title: Text(category),
                onTap: () {
                  onCategorySelected(category);
                  Navigator.pop(context);
                },
              ))
          //.toList(),
        ],
      ),
    );
  }
}
