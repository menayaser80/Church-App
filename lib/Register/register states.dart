abstract class ChatRegisterStates{}
class InitialRegisterState extends ChatRegisterStates{}
class ChangePassRegisterState extends ChatRegisterStates{}
class LoadingRegisterState extends ChatRegisterStates{}
class SuccessRegisterState extends ChatRegisterStates{}
class ErrorRegisterState extends ChatRegisterStates{
  late final String error;
  ErrorRegisterState(this.error);
}
class SuccessCreateUserState extends ChatRegisterStates{}
class ErrorCreateUserState extends ChatRegisterStates{
  late final String error;
  ErrorCreateUserState(this.error);
}