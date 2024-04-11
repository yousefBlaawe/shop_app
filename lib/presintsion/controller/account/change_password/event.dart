class ChangePasswordEvent{
  final String currentPassword;
  final String newPassword;
  ChangePasswordEvent({required this.currentPassword,required this.newPassword});
}