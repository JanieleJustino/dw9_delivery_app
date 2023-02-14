import 'package:dw9_delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_controller.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
            any: () => hideLoader(),
            register: () => showLoader(),
            error: () {
              hideLoader();
              showError("Erro ao registrar usuário");
            },
            success: () {
              hideLoader();
              showSuccess("Cadastro realizado com sucesso");
              Navigator.pop(context);
            });
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cadastro",
                      style: context.textStyles.textTitle,
                    ),
                    Text(
                      "Preencha os campos abaixo para criar o seu cadastro",
                      style:
                          context.textStyles.textMedium.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Nome",
                      ),
                      controller: _nameEC,
                      validator: Validatorless.required("Nome obrigatório"),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Email",
                      ),
                      controller: _emailEC,
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
                      controller: _passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required("Senha obrigatória"),
                        Validatorless.regex(
                          RegExp(
                              r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[$*&@#])([0-9a-zA-Z$*&@#]){6,}$'),
                          "A senha precisa ter:\nMínimo de 6 dígitos\nUm número\nUma letra maiúscula\nUma letra minúscula\nUm caracter especial \$*&@#\n",
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Confirma senha",
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
                      validator: Validatorless.multiple([
                        Validatorless.required(
                            "Confirmar a senha é obrigatório"),
                        Validatorless.compare(
                            _passwordEC, "As senhas estão diferentes"),
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: DeliveryButton(
                        label: "Cadastrar",
                        onPressed: () {
                          final valid =
                              _formKey.currentState?.validate() ?? false;
                          if (valid) {
                            controller.register(
                                _nameEC.text, _emailEC.text, _passwordEC.text);
                          }
                        },
                        width: double.infinity,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
