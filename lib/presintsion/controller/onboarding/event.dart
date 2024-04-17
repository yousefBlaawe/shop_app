abstract class OnboardingEvent {}
class ChangePageViewIsLastEvent extends OnboardingEvent{}
class ChangePageViewIsNotLastEvent extends OnboardingEvent{}
class ChangeIconEvent extends OnboardingEvent{
  final context;
  ChangeIconEvent({required this.context});
}
class SkipEvent extends OnboardingEvent{
  final context;
  SkipEvent({required this.context});
}