import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/presintsion/controller/search/bloc.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/Screens/seach_screen/widget/search_body.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/home_screen.dart';

import '../../../../../core/service/service_locator.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context){
      return SL<BlocSearch>();
    },
    child:Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SearchBody(),
    ),
    );
  }
}
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(
// width: double.infinity,
// height: 120,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(20),
// ),
// child: Row(
// children: [
// Container(
// decoration: const BoxDecoration(
// image: DecorationImage(
// image: NetworkImage(
// 'https://student.valuxapps.com/storage/uploads/banners/1689106904Mzsmc.photo_2023-07-11_23-08-24.png',
// ),
// fit: BoxFit.cover),
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(20),
// bottomLeft: Radius.circular(20))),
// height: 120,
// width: 150,
// ),
// Padding(
// padding: const EdgeInsets.all(3.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// width: 200,
// height: 60,
// child: const Text(
// 'Apple iPhone 12 Pro Max 256GB 6 GB RAM, Pacific Blue',
// maxLines: 3,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(
// fontSize: 15,
// fontWeight: FontWeight.w600,
// color: Colors.teal),
// ),
// ),
// SizedBox(
// height: 10,
// ),
// Text(
// '#2000',
// style: TextStyle(
// fontWeight: FontWeight.w900,
// fontSize: 20,
// color: Colors.teal[800]),
// )
// ],
// ),
// )
// ],
// )),
// )
