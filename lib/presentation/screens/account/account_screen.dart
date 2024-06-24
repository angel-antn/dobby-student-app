import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:student_app/data/local/preferences.dart';
import 'package:student_app/data/remote/dobby/user_request.dart';
import 'package:student_app/presentation/components/buttons/touchable_opacity.dart';
import 'package:student_app/presentation/components/fields/custom_text_form_field.dart';
import 'package:student_app/presentation/theme/app_colors.dart';
import 'package:student_app/providers/user_provider.dart';
import 'package:student_app/router/router_const.dart';
import 'package:student_app/utils/text/to_title_case.dart';
import 'package:student_app/utils/toast/show_toast.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              color: AppColors.yellow.withOpacity(0.55),
              width: double.infinity,
              height: 200,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.asset(
                      'assets/images/dobby_sticker_border.png',
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${toTitleCase(userProvider.user?.name ?? '')} ${toTitleCase(userProvider.user?.lastname ?? '')}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TouchableOpacity(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            padding: const EdgeInsets.symmetric(vertical: 7),
                            decoration: BoxDecoration(
                                color: AppColors.yellow,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.qr_code,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Mostrar QR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 190,
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xfffbf8ff),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_circle_outlined,
                            color: Colors.black.withOpacity(0.6),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Ajustes de cuenta',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 0.5,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center),
                          header: Text(
                            'Actualizar informacion',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          collapsed: const SizedBox(),
                          expanded: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'A continuación, puedes actualizar su información personal. Este proceso te permitirá mantener tus datos al día y mejorar tu experiencia de aprendizaje',
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              _EditForm(userProvider: userProvider)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black12),
                        ),
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center),
                          header: Text(
                            'Cerrar sesión',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          collapsed: const SizedBox(),
                          expanded: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                '¡Esperamos que haya disfrutado aprendiendo con nosotros! Si lo desea, puede cerrar sesión al terminar para mantener su experiencia personalizada.',
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              TouchableOpacity(
                                onTap: () {
                                  Preferences.clear();
                                  context.pushReplacementNamed(
                                    AppRouterConstants.authScreen,
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColors.purple.withOpacity(0.7),
                                  ),
                                  child: const Text(
                                    'Cerrar sesión',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EditForm extends StatefulWidget {
  const _EditForm({required this.userProvider});

  final UserProvider userProvider;

  @override
  State<_EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<_EditForm> {
  late String _name;
  late String _lastname;
  late GlobalKey<FormState> formKey;

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

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    _name = widget.userProvider.user?.name ?? '';
    _lastname = widget.userProvider.user?.lastname ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            initialValue: _name,
            hintText: 'Nombre',
            icon: Icons.person,
            onChanged: (value) => _name = value,
            validator: (value) => validateName(value),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            initialValue: _lastname,
            hintText: 'Apellido',
            icon: Icons.people,
            onChanged: (value) => _lastname = value,
            validator: (value) => validateLastname(value),
          ),
          const SizedBox(
            height: 25,
          ),
          TouchableOpacity(
            onTap: () {
              if (!formKey.currentState!.validate()) {
                showToast('Hay campos obligatorios sin rellenar');
                return;
              }
              UserRequest()
                  .edit(name: _name, lastname: _lastname)
                  .then((value) {
                if (value == null) {
                  showToast('Ha ocurrido un error inesperado');
                } else {
                  showToast('Información actualizada con éxito');
                  Preferences.user = value;
                  widget.userProvider.user = value;
                }
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.purple.withOpacity(0.7),
              ),
              child: const Text(
                'Guardar cambios',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
