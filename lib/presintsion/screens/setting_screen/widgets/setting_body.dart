import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app_clean/core/app_constante/app_const.dart';
import 'package:shop_app_clean/core/utils/cash_helper.dart';
import 'package:shop_app_clean/core/utils/toast.dart';
import 'package:shop_app_clean/presintsion/controller/account/change_password/event.dart';
import 'package:shop_app_clean/presintsion/screens/login_screen/login_screen.dart';

import '../../../../../../core/service/service_locator.dart';
import '../../../controller/account/change_password/bloc.dart';
import '../../../controller/account/change_password/state.dart';


class SettingBody extends StatelessWidget
{


  var formKey=GlobalKey<FormState>();

  SettingBody({super.key});
  @override
  Widget build(BuildContext context) {
   return BlocProvider(
     create: (context){
       return   SL<BlocChangePassword>();
     },
     child: SingleChildScrollView(
       child: Form(
         key: formKey,
         child: Padding(
           padding: const EdgeInsets.only(left: 10.0,right: 10,top: 30,bottom: 10),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Settings',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.teal[800],
                  fontSize: 40
                ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Icon(Icons.account_circle,color: Colors.teal[800],size: 30,),
                    const SizedBox(width: 10,),
                    Text('Account',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.teal[800],
                      fontSize: 20
                    ),
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.teal[800]
                  ),
                  child: Column(
                    children: [
                     Row(
                       children: [
                         Expanded(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(
                               height: 50,

                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                   color: Colors.white
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Row(
                                   children: [
                                     Icon(Icons.person,color: Colors.teal[800],size: 30,),
                                     const SizedBox(width: 3,),
                                     SizedBox(
                                       width: 90,
                                       child: Text('${AppConst.name}',maxLines: 1,style: TextStyle(

                                           fontSize: 20,
                                           color: Colors.teal[800],
                                           fontWeight: FontWeight.w600
                                       ),),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ),
                         Expanded(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(
                               height: 50,

                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20),
                                   color: Colors.white
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Row(
                                   children: [
                                     Icon(FontAwesomeIcons.idCard,color: Colors.teal[800],size: 30,),
                                     const SizedBox(width: 6,),
                                     SizedBox(
                                       width: 90,
                                       child: Center(
                                         child: Text('${AppConst.id}',maxLines: 1,style: TextStyle(

                                             fontSize: 20,
                                             color: Colors.teal[800],
                                             fontWeight: FontWeight.w600
                                         ),),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.email,color: Colors.teal[800],size: 30,),
                                  const SizedBox(width: 3,),
                                  SizedBox(
                                    width: 300,
                                    child: Text('${AppConst.email}',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(

                                        fontSize: 20,
                                        color: Colors.teal[800],
                                        fontWeight: FontWeight.w600
                                    ),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(FontAwesomeIcons.phone,color: Colors.teal[800],size: 30,),
                                  const SizedBox(width: 10,),
                                  SizedBox(
                                    width: 200,
                                    child: Text('${AppConst.phone}',maxLines: 1,style: TextStyle(

                                        fontSize: 20,
                                        color: Colors.teal[800],
                                        fontWeight: FontWeight.w600
                                    ),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Row(
                  children: [
                    Icon(Icons.lock,color: Colors.teal[800],size: 30,),
                    const SizedBox(width: 10,),
                    Text('RestPassword',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.teal[800],
                          fontSize: 20
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                BlocConsumer<BlocChangePassword,ChangePasswordState>(
                  listener: (context,state){
                    if (state is SuccessChangePasswordState) {
                      defultToast(message: state.changePassword.message, state: ToastState.SUCCESS);
                    }
                    else
                    if (state is ErrorChangePasswordState) {
                      defultToast(message: state.changePassword.message, state: ToastState.ERROR);
                    }
                  },
                  builder:(context,state)
                  {
                    return Container(height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.teal[800]
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 80,
                              width: double.infinity,
                              child: TextFormField(
                                controller: BlocChangePassword.getObject(context).newPasswordController,
                                validator: (val)
                                {
                                  if (val!.isEmpty) {
                                    return 'Current password Con\'t Be Empty ';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.white),
                                    ),
                                    prefixIcon: const Icon(Icons.lock,color: Colors.white,),
                                    label: const Text('Current Password',style: TextStyle(
                                      fontSize: 18,color: Colors.white,
                                    ),)
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 80,
                              width: double.infinity,
                              child: TextFormField(
                                controller: BlocChangePassword.getObject(context).newPasswordController,
                                validator: (val)
                                {
                                  if (val!.isEmpty) {
                                    return 'New password Con\'t Be Empty ';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(color: Colors.white),
                                    ),
                                    prefixIcon: const Icon(Icons.lock_open,color: Colors.white,),
                                    label: const Text('New Password',style: TextStyle(
                                      fontSize: 18,color: Colors.white,
                                    ),)
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: InkWell(
                              onTap: (){
                                if (formKey.currentState!.validate()) {
                                  BlocChangePassword.getObject(context).add(ChangePasswordEvent(currentPassword: BlocChangePassword.getObject(context).currentPasswordController.text, newPassword: BlocChangePassword.getObject(context).newPasswordController.text));

                                }
                              },
                              child: Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white
                                ),
                                child: Center(child: Text('Change Password',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.teal[800],
                                ),),),
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },

                ),
                const SizedBox(height: 30,),
                InkWell(
                  onTap: (){
                    cachHelper.removeData(key: "token").then((value) {
                     Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                       return LoginScreen();
                     }), (route) => false);
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal[800]
                    ),
                    child: const Center(
                      child: Text('Logout',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                      ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
         ),
       ),
     ),
   );
  }

}