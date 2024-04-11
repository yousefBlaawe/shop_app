import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/service/service_locator.dart';
import 'package:shop_app_clean/presintsion/controller/productes/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/productes/event.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/Screens/products_screen/widget/products_body.dart';

class ProductsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ProductsBody(),
        );
  }

}