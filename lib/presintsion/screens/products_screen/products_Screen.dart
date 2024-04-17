import 'package:flutter/material.dart';
import 'package:shop_app_clean/presintsion/screens/products_screen/widget/products_body.dart';

class ProductsScreen extends StatelessWidget
{
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: ProductsBody(),
        );
  }

}