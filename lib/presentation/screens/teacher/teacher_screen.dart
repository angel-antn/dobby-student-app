import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:student_app/data/remote/dobby/user_request.dart';
import 'package:student_app/models/student_response.dart';
import 'package:student_app/presentation/theme/app_colors.dart';
import 'package:student_app/router/router_const.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:student_app/utils/toast/show_toast.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  late Future<StudentResponse?> studentsFuture;
  late TextEditingController textEditingController;
  int page = 1;

  @override
  void initState() {
    textEditingController = TextEditingController();
    studentsFuture = UserRequest().getStudents(page);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deleteStudent(String id) {
      UserRequest().deleteStudent(id).then(
        (value) {
          setState(() {
            page = 1;
            studentsFuture = UserRequest().getStudents(page);
          });
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: AppColors.green,
        backgroundColor: AppColors.green,
        onPressed: () async {
          if (await Permission.camera.request().isGranted &&
              await Permission.storage.request().isGranted) {
            try {
              String value = await scanner.scan() ?? '';
              UserRequest().addStudent(value).then(
                (value) {
                  if (value) {
                    showToast('Usuario agregado con exito');
                    setState(() {
                      studentsFuture = UserRequest().getStudents(1);
                    });
                  } else {
                    showToast('No se puedo agregar al estudiante');
                  }
                },
              );
            } catch (_) {
              showToast('Código no válido');
            }
          }
        },
        child: const Icon(
          Icons.qr_code,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            page = 1;
            studentsFuture = UserRequest().getStudents(1);
          });
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    )),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: SizedBox(
                            width: 200,
                            child: Image.asset(
                                'assets/images/professor_dobby_sticker_border.png'))),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lista de estudiantes'.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                          label: const Text(
                            'Código de usuario',
                            style: TextStyle(color: Colors.black45),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.green, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.green, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        controller: textEditingController,
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          UserRequest()
                              .addStudent(textEditingController.text)
                              .then(
                            (value) {
                              if (value) {
                                showToast('Usuario agregado con exito');
                                setState(() {
                                  page = 1;
                                  studentsFuture =
                                      UserRequest().getStudents(page);
                                });
                              } else {
                                showToast('No se puedo agregar al estudiante');
                              }
                            },
                          );
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.green),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  )),
              FutureBuilder(
                future: studentsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  List<Widget> children = [];

                  for (int i = 0; i < snapshot.data!.data!.length; i++) {
                    children.add(
                      StudentCard(
                        data: snapshot.data!.data![i],
                        deleteStudent: deleteStudent,
                      ),
                    );
                  }

                  if (children.isEmpty) {
                    return const Padding(
                        padding: EdgeInsets.all(24),
                        child: Center(
                            child: Text(
                                'Agregue estudiantes para empezar a ver sus resultados')));
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          ...children,
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    if (page > 1) {
                                      setState(() {
                                        page--;
                                        studentsFuture =
                                            UserRequest().getStudents(page);
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.chevron_left)),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black12.withOpacity(0.1)),
                                child: Text(
                                    'Pagina $page de ${snapshot.data?.maxPage ?? 0}'),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (page < snapshot.data!.maxPage!) {
                                      setState(() {
                                        page++;
                                        studentsFuture =
                                            UserRequest().getStudents(page);
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.chevron_right)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentCard extends StatelessWidget {
  const StudentCard(
      {super.key, required this.data, required this.deleteStudent});

  final Datum data;
  final Function deleteStudent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouterConstants.studentScreen,
            pathParameters: {'id': data.id!});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.green,
            ),
            color: const Color(0xfffbf8ff),
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
              width: 70,
              height: 70,
              child: Center(
                child: Text(
                  '${data.name![0].toUpperCase()}${data.lastname![0].toUpperCase()}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black12.withOpacity(0.1)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text('${data.name!} ${data.lastname!}')),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Text(
                      data.email!,
                      style: const TextStyle(color: Colors.black45),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () => deleteStudent(data.id!),
              icon: const Icon(
                Icons.cancel,
              ),
              iconSize: 30,
              color: Colors.black38,
            )
          ],
        ),
      ),
    );
  }
}
