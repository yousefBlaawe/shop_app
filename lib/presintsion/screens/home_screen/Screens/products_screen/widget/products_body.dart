import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app_clean/core/service/service_locator.dart';
import 'package:shop_app_clean/core/utils/cash_helper.dart';
import 'package:shop_app_clean/presintsion/controller/productes/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/productes/event.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/Screens/products_screen/widget/carousel_slider_builder.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/Screens/products_screen/widget/categories_listview.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/Screens/products_screen/widget/grid_view_builder.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/Screens/seach_screen/search_screen.dart';

class ProductsBody extends StatelessWidget {
  String name=cachHelper.getData(key: 'name');
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/yousef.jpg'),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi,',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[800]),
                        ),
                        Text(
                          '$name',
                          style: TextStyle(
                              height: 1,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Colors.teal[800]),
                        ),
                      ],
                    ),
                    Spacer(),
                    // Text(
                    //   'Wander&Buy',
                    //   style: GoogleFonts.lato(
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.w700,
                    //     color: Colors.teal[800],
                    //     fontStyle: FontStyle.italic,
                    //   ),
                    // ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SearchScreen();
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.teal[800],
                        ),
                        height: 50,
                        width: 50,
                        child: Icon(FontAwesomeIcons.search,color: Colors.white,),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Container(height: 1,
                width: double.infinity,
                  color: Colors.teal[800],
                ),
                const SizedBox(
                  height: 10,
                ),
                CarouselSliderBuilder(),
                const SizedBox(
                  height: 15,
                ),
                // Container(
                //   height: 45,
                //   decoration: BoxDecoration(
                //     boxShadow: [],
                //   ),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       // focusColor: Colors.teal,
                //       // filled: true,
                //       // fillColor: Colors.teal.withOpacity(0.4),
                //       prefixIcon: Icon(
                //         Icons.search,
                //         color: Colors.teal[800],
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide: BorderSide(color: Colors.teal),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide: BorderSide(color: Colors.teal),
                //       ),
                //       label: Text(
                //         'Search',
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 18,
                //             color: Colors.teal[800]),
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.teal[800],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(height: 50, child: CategoriesListView()),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.teal[800],
                  ),
                ),
                GridViewBuilder(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
