import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/presintsion/controller/productes/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/productes/state.dart';

class CarouselSliderBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeProductsBloc, HomeProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
       switch(state){
         case SuccessGetData() :
           return CarouselSlider(
               options: CarouselOptions(
                 height: 200,
                 viewportFraction: 1.0,
                 enableInfiniteScroll: true,
                 reverse: false,
                 autoPlay: true,
                 autoPlayInterval: Duration(seconds: 3),
                 autoPlayAnimationDuration: Duration(seconds: 1),
                 initialPage: 0,
                 autoPlayCurve: Curves.fastOutSlowIn,
                 scrollDirection: Axis.horizontal,
               ),
               items: List.generate(
                   state.home.homeData!.bannersData!.length,
                       (index) => CarouselItems(
                       state.home.homeData!.bannersData![index].image!)));
           break ;
         case LoadingGetData ():
           return const Center(
             child: CircularProgressIndicator(
               color: Colors.teal,
               backgroundColor: Colors.grey,
             ),
           );
           break ;
         default :
           return const Center(
             child:  CircularProgressIndicator(
               color: Colors.teal,
               backgroundColor: Colors.grey,
             ),
           );
       }
      },
    );
  }

  Widget CarouselItems(String image) {

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image:  DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('${image}'),
            )),
      ),
    );
  }
}
