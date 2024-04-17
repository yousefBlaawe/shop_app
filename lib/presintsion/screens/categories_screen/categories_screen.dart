import 'package:flutter/material.dart';
import 'package:shop_app_clean/presintsion/screens/categories_screen/widgets/categories_body.dart';

class CategoriesScreen extends StatelessWidget
{
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.blueGrey[50],
    body:const CategoriesBody() ,
  );
  }

}
