import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app_clean/domain/entite/home/data/home_data.dart';
import 'package:shop_app_clean/domain/entite/home/data/products.dart';
import 'package:shop_app_clean/presintsion/controller/home/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/productes/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/productes/event.dart';
import 'package:shop_app_clean/presintsion/controller/productes/state.dart';
import 'package:shop_app_clean/presintsion/screens/description_screen/description.dart';

class GridViewBuilder extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProductsBloc,HomeProductsState>(
        builder: (context,state){
      switch(state)
          {
        case SuccessGetData():
          return  GridView.count(
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,

            children:List.generate(state.home.homeData!.productsData!.length, (index) =>GridViewItems(state.home.homeData!.productsData![index], context) )
          );

        default :
          return Center(child: CircularProgressIndicator(backgroundColor: Colors.grey,color: Colors.teal[800],));
          }
    });
  }
  Widget GridViewItems( Products productsData ,context)
  {
    return   InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return DescriptionScreen(products: productsData);
        }));
      },
      child: Container(
        height: 120,
        width: MediaQuery.sizeOf(context).height*0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.teal[800],
        ),
        child: Column(
          children: [
            InkWell(

              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.sizeOf(context).width*0.5,
                    decoration:  BoxDecoration(
                        borderRadius:const BorderRadius.only(
                          topLeft:Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(productsData.image!),
                        )
                    ),
                  ),
                  productsData.discount !=0 ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: 20,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.teal.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child:  Center(
                          child:  Text('DISCOUNT',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ) ,
                      ),
                    ),
                  ) : SizedBox(),
                ],
              ),
            ),
            const  SizedBox(height: 10,),

            SizedBox(height: 2,),
            Padding(
              padding: const  EdgeInsets.only(left: 5.0),
              child: Container(
                height: 80,
                width: MediaQuery.sizeOf(context).width*0.5,
                child: Text(productsData.name!,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.white,
                    height: 1.20,

                  ),
                ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text('${productsData.oldPrice}',style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.red[800],

                  ),

                  ),
                  Spacer(),
                  Text('${productsData.price}',style: TextStyle(color: Colors.white),),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
