import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_clean/domain/entite/home/data/products.dart';
import 'package:shop_app_clean/presintsion/screens/description_screen/widgets/description_body.dart';

class DescriptionScreen extends StatelessWidget
{
  final Products products;
  DescriptionScreen({required this.products});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
backgroundColor: Colors.teal[900],
      body: DescriptionBody(this.products),
    );
  }

}