import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/presintsion/controller/search/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/search/event.dart';

import '../../../../../../domain/entite/seach/data/data_search.dart';
import '../../../../../../domain/entite/seach/search.dart';
import '../../../../../controller/search/state.dart';
import '../../../home_screen.dart';

class SearchBody extends StatelessWidget
{
  Color? color = Colors.teal[800];
   late Widget itemOne=CircularProgressIndicator(color: Colors.teal,backgroundColor: Colors.grey,);
  var searchController=TextEditingController();
  var KEY=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocSearch,SearchDataState>(
        builder: (context,state){
          return Padding(
            padding:
            const EdgeInsets.only(top: 20.0, left: 10, right: 10, bottom: 40),
            child: Form(
              key: KEY,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return HomeScreen();
                                }));
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.teal[800],
                            size: 30,
                          )),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.25,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.teal[800]),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: searchController,
                      onChanged: (val){
                        BlocSearch.getObject(context).add(SearchDataEvent(Data: val));
                      },
                      validator: (val){
                        if (val!.isEmpty) {
                          return 'Search con\'t be empty';
                        }
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.teal[800],
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: color!),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: color!),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: color!),
                          ),
                          label: Text(
                            'Search',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.teal[800],
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  itemOne,

                ],
              ),
            ),
          );
        },
        listener: (context,state){
            switch(state)
            {
              case SuccessSearchState() :
                itemOne =Expanded(
                  child: ListView.builder(
                              itemBuilder: (context,index){
                              return listItem(state.search.data.searchData[index],
                              );
                              },
                              itemCount: state.search.data.searchData.length,
                              ),
                );
                break;
              case ZeroStateData():
                itemOne = SizedBox();
              default :
                itemOne=CircularProgressIndicator(backgroundColor: Colors.grey,
                color: Colors.teal,);
            }
        }
    );
  }
  Widget listItem(SearchData? search)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                         search!.image ,
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                height: 120,
                width: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 60,
                      child:  Text(
                        search!.name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style:const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.teal),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${search.price.round()}',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Colors.teal[800]),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }


}