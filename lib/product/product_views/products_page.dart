import 'package:first_week_demo/product/product_views/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../app_theme/bottom_navigation_bar.dart';
import '../../app_theme/size_presets.dart';
import '../../configuration/injection.dart';
import '../../product_management_state.dart';
import '../../product_management_store.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    final SizePresets measures = SizePresets.of(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: measures.customWidth(12, context),
              vertical: measures.customHeight(14, context)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Product ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text("List",
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
              SizedBox(
                height: measures.customPaddingTop(2.5, context),
              ),
              ProductList(
                productManagementStore: getIt.get<ProductManagementStore>(),
              ),
              SizedBox(
                height: measures.customPaddingTop(7, context),
              ),
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        ,
        bottomNavigationBar: BottomNavigationBarApp(
          currentIndex: 2,
        ),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  ProductList({super.key, required this.productManagementStore});

  final ProductManagementStore productManagementStore;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    getIt.get<Logger>().d("inside init product list");
    widget.productManagementStore.setProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final measures = SizePresets.of(context);
    return Expanded(
        child: StreamBuilder<ProductManagementState>(
            stream: widget.productManagementStore.state,
            builder: (BuildContext context,
                AsyncSnapshot<ProductManagementState> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Connection Error",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium),
                );
              } else if (snapshot.hasData && snapshot.data!.products != null) {
                if (snapshot.data!.products!.isEmpty) {
                  return Text(
                    "No Products Available at The Moment",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data!.products!.length,
                  itemBuilder: (_, index) => Column(
                    children: [
                      ProductTile(
                        product: snapshot.data!.products!.elementAt(index),
                      ),
                      SizedBox(
                        height: measures.customHeight(35, context),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }));
  }
}
