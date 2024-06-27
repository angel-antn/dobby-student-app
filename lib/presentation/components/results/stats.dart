import 'package:expandable/expandable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:student_app/data/remote/dobby/result_request.dart';
import 'package:student_app/models/result_response.dart';
import 'package:student_app/models/stats_response.dart';
import 'package:student_app/presentation/theme/app_colors.dart';

class Stats extends StatefulWidget {
  const Stats({super.key, required this.userId, required this.isProfessor});

  final String userId;
  final bool isProfessor;

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  late Future<StatsResponse?> statsFuture;
  late Future<ResultResponse?> resultFuture;
  @override
  void initState() {
    statsFuture = ResultRequest().getStats(userId: widget.userId);
    resultFuture = ResultRequest().getResult(userId: widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            statsFuture = ResultRequest().getStats(userId: widget.userId);
            resultFuture = ResultRequest().getResult(userId: widget.userId);
          });
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Estadisticas',
                  style: TextStyle(
                      color:
                          widget.isProfessor ? AppColors.green : AppColors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(Icons.help_outline_outlined),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(widget.isProfessor
                        ? 'Esta estadistica mide el desempeño del alumno a lo largo de los dias midiendo cuantas lecciones ha completado'
                        : 'Esta estadistica mide tu desempeño a lo largo de los dias midiendo cuantas lecciones has completado'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              BarCharts(
                isProfessor: widget.isProfessor,
                userId: widget.userId,
                statsFuture: statsFuture,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Resultados',
                  style: TextStyle(
                      color:
                          widget.isProfessor ? AppColors.green : AppColors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Icon(Icons.help_outline_outlined),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      'A continuación se muestra un resumen detallado de los ultimos 5 resultados registrados',
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: resultFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColors.red,
                    ));
                  } else {
                    List<Widget> children = [];
                    for (int i = 0; i < snapshot.data!.data!.length; i++) {
                      children.add(Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 24),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                            color: const Color(0xffefedf1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data!.data![i].level!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(snapshot.data!.data![i].details!),
                            ExpandablePanel(
                              theme: const ExpandableThemeData(
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center),
                              header: const Text(
                                'Más información',
                              ),
                              collapsed: const SizedBox(),
                              expanded: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'A continuación se presenta un resumen con la cantidad de preguntas, las respuestas correctas y la fecha en que se realizó la actividad.',
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Cantidad de preguntas: ${snapshot.data!.data![i].questionsQty!.toString()}',
                                    ),
                                    Text(
                                      'Cantidad de preguntas correctas: ${snapshot.data!.data![i].questionsCount!.toString()}',
                                    ),
                                    Text(
                                      'Fecha de realización: ${snapshot.data!.data![i].createdAt!.day.toString()}-${snapshot.data!.data![i].createdAt!.month.toString()}-${snapshot.data!.data![i].createdAt!.year.toString()}',
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                    }
                    return Column(
                      children: children.isNotEmpty
                          ? children
                          : [
                              const Center(
                                  child: Text(
                                'No hay resultados disponibles...',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              )),
                            ],
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BarCharts extends StatefulWidget {
  const BarCharts({
    super.key,
    required this.isProfessor,
    required this.userId,
    required this.statsFuture,
  });

  @override
  State<BarCharts> createState() => _BarChartsState();

  final bool isProfessor;
  final String userId;
  final Future<StatsResponse?> statsFuture;
}

class _BarChartsState extends State<BarCharts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.statsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Container(
              padding: const EdgeInsets.only(
                  top: 48, bottom: 24, left: 24, right: 24),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(100, 220, 220, 220),
                  borderRadius: BorderRadius.circular(24)),
              height: 300,
            );
          }
          List lengths = [];
          lengths.add(snapshot.data!.day1!.count);
          lengths.add(snapshot.data!.day2!.count);
          lengths.add(snapshot.data!.day3!.count);
          lengths.add(snapshot.data!.day4!.count);
          lengths.add(snapshot.data!.day5!.count);
          lengths.add(snapshot.data!.day6!.count);
          lengths.add(snapshot.data!.day7!.count);

          lengths.sort((a, b) => b.compareTo(a));
          return Container(
            padding:
                const EdgeInsets.only(top: 48, bottom: 24, left: 24, right: 24),
            decoration: BoxDecoration(
                color: const Color.fromARGB(100, 220, 220, 220),
                borderRadius: BorderRadius.circular(24)),
            height: 300,
            child: BarChart(
              BarChartData(
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false)),
                      leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() == 0) {
                            return const Text('');
                          }
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(color: Colors.black45),
                          );
                        },
                      )),
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() == 0) {
                            return const Text('');
                          } else if (value.toInt() == 1) {
                            return const Text(
                              'Ayer',
                              style: TextStyle(color: Colors.black45),
                            );
                          }
                          return const Text(
                            'Hoy',
                            style: TextStyle(color: Colors.black45),
                          );
                        },
                      ))),
                  gridData: const FlGridData(drawVerticalLine: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                          toY: snapshot.data!.day7!.count!.toDouble(),
                          width: 30,
                          borderRadius: BorderRadius.circular(8),
                          color: widget.isProfessor
                              ? AppColors.green
                              : AppColors.red,
                          backDrawRodData: BackgroundBarChartRodData(
                            toY: lengths.first.toDouble(),
                            show: true,
                            color: Colors.black12,
                          ))
                    ]),
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                          toY: snapshot.data!.day6!.count!.toDouble(),
                          width: 30,
                          borderRadius: BorderRadius.circular(8),
                          color: widget.isProfessor
                              ? AppColors.green
                              : AppColors.red,
                          backDrawRodData: BackgroundBarChartRodData(
                            toY: lengths.first.toDouble(),
                            show: true,
                            color: Colors.black12,
                          ))
                    ]),
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                          toY: snapshot.data!.day5!.count!.toDouble(),
                          width: 30,
                          borderRadius: BorderRadius.circular(8),
                          color: widget.isProfessor
                              ? AppColors.green
                              : AppColors.red,
                          backDrawRodData: BackgroundBarChartRodData(
                            toY: lengths.first.toDouble(),
                            show: true,
                            color: Colors.black12,
                          ))
                    ]),
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                          toY: snapshot.data!.day4!.count!.toDouble(),
                          width: 30,
                          borderRadius: BorderRadius.circular(8),
                          color: widget.isProfessor
                              ? AppColors.green
                              : AppColors.red,
                          backDrawRodData: BackgroundBarChartRodData(
                            toY: lengths.first.toDouble(),
                            show: true,
                            color: Colors.black12,
                          ))
                    ]),
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(
                          toY: snapshot.data!.day3!.count!.toDouble(),
                          width: 30,
                          borderRadius: BorderRadius.circular(8),
                          color: widget.isProfessor
                              ? AppColors.green
                              : AppColors.red,
                          backDrawRodData: BackgroundBarChartRodData(
                            toY: lengths.first.toDouble(),
                            show: true,
                            color: Colors.black12,
                          ))
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(
                          toY: snapshot.data!.day2!.count!.toDouble(),
                          width: 30,
                          borderRadius: BorderRadius.circular(8),
                          color: widget.isProfessor
                              ? AppColors.green
                              : AppColors.red,
                          backDrawRodData: BackgroundBarChartRodData(
                            toY: lengths.first.toDouble(),
                            show: true,
                            color: Colors.black12,
                          ))
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(
                          toY: snapshot.data!.day1!.count!.toDouble(),
                          width: 30,
                          borderRadius: BorderRadius.circular(8),
                          color: widget.isProfessor
                              ? AppColors.green
                              : AppColors.red,
                          backDrawRodData: BackgroundBarChartRodData(
                            toY: lengths.first.toDouble(),
                            show: true,
                            color: Colors.black12,
                          ))
                    ]),
                  ]),
              swapAnimationDuration:
                  const Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            ),
          );
        });
  }
}
