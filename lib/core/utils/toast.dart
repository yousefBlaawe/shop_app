
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
   defultToast({required String  message,required ToastState state})
{

 return Fluttertoast.showToast(
   msg: '${message}',
   textColor: choosToastColor(state),
   timeInSecForIosWeb: 3,
   backgroundColor: Colors.teal,
   toastLength: Toast.LENGTH_LONG,
   fontSize: 15.0,
   gravity: ToastGravity.BOTTOM,

 );
}


enum ToastState{SUCCESS,ERROR,WORING}
Color choosToastColor(ToastState colorstate)
{
  Color color;
  switch(colorstate)
  {
    case ToastState.SUCCESS:
      color=Colors.white70;
      break;
    case ToastState.ERROR:
      color=Colors.black;
      break;
    case ToastState.WORING:
      color=Colors.amber;
      break;
  }
  return color;
}