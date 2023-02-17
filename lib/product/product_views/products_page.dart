import 'package:first_week_demo/product/product_list_bloc/product_bloc.dart';
import 'package:first_week_demo/product/product_list_bloc/product_event.dart';
import 'package:first_week_demo/product/product_views/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_theme/bottom_navigation_bar.dart';
import '../../app_theme/size_presets.dart';
import '../product_list_bloc/product_state.dart';

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
              const ProductList(),
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
  const ProductList({
    super.key,
  });

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductStarted());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final measures = SizePresets.of(context);
    return Expanded(
      child: BlocBuilder<ProductBloc, ProductState>(builder: (_, productState) {
        if (productState.productsState == ProductsStates.loading) {
          return const Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
          );
        } else if (productState.productsState == ProductsStates.success) {
          if (productState.products!.isEmpty) {
            return Text(
              "No Products Available at The Moment",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            );
          }
          return ListView.builder(
            itemCount: productState.products!.length,
            itemBuilder: (_, index) => Column(
              children: [
                ProductTile(
                  product: productState.products!.elementAt(index),
                ),
                SizedBox(
                  height: measures.customHeight(35, context),
                )
              ],
            ),
          );
        } else {
          return Text("Connection Error",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium);
        }
      }),
    );
  }
}
