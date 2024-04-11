import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/domain/entite/categories/categories_data_list.dart';
import 'package:shop_app_clean/presintsion/controller/categories/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/categories/state.dart';

class CategoriesBody extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return BlocBuilder<CategoriesBloc,CategoriesState>(builder: (context,state){
     if (state is SuccessCategoriesState) {
       return  GridView.count(
           mainAxisSpacing: 20,
           crossAxisSpacing: 10,
           childAspectRatio: 1 / 1.5,
           shrinkWrap: true,
           // physics: NeverScrollableScrollPhysics(),
           crossAxisCount: 2,

           children:List.generate(state.categories.categoriesData.categoriesDataList.length, (index) =>GridViewItems(state.categories.categoriesData.categoriesDataList[index], context) ));
     }
     else
       {
         return Center(child: CircularProgressIndicator(color: Colors.teal[800],backgroundColor: Colors.grey,));
       }
   });
  }
  Widget GridViewItems(  CategoriesDataList categoriesDataList,context)
  {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: MediaQuery.sizeOf(context).height*0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.teal[800],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              InkWell(

                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.sizeOf(context).width*0.5,
                      decoration:  BoxDecoration(
                          borderRadius:const BorderRadius.only(
                            topLeft:Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(categoriesDataList.image),
                          )
                      ),
                    ),

                  ],
                ),
              ),
              Center(
                child: Container(
                  width: 100,
                  height: 50,
                  child: Text(
                    categoriesDataList.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}