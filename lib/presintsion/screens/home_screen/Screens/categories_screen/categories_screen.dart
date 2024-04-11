import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/Screens/categories_screen/widgets/categories_body.dart';

class CategoriesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.blueGrey[50],
    body:CategoriesBody() ,
  );
  }

}
