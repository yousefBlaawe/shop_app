import 'package:shop_app_clean/presintsion/screens/home_screen/home_screen.dart';

abstract class HomeScreenEvent{}
class ChangeNaveBarEvent extends HomeScreenEvent{
  final int index;
  ChangeNaveBarEvent({required this.index});
}
