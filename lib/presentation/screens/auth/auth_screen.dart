import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:student_app/data/local/preferences.dart';
import 'package:student_app/data/remote/dobby/user_request.dart';
import 'package:student_app/presentation/components/buttons/primary_button.dart';
import 'package:student_app/presentation/components/buttons/touchable_opacity.dart';
import 'package:student_app/presentation/components/fields/login_text_form_field.dart';
import 'package:student_app/presentation/components/fields/password_text_form_field.dart';
import 'package:student_app/presentation/theme/app_colors.dart';
import 'package:student_app/providers/user_provider.dart';
import 'package:student_app/router/router_const.dart';
import 'package:student_app/utils/toast/show_toast.dart';
import 'package:student_app/utils/validators/check_email.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/svgs/liquid-cheese.svg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          const _AuthBody(),
        ],
      ),
    );
  }
}

class _AuthBody extends StatelessWidget {
  const _AuthBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                'assets/images/login_pet_sticker_border.png',
                height: 670,
              ),
              const Column(
                children: [
                  SizedBox(
                    height: 210,
                  ),
                  _AuthCard(),
                  SizedBox(
                    height: 50,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthCard extends StatefulWidget {
  const _AuthCard();

  @override
  State<_AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<_AuthCard> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _AuthCardTab(
                index: 0,
                currentIndex: currentIndex,
                onTap: () => setState(
                  () {
                    currentIndex = 0;
                  },
                ),
                label: 'Iniciar sesión',
              ),
              _AuthCardTab(
                index: 1,
                currentIndex: currentIndex,
                onTap: () => setState(
                  () {
                    currentIndex = 1;
                  },
                ),
                label: 'Registrarse',
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          if (currentIndex == 0) const _LoginForm(),
          if (currentIndex == 1) const _RegisterForm(),
        ],
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  late GlobalKey<FormState> formKey;
  String _email = '';
  String _password = '';

  validateEmail(String value) {
    if (checkEmail(value: value)) {
      return null;
    }
    return 'correo electrónico no valido';
  }

  validatePassword(String value) {
    if (value.length >= 6) {
      return null;
    }
    return 'min. 6 carcateres';
  }

  @override
  void initState() {
    formKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            LoginTextFormField(
              validator: (value) => validateEmail(value),
              hintText: 'Email',
              icon: Icons.email,
              onChanged: (email) {
                _email = email;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            PasswordTextFormField(
              validator: (value) => validatePassword(value),
              hintText: 'Contraseña',
              icon: Icons.key,
              onChanged: (password) {
                _password = password;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryButton(
              onTap: () {
                if (!formKey.currentState!.validate()) {
                  showToast('Hay campos obligatorios sin rellenar');
                  return;
                }
                UserRequest().login(email: _email, password: _password).then(
                  (value) {
                    if (value == null) {
                      showToast('Usuario o contraseña no válidos');
                    } else {
                      Preferences.user = value.user;
                      Preferences.token = value.token;
                      userProvider.user = value.user;
                      context
                          .pushReplacementNamed(AppRouterConstants.mainScreen);
                    }
                  },
                );
              },
              text: 'Iniciar sesión',
            ),
            const SizedBox(
              height: 20,
            ),
            TouchableOpacity(
              onTap: () {},
              child: Text(
                'Recuperar contraseña',
                style: TextStyle(
                    color: AppColors.purple, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ));
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  late GlobalKey<FormState> formKey;
  String _name = '';
  String _lastname = '';
  String _email = '';
  String _password = '';
  String _repeatedPassword = '';

  validateName(String value) {
    if (value != '') {
      return null;
    }
    return 'El nombre es obligatorio';
  }

  validateLastname(String value) {
    if (value != '') {
      return null;
    }
    return 'El apellido es obligatorio';
  }

  validateEmail(String value) {
    if (checkEmail(value: value)) {
      return null;
    }
    return 'correo electrónico no valido';
  }

  validatePassword(String value) {
    if (value.length >= 6) {
      return null;
    }
    return 'min. 6 caracteres';
  }

  validateRepeatedPassword(String value, String password) {
    if (value.length >= 6) {
      if (value == password) {
        return null;
      }
      return 'Las contraseñas no coinciden';
    }
    return 'min. 6 caracteres';
  }

  @override
  void initState() {
    formKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          LoginTextFormField(
            hintText: 'Nombre',
            icon: Icons.person,
            onChanged: (value) => _name = value,
            validator: (value) => validateName(value),
          ),
          const SizedBox(
            height: 20,
          ),
          LoginTextFormField(
            hintText: 'Apellido',
            icon: Icons.people,
            onChanged: (value) => _lastname = value,
            validator: (value) => validateLastname(value),
          ),
          const SizedBox(
            height: 20,
          ),
          LoginTextFormField(
            hintText: 'Email',
            icon: Icons.email,
            onChanged: (value) => _email = value,
            validator: (value) => validateEmail(value),
          ),
          const SizedBox(
            height: 20,
          ),
          PasswordTextFormField(
            hintText: 'Contraseña',
            icon: Icons.key,
            onChanged: (value) => _password = value,
            validator: (value) => validatePassword(value),
          ),
          const SizedBox(
            height: 20,
          ),
          PasswordTextFormField(
            hintText: 'Confirmar contraseña',
            icon: Icons.key,
            onChanged: (value) => _repeatedPassword = value,
            validator: (value) => validateRepeatedPassword(value, _password),
          ),
          const SizedBox(
            height: 30,
          ),
          PrimaryButton(
            onTap: () {
              if (!formKey.currentState!.validate()) {
                showToast('Hay campos obligatorios sin rellenar');
                return;
              }
              UserRequest()
                  .register(
                      email: _email,
                      password: _password,
                      lastname: _lastname,
                      name: _name)
                  .then(
                (value) {
                  if (value == null) {
                    showToast('Error al crear usuario');
                  } else {
                    Preferences.user = value.user;
                    Preferences.token = value.token;
                    userProvider.user = value.user;
                    context.pushReplacementNamed(AppRouterConstants.mainScreen);
                  }
                },
              );
            },
            text: 'Registrarse',
          )
        ],
      ),
    );
  }
}

class _AuthCardTab extends StatelessWidget {
  const _AuthCardTab({
    required this.index,
    required this.currentIndex,
    required this.onTap,
    required this.label,
  });

  final int index;
  final int currentIndex;
  final Function onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: AnimatedContainer(
          duration: Durations.short4,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: index == currentIndex
                ? AppColors.primaryColor.withOpacity(0.5)
                : Colors.white,
          ),
          child: Text(
            label,
            style: TextStyle(
              color: AppColors.purple.withOpacity(
                index == currentIndex ? 1 : 0.75,
              ),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
