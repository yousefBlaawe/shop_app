import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageViewBody extends StatelessWidget
{
  late String image;
  late String title;
  PageViewBody({required this.image,required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration:  BoxDecoration(
            image:  DecorationImage(
              fit: BoxFit.cover,
                image:AssetImage('$image'),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

              ),
              child: Text('$title',
             maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style:const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal
              ),
              )),
        ),
      ],
    );
  }

}
