import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app_clean/core/app_constante/assets_const.dart';
import 'package:shop_app_clean/core/service/service_locator.dart';
import 'package:shop_app_clean/core/utils/cash_helper.dart';
import 'package:shop_app_clean/core/utils/toast.dart';
import 'package:shop_app_clean/presintsion/controller/register/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/register/event.dart';
import 'package:shop_app_clean/presintsion/controller/register/state.dart';
import 'package:shop_app_clean/presintsion/screens/home_screen/home_screen.dart';
import 'package:shop_app_clean/presintsion/screens/login_screen/login_screen.dart';

class RegisterBody extends StatelessWidget
{

   const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
      return SL<RegisterBloc>();
    },
    child: BlocConsumer<RegisterBloc,RegisterState> (
      builder: (BuildContext context, RegisterState state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: RegisterBloc.getObject(context).formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image:  DecorationImage(
                          image:AssetImage(AssetsConst.logo) ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  TextFormField(
                      controller: RegisterBloc.getObject(context).nameController,
                      keyboardType: TextInputType.name,
                      validator: (val){
                        if (val!.isEmpty) {
                          return 'name address con\'t be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:const BorderSide(color: Colors.teal,style: BorderStyle.solid)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:const BorderSide(color: Colors.teal,style: BorderStyle.solid)
                          ),
                          label:const Text('Name',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.teal,
                              fontSize: 18,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.person_rounded,color: Colors.teal,)

                      )
                  ),
                  const  SizedBox(height: 15,),
                  TextFormField(
                      controller: RegisterBloc.getObject(context).phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (val){
                        if (val!.isEmpty) {
                          return 'phone address con\'t be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:const BorderSide(color: Colors.teal,style: BorderStyle.solid)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:const BorderSide(color: Colors.teal,style: BorderStyle.solid)
                          ),
                          label:const Text('Phone Number',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.teal,
                              fontSize: 18,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.phone,color: Colors.teal,)

                      )
                  ),
                  const  SizedBox(height: 15,),
                  TextFormField(
                      controller: RegisterBloc.getObject(context).emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val){
                        if (val!.isEmpty) {
                          return 'email address con\'t be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:const BorderSide(color: Colors.teal,style: BorderStyle.solid)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:const BorderSide(color: Colors.teal,style: BorderStyle.solid)
                          ),
                          label:const Text('Email',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.teal,
                              fontSize: 18,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.email_outlined,color: Colors.teal,)

                      )
                  ),
                  const  SizedBox(height: 15,),
                  TextFormField(
                    controller: RegisterBloc.getObject(context).passwordController,
                    validator: (val){
                      if (val!.isEmpty) {
                        return 'password con\'t be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:const BorderSide(color: Colors.teal,style: BorderStyle.solid)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:const BorderSide(color: Colors.teal,style: BorderStyle.solid)
                      ),
                      label:const Text('Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.teal,
                          fontSize: 18,
                        ),
                      ),
                      prefixIcon:const Icon(Icons.lock_open,color: Colors.teal,),


                    ),

                  ),
                  const SizedBox(height: 50,),
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context, MaterialPageRoute(builder: (context){
                          return const LoginScreen();
                        }));
                      }, icon:const Icon(FontAwesomeIcons.backward,color: Colors.teal,)),
                      ConditionalBuilder(
                          condition: state is! LoadingRegisterState,
                          builder: (context){
                            return Expanded(
                              child: InkWell(
                                onTap: (){
                                  if (RegisterBloc.getObject(context).formKey.currentState!.validate()) {
                                    RegisterBloc.getObject(context).add(RegisterEvent(
                                        name: RegisterBloc.getObject(context).nameController.text,
                                        phone: RegisterBloc.getObject(context).phoneController.text,
                                        email: RegisterBloc.getObject(context).emailController.text,
                                        password: RegisterBloc.getObject(context).passwordController.text),);
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.teal
                                  ),
                                  child:const Center(
                                    child:  Text('Sign Up',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            );
                          },
                          fallback: (context){
                            return const Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.grey,
                                color: Colors.teal,
                              ),
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, RegisterState state) {
        if (state is SuccessRegisterState) {
          if (state.register.status) {

            cachHelper.SaveData(key: 'token', val: state.register.registerData?.token).
            then((value) {
              defultToast(message: state.register.message, state:ToastState.SUCCESS );
              Navigator.pop(context, MaterialPageRoute(builder: (context){
                return const HomeScreen();
              }));
            }).catchError((error){
              print(error.toString());
            });
          }
        }
        else if (state is ErrorRegisterState) {
          defultToast(message: state.errorRegisterMessage, state: ToastState.ERROR);
        }
      },

      ),
    ) ;
  }

}
