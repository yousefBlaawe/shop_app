import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_clean/presintsion/controller/onboarding/bloc.dart';
import 'package:shop_app_clean/presintsion/controller/onboarding/event.dart';
import 'package:shop_app_clean/presintsion/controller/onboarding/state.dart';
import 'package:shop_app_clean/presintsion/screens/onboarding_screen/widgets/page_view_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingBody extends StatelessWidget
{
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return OnboardingBloc();
      },
    child:  BlocBuilder<OnboardingBloc,OnboardingState>(
      builder: (context,state)
      {
        return  Column(
          children: [
            SizedBox(
              height: 600,
              child: PageView.builder(
                controller: OnboardingBloc.getObject(context).controllerPageView,
                itemBuilder: (context,index){

                  return PageViewBody(image: OnboardingBloc.getObject(context).imageList[index],title: OnboardingBloc.getObject(context).titleList[index],);

                },
                onPageChanged: (index){
                  if (index==OnboardingBloc.getObject(context).imageList.length -1) {
                   OnboardingBloc.getObject(context).add(ChangePageViewIsLastEvent());
                  }
                  else {
                   OnboardingBloc.getObject(context).add(ChangePageViewIsNotLastEvent());
                  }
                },
                itemCount: OnboardingBloc.getObject(context).imageList.length,
              ),
            ),
            const SizedBox(height: 50,),
            SmoothPageIndicator(

                controller: OnboardingBloc.getObject(context).controllerPageView,
                effect: const SlideEffect(

                  activeDotColor: Colors.blueGrey,
                  dotColor: Colors.teal,

                ),
                count: OnboardingBloc.getObject(context).imageList.length),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  TextButton(onPressed: (){
                    OnboardingBloc.getObject(context).add(SkipEvent(context: context));
                  },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.teal
                        ),
                      )),
                  const Spacer(),
                  FloatingActionButton(onPressed: (){
                    OnboardingBloc.getObject(context).add(ChangeIconEvent(context: context));
                  },
                    backgroundColor: Colors.teal,
                    child: Icon(OnboardingBloc.getObject(context).iconOnboarding,color: Colors.white,),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
    );
  }


}