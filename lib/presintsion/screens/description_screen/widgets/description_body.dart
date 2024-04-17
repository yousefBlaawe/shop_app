import 'package:flutter/material.dart';
import 'package:shop_app_clean/domain/entite/home/data/products.dart';
import 'package:shop_app_clean/presintsion/screens/description_screen/widgets/icon_favorites.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/home_screen.dart';

class DescriptionBody extends StatelessWidget
{
  final Products products;
  const DescriptionBody(this.products, {super.key});
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height*0.6,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover
                ,image: NetworkImage(products.image!)),
            // borderRadius: BorderRadius.only(
            //   bottomLeft: Radius.circular(50),
            //   bottomRight: Radius.circular(50)
            // ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Container(
            height: MediaQuery.sizeOf(context).height*0.5,
            decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.2),
                borderRadius: const BorderRadius.only(topRight: Radius.circular(70),topLeft: Radius.circular(70))
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                          Navigator.pop(context, MaterialPageRoute(builder: (context){
                            return const HomeScreen();
                          }));
                        }, icon: Icon(Icons.arrow_back_ios_new,
                          color: Colors.teal[800],
                          size: 40,
                        )),
                   const     Spacer(),
                       IconFavorites(products),
                      ],
                    ),
                  ),
                const  SizedBox(height: 20,),
                  SizedBox(
                    height: 80,
                    child: Text(products.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      ),
                    ),
                  ),
                const  SizedBox(height: 10,),
                  SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: Text(products.description!,
                    maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      color: Colors.white,
                        fontSize: 15
                    ),
                    ),
                  ),const SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('${products.price?.round()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 25
                      ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(0.6),

                        ),
                        height: 40,
                        width: 100,
                        child: Center(
                          child: Text('ADD TO BAG',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal[800]
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        )
      ],
    );
  }

}