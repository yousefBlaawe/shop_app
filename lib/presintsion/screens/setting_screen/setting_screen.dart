import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_clean/presintsion/screens/setting_screen/widgets/setting_body.dart';

class SettingScreen extends StatelessWidget
{
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingBody(),
    );
  }

}
