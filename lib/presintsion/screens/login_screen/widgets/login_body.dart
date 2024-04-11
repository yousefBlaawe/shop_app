
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/core/app_constante/app_const.dart';
import 'package:shop_app_clean/core/service/service_locator.dart';
import 'package:shop_app_clean/core/utils/cash_helper.dart';
import 'package:shop_app_clean/core/utils/toast.dart';
import 'package:shop_app_clean/presintsion/controller/login/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/login/event.dart';
import 'package:shop_app_clean/presintsion/controller/login/state.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/home_screen.dart';

import '../../register_screen/register_screen.dart';

class LoginBody extends StatelessWidget
{

  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
     // objectBloc=BlocLogin.getObject(context);
   return BlocProvider(
       create:(context){
         return SL<BlocLogin>();
       } ,
       child:BlocConsumer<BlocLogin,StateLogin>(
      builder: (context,state){
     return    SingleChildScrollView(
       child: Padding(
         padding:const  EdgeInsets.only(left: 20.0,right: 20,top: 50),
         child:  Form(
           key:formKey ,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 height: 80,
                 width: 50,
                 decoration:const BoxDecoration(
                     image: DecorationImage(

                       image:  AssetImage('assets/images/pngegg.png'),
                     )
                 ),
               ),
               Container(
                 height: 80,
                 width: 130,
                 child:const Text('Welcome Home',
                   style: TextStyle(
                     height: 1,
                     fontWeight: FontWeight.w900,
                     color: Colors.teal,
                     fontSize: 30,
                   ),
                 ),
               ),
               const SizedBox(height: 50,),
               TextFormField(
                   controller: emailController,
                   keyboardType: TextInputType.emailAddress,
                   validator: (val){
                     if (val!.isEmpty) {
                       return 'email address con\'t be empty';
                     }
                   },
                   decoration: InputDecoration(
                       enabledBorder:OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:BorderSide(color: Colors.teal,style: BorderStyle.solid)
                       ),
                       focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20),
                           borderSide:BorderSide(color: Colors.teal,style: BorderStyle.solid)
                       ),
                       label:const Text('Email',
                         style: TextStyle(
                           fontWeight: FontWeight.w600,
                           color: Colors.teal,
                           fontSize: 18,
                         ),
                       ),
                       prefixIcon: Icon(Icons.email_outlined,color: Colors.teal,)

                   )
               ),
               const  SizedBox(height: 15,),
               TextFormField(
                 controller: passwordController,
                 validator: (val){
                   if (val!.isEmpty) {
                     return 'password con\'t be empty';
                   }
                 },
                 keyboardType: TextInputType.visiblePassword,
                 obscureText: BlocLogin.getObject(context).showPassword,
                 decoration: InputDecoration(
                     enabledBorder:OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20),
                         borderSide:BorderSide(color: Colors.teal,style: BorderStyle.solid)
                     ),
                     focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20),
                         borderSide:BorderSide(color: Colors.teal,style: BorderStyle.solid)
                     ),
                     label:const Text('Password',
                       style: TextStyle(
                         fontWeight: FontWeight.w600,
                         color: Colors.teal,
                         fontSize: 18,
                       ),
                     ),
                     prefixIcon: Icon(Icons.lock_open,color: Colors.teal,),
                     suffixIcon: IconButton(onPressed: (){
                       BlocLogin.getObject(context)..add(EventShowPassword());
                     },icon:Icon(BlocLogin.getObject(context).iconPassword,color: Colors.teal,) )

                 ),

               ),
               const  SizedBox(height: 50,),
               ConditionalBuilder(
                 condition: state is! LoadingState,
                 builder: (BuildContext context) {
                   return InkWell(
                     onTap: (){
                       if (formKey.currentState!.validate()) {
                         BlocLogin.getObject(context)..add(EventLogin(email: emailController.text, pasword: passwordController.text));
                       }
                     },
                     child: Container(
                       height: 50,
                       width:double.infinity,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(25),
                         color: Colors.teal,

                       ),
                       child:const Center(
                         child:  Text('Login',
                           style: TextStyle(
                               fontSize: 25,
                               fontWeight: FontWeight.w900,
                               color: Colors.white
                           ),
                         ),
                       ),
                     ),
                   );
                 },
                 fallback: (BuildContext context) {
                   return const Center(
                     child: CircularProgressIndicator(
                       color: Colors.grey,
                       backgroundColor: Colors.teal,
                     ),
                   );
                 },

               ),
               const SizedBox(height: 60,),
               Row(
                 children: [

                   const Text('if you don\'t have an account',
                     style: TextStyle(
                         fontWeight: FontWeight.w600,
                         fontSize: 15,
                         color: Colors.teal
                     ),
                   ),
                   TextButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context){
                       return RegisterScreen();
                     }));
                   }, child: Text('Register', style: TextStyle(
                         fontSize: 20,
                         color: Colors.grey[800],
                         fontWeight: FontWeight.w600
                     ),
                   )),
                 ],
               )
             ],
           ),
         ),
       ),
     );
   },
      listener: (context,state){
        if (state is SuccessLoginState) {
        if (state.loginModel.status) {
          AppConst.token=state.loginModel.dataLogin!.token!;
          print(state.loginModel.dataLogin!.token);
          cachHelper.SaveData(key: 'name', val: state.loginModel.dataLogin!.name);
          cachHelper.SaveData(key: 'id', val: state.loginModel.dataLogin!.id);
          cachHelper.SaveData(key: 'email', val: state.loginModel.dataLogin!.email);
          cachHelper.SaveData(key: 'phone', val: state.loginModel.dataLogin!.phone);
          cachHelper.SaveData(key: 'token', val: state.loginModel.dataLogin?.token)
              .then((value) {
                defultToast(message: state.loginModel.message, state: ToastState.SUCCESS);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return HomeScreen();
                })).catchError((error){
                  print(error.toString());
                });
          });

        }
        }
        else
          if (state is ErrorLoginState) {
            defultToast(message: state.errorMessage, state: ToastState.ERROR);
          }
      },
   ),
       );
  }

}