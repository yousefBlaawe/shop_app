import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/domain/entite/categories/categories_data_list.dart';
import 'package:shop_app_clean/presintsion/controller/categories/bloc.dart';
import '../../../controller/categories/state.dart';

class CategoriesListView extends StatelessWidget
{
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc,CategoriesState>(builder: (context,state){
      if (state is SuccessCategoriesState) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.categories.categoriesData.categoriesDataList.length,
            itemBuilder: (context,index){
              return itemListView(state.categories.categoriesData.categoriesDataList[index]);
            });
      }
      else
        {
        return  Center(
          child: CircularProgressIndicator(
            color: Colors.teal[800],
            backgroundColor: Colors.grey,
          ),
        );
        }
    });
  }
  Widget itemListView(CategoriesDataList categoriesDataList)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0,right: 3.0),
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.teal[800],
        ),
        child: Padding(
          padding:  const EdgeInsets.only(left: 5.0,right: 3.0),
          child:  Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(categoriesDataList.image),
                radius: 20,
              ),
            const  SizedBox(width: 3,),
              SizedBox(
                width: 95,
                child: Text(categoriesDataList.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}