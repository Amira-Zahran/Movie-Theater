abstract class PaymentStates{}

class PaymentInitalState extends PaymentStates{}

class PaymentSuccessState extends PaymentStates{}

class PaymentErrorState extends PaymentStates{
  String error;
  PaymentErrorState(this.error);
}


class PaymentOrderIDSuccessState extends PaymentStates{}

class PaymentOrderIDErrorState extends PaymentStates{
  String error;
  PaymentOrderIDErrorState(this.error);
}


class PaymentRequestTokenSuccessState extends PaymentStates{}

class PaymentRequestTokenErrorState extends PaymentStates{
  String error;
  PaymentRequestTokenErrorState(this.error);
}


class PaymentRequestTokenKioskSuccessState extends PaymentStates{}

class PaymentRequestTokenKioskErrorState extends PaymentStates{
  String error;
  PaymentRequestTokenKioskErrorState(this.error);
}

class PaymentRefCodeSuccessState extends PaymentStates{}

class PaymentRefCodeErrorState extends PaymentStates{
  String error;
  PaymentRefCodeErrorState(this.error);
}