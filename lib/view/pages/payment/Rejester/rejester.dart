import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_interview/view/components/core/components.dart';

import '../../../../view_model/bloc/payment/State.dart';
import '../../../../view_model/bloc/payment/cubit.dart';
import '../../../components/constants_payment/components.dart';
import '../../../components/core/style.dart';
import '../Toggle.dart';



class RegisterScreen extends StatelessWidget {
  var firstnameController = TextEditingController();
  var lastnameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var priceController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state){
          if(state is PaymentRefCodeSuccessState){
            navigateAndFinish(context, const ToggleScreen());
          }
        },
        builder: (context, state){
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              appBar: AppBar(backgroundColor: primary,title: const Text('Payment Integration'), centerTitle: true,),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        defaultFormField(
                            controller: firstnameController,
                            type: TextInputType.name, validate: (String? value){
                          if(value!.isEmpty){
                            return 'Please Enter your first name';
                          }
                          return null;
                        }, label: 'FirstName', prefix: Icons.person),
                        const SizedBox(height: 20,),
                        defaultFormField(
                            controller: lastnameController,
                            type: TextInputType.name, validate: (String? value){
                          if(value!.isEmpty){
                            return 'Please Enter your last name';
                          }
                          return null;
                        }, label: 'LastName', prefix: Icons.person),
                        const SizedBox(height: 20,),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.name, validate: (String? value){
                          if(value!.isEmpty){
                            return 'Please Enter your email';
                          }
                          return null;
                        }, label: 'Email', prefix: Icons.email),
                        const SizedBox(height: 20,),
                        defaultFormField(
                            controller: phoneController,
                            type: TextInputType.name, validate: (String? value){
                          if(value!.isEmpty){
                            return 'Please Enter your phone';
                          }
                          return null;
                        }, label: 'Phone', prefix: Icons.phone),
                        const SizedBox(height: 20,),
                        defaultFormField(
                            controller: priceController,
                            type: TextInputType.name, validate: (String? value){
                          if(value!.isEmpty){
                            return 'Please Enter your price';
                          }
                          return null;
                        }, label: 'Price', prefix: Icons.price_check),
                        const SizedBox(height: 20,),
                        defaultButton(
                            function: () async {
                              if (formKey.currentState!.validate()) {
                                PaymentCubit.get(context).getFirstToken(
                                    priceController.text,
                                    firstnameController.text,
                                    lastnameController.text,
                                    emailController.text,
                                    phoneController.text);
                              }
                            },
                            text: 'Go To Pay', radius: 12, width: 200)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
