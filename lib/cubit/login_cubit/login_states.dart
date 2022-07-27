abstract class LoginStates {}

class LoginInitialState extends LoginStates{}

class LoginChangePasswordVisibility extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{}
class LoginErrorState extends LoginStates{}