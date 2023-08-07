import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modules/modules/payment/cubit/payment_cubit.dart';
import 'package:flutter_modules/modules/payment/payment_api_service.dart';
import 'package:flutter_modules/modules/payment/payment_toggle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/public_button.dart';
import '../widgets/public_text.dart';
import '../widgets/public_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageContentState();
}

class _RegisterPageContentState extends State<RegisterPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _priceController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(ApiService())..getAuthToken(),
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = PaymentCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          PublicText(
                            txt: "Hey",
                            color: Colors.lightBlue,
                            size: 40.sp,
                          ),
                          SizedBox(height: 20.h),
                          PublicText(
                            txt: "Create Account",
                            color: Colors.grey,
                            size: 16.sp,
                          ),
                          SizedBox(height: 15.h),
                          PublicTextFormField(
                            hint: "User name",
                            showprefixIcon: true,
                            prefixIcon: Icons.person,
                            controller: _nameController,
                            keyboardtype: TextInputType.text,
                            validator: (String? name) {
                              // return name!.length >= 3
                              //     ? null
                              //     : "AppStrings.invalidUserName";
                            },
                          ),
                          SizedBox(height: 15.h),
                          PublicTextFormField(
                            hint: "Email",
                            showprefixIcon: true,
                            prefixIcon: Icons.email,
                            controller: _emailController,
                            keyboardtype: TextInputType.emailAddress,
                            validator: (String? email) {},
                          ),
                          SizedBox(height: 15.h),

                          PublicTextFormField(
                            hint: "phone",
                            showprefixIcon: true,
                            prefixIcon: Icons.phone,
                            controller: _phoneController,
                            keyboardtype: TextInputType.phone,
                            validator: (String? phone) {
                              // return phone!.length > 10
                              //     ? null
                              //     : "AppStrings.invalidPhone";
                            },
                          ),
                          SizedBox(height: 15.h),
                          PublicTextFormField(
                            hint: "Price",
                            showprefixIcon: true,
                            prefixIcon: Icons.price_change,
                            controller: _priceController,
                            validator: (String? value) {},
                          ),
                          SizedBox(height: 35.h),

                          /// The register button
                          PublicButton(
                            title: "signUp",
                            onPressed: () {
                              cubit.getOrderId().then(
                                    (_) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PaymentToggle(
                                          onKiosdSubbmeted: () =>
                                              cubit.getRefCode(),
                                        ),
                                      ),
                                    ),
                                  );
                            },
                          ),
                        ],
                      ),
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
