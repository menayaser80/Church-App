abstract class ChatLoginStates
{}
class ChatLoginInitialState extends ChatLoginStates
{}
class ChatLoginLoadingState extends ChatLoginStates
{}
class ChatLoginSuccessState extends ChatLoginStates
{
final String uid;

  ChatLoginSuccessState(this.uid);
}
class ChatLoginErrorState extends ChatLoginStates
{

  late final String error;
  ChatLoginErrorState(this.error);
}
class ChatchangePasswordState extends ChatLoginStates
{}