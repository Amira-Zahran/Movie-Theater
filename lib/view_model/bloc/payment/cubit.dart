import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/payment/first_Token.dart';
import '../../../view/components/constants_payment/constants.dart';
import '../../database/network/dio.dart';
import 'State.dart';

class PaymentCubit extends Cubit<PaymentStates>{
  PaymentCubit() : super(PaymentInitalState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  FirstToken? firstToken;

  Future getFirstToken(String price, String firstname, String lastname, String email, String phone) async{
    DioHelperPayment.postData(url: 'auth/tokens', data: {'api_key': PaymobApiKey}).then((value) {
          //firstToken = FirstToken.fromJson(value.data);
          //PaymobToken = firstToken!.token.toString();
      PaymobToken = value.data['token'];
          print('First token: ${PaymobToken}');
          getOrderId(price, firstname, lastname, email, phone);
          emit(PaymentSuccessState());
    }).catchError((error){
          emit(PaymentErrorState(error));
    });

  }


  Future getOrderId(String price, String firstname, String lastname, String email, String phone) async{
    DioHelperPayment.postData(url: 'ecommerce/orders', data: {
      'auth_token': PaymobToken,
      'delivery_needed': 'false',
      'amount_cents': price,
      'currency': 'EGP',
      'items': [],
    }).then((value) {
      //firstToken = FirstToken.fromJson(value.data);
      //PaymobToken = firstToken!.token.toString();
      PaymobOrderId = value.data['id'].toString();
      print('Order ID: ${PaymobOrderId}');
      getFinalTokenCard(price, firstname, lastname, email, phone);
      getFinalTokenKiosk(price, firstname, lastname, email, phone);
      emit(PaymentOrderIDSuccessState());
    }).catchError((error){
      emit(PaymentOrderIDErrorState(error));
    });
  }


  Future getFinalTokenCard(String price, String firstname, String lastname, String email, String phone) async{
    DioHelperPayment.postData(url: 'acceptance/payment_keys', data: {
        "auth_token": PaymobToken,
        "amount_cents": price,
        "expiration": 3600,
        "order_id": PaymobOrderId,
        "billing_data": {
          "apartment": "NA",
          "email": email,
          "floor": "NA",
          "first_name": firstname,
          "street": "NA",
          "building": "NA",
          "phone_number": phone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "NA",
          "last_name": lastname,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": IntegrationIDCard,
        "lock_order_when_paid": "false"
    }).then((value) {
      //firstToken = FirstToken.fromJson(value.data);
      //PaymobToken = firstToken!.token.toString();
      PaymentFinalTokenCard = value.data['token'].toString();
      print('Final Token Card: ${PaymentFinalTokenCard}');
      emit(PaymentRequestTokenSuccessState());
    }).catchError((error){
      emit(PaymentRequestTokenErrorState(error));
    });

  }


  Future getFinalTokenKiosk(String price, String firstname, String lastname, String email, String phone) async{
    DioHelperPayment.postData(url: 'acceptance/payment_keys', data: {
      "auth_token": PaymobToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": PaymobOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstname,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastname,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": IntegrationIDKiosk,
      "lock_order_when_paid": "false"
    }).then((value) {
      //firstToken = FirstToken.fromJson(value.data);
      //PaymobToken = firstToken!.token.toString();
      PaymentFinalTokenKiosk = value.data['token'].toString();
      print('Final Token Kiosk: ${PaymentFinalTokenKiosk}');
      getRefCode();
      emit(PaymentRequestTokenKioskSuccessState());
    }).catchError((error){
      emit(PaymentRequestTokenKioskErrorState(error));
    });

  }


  Future getRefCode() async{
    DioHelperPayment.postData(url: 'acceptance/payments/pay', data: {
      "source": {
        "identifier": "AGGREGATOR",
        "subtype": "AGGREGATOR"
      },
      "payment_token": PaymentFinalTokenKiosk,
    }).then((value) {
      //firstToken = FirstToken.fromJson(value.data);
      //PaymobToken = firstToken!.token.toString();
      RefCode = value.data['id'].toString();
      print('Ref Code: ${RefCode}');
      emit(PaymentRefCodeSuccessState());
    }).catchError((error){
      emit(PaymentRefCodeErrorState(error));
    });

  }

}