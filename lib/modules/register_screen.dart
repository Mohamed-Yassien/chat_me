import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/register_cubit/register_cubit.dart';
import '../cubit/register_cubit/register_states.dart';
import '../shared/widgets/reusable_button.dart';
import '../shared/widgets/reusable_text_field.dart';

class RegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);

          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style:
                              Theme.of(context).textTheme.headline4?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          'Register now to communicate with friends',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        ReusableTextField(
                          controller: nameController,
                          prefixIcon: Icons.person,
                          textLabel: 'User Name',
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'name must not be empty';
                            }
                          },
                          type: TextInputType.name,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ReusableTextField(
                          controller: emailController,
                          prefixIcon: Icons.email,
                          textLabel: 'Email Address',
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'email must not be empty';
                            }
                          },
                          type: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ReusableTextField(
                          controller: passwordController,
                          prefixIcon: Icons.lock,
                          textLabel: 'Password',
                          suffixIcon: cubit.passwordIcon,
                          isPassword: cubit.isPassword,
                          onSubmit: (val) {
                            if (formKey.currentState!.validate()) {
                              cubit.register(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text);
                            }
                          },
                          suffixPressed: () {
                            cubit.changePasswordState();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          type: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ReusableTextField(
                          controller: phoneController,
                          prefixIcon: Icons.phone,
                          textLabel: 'Phone',
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'phone must not be empty';
                            }
                          },
                          onSubmit: (val) {
                            cubit.register(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                            );
                          },
                          type: TextInputType.phone,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        state is RegisterLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : reusableButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.register(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                    );
                                  }
                                },
                                text: 'register',
                              ),
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
