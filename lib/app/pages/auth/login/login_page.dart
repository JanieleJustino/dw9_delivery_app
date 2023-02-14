import 'package:dw9_delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/pages/auth/login/login_controller.dart';
import 'package:dw9_delivery_app/app/pages/auth/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginController> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginController, LoginState>(
        listener: (context, state) {
          state.status.matchAny(
              any: () => hideLoader(),
              login: () => showLoader(),
              loginError: () {
                hideLoader();
                showError("E-mail ou senha inválidos");
              },
              error: () {
                hideLoader();
                showError("Erro ao realizar login");
              },
              success: () {
                hideLoader();
                Navigator.pop(context, true);
              });
        },
        child: Scaffold(
          appBar: DeliveryAppbar(),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Login",
                            style: context.textStyles.textTitle,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Email",
                            ),
                            controller: emailEC,
                            validator: Validatorless.multiple([
                              Validatorless.required("E-mail obrigatório"),
                              Validatorless.email("E-mail inválido"),
                            ]),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Senha",
                              suffixIcon: GestureDetector(
                                  child: Icon(
                                    _showPassword == false
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  }),
                            ),
                            obscureText: _showPassword == false ? true : false,
                            controller: passwordEC,
                            validator: Validatorless.multiple([
                              Validatorless.required("Senha obrigatória"),
                            ]),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: DeliveryButton(
                              width: double.infinity,
                              label: "ENTRAR",
                              onPressed: () {
                                final valid =
                                    formKey.currentState?.validate() ?? false;
                                if (valid) {
                                  controller.login(
                                      emailEC.text, passwordEC.text);
                                }
                              },
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Não possui uma conta,",
                          style: context.textStyles.textBold,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/auth/register');
                          },
                          child: Text(
                            "Cadastre-se",
                            style: context.textStyles.textBold
                                .copyWith(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}