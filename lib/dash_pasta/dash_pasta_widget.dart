import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dash_pasta_model.dart';
export 'dash_pasta_model.dart';

class DashPastaWidget extends StatefulWidget {
  const DashPastaWidget({super.key});

  @override
  State<DashPastaWidget> createState() => _DashPastaWidgetState();
}

class _DashPastaWidgetState extends State<DashPastaWidget> {
  late DashPastaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashPastaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EventsRecord>>(
      stream: queryEventsRecord(
        queryBuilder: (eventsRecord) => eventsRecord.where(
          'end_date',
          isLessThanOrEqualTo: getCurrentTimestamp,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingGrid(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<EventsRecord> dashPastaEventsRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: const Color(0xFF4210FB),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                'Suivi',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: StreamBuilder<List<AccueilRecord>>(
                            stream: queryAccueilRecord(
                              queryBuilder: (accueilRecord) => accueilRecord
                                  .whereIn(
                                      'event',
                                      dashPastaEventsRecordList
                                          .map((e) => e.reference)
                                          .toList())
                                  .orderBy('eventDate', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFadingGrid(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<AccueilRecord> containerAccueilRecordList =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      offset: const Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 0.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 6.0),
                                        child: Text(
                                          'Participants ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          (containerAccueilRecordList
                                                      .last.nbHomme +
                                                  containerAccueilRecordList
                                                      .last.nbFemme +
                                                  containerAccueilRecordList
                                                      .last.nbEnfant)
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 100.0,
                                        child: FlutterFlowBarChart(
                                          barData: [
                                            FFBarChartData(
                                              yData:
                                                  functions.newCustomFunction4(
                                                      containerAccueilRecordList
                                                          .toList())!,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            )
                                          ],
                                          xLabels: containerAccueilRecordList
                                              .map((e) => e.eventDate)
                                              .withoutNulls
                                              .toList()
                                              .map((e) => e.toString())
                                              .toList(),
                                          barWidth: 16.0,
                                          barBorderRadius:
                                              BorderRadius.circular(8.0),
                                          groupSpace: 8.0,
                                          alignment:
                                              BarChartAlignment.spaceAround,
                                          chartStylingInfo: ChartStylingInfo(
                                            enableTooltip: true,
                                            tooltipBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            showBorder: false,
                                          ),
                                          axisBounds: const AxisBounds(),
                                          xAxisLabelInfo: const AxisLabelInfo(
                                            reservedSize: 28.0,
                                          ),
                                          yAxisLabelInfo: const AxisLabelInfo(
                                            reservedSize: 42.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: StreamBuilder<List<NewcomersRecord>>(
                            stream: queryNewcomersRecord(
                              queryBuilder: (newcomersRecord) => newcomersRecord
                                  .whereIn(
                                      'recuAu',
                                      dashPastaEventsRecordList
                                          .map((e) => e.reference)
                                          .toList())
                                  .orderBy('eventDate', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFadingGrid(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<NewcomersRecord>
                                  containerNewcomersRecordList = snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      offset: const Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 0.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 6.0),
                                        child: Text(
                                          'Nouveaux convertis',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          containerNewcomersRecordList
                                              .where((e) =>
                                                  (e.recuAu ==
                                                      dashPastaEventsRecordList
                                                          .last.reference) &&
                                                  (e.ncNa == 'NC'))
                                              .toList()
                                              .length
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 100.0,
                                        child: FlutterFlowLineChart(
                                          data: [
                                            FFLineChartData(
                                              xData: dashPastaEventsRecordList
                                                  .unique((e) => e.reference)
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.startDate!,
                                                      desc: true)
                                                  .map((e) => e.startDate)
                                                  .withoutNulls
                                                  .toList(),
                                              yData: functions.convertis(
                                                  dashPastaEventsRecordList
                                                      .toList(),
                                                  containerNewcomersRecordList
                                                      .toList())!,
                                              settings: LineChartBarData(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                barWidth: 2.0,
                                                isCurved: true,
                                                dotData: const FlDotData(show: false),
                                                belowBarData: BarAreaData(
                                                  show: true,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                ),
                                              ),
                                            )
                                          ],
                                          chartStylingInfo: ChartStylingInfo(
                                            enableTooltip: true,
                                            tooltipBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            showBorder: false,
                                          ),
                                          axisBounds: const AxisBounds(),
                                          xAxisLabelInfo: const AxisLabelInfo(
                                            reservedSize: 32.0,
                                          ),
                                          yAxisLabelInfo: const AxisLabelInfo(
                                            reservedSize: 40.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: StreamBuilder<List<NewcomersRecord>>(
                            stream: queryNewcomersRecord(
                              queryBuilder: (newcomersRecord) => newcomersRecord
                                  .whereIn(
                                      'recuAu',
                                      dashPastaEventsRecordList
                                          .map((e) => e.reference)
                                          .toList())
                                  .orderBy('eventDate', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFadingGrid(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<NewcomersRecord>
                                  containerNewcomersRecordList = snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      offset: const Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 0.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 6.0),
                                        child: Text(
                                          'Nouveau arrivants',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          containerNewcomersRecordList
                                              .where((e) =>
                                                  (e.recuAu ==
                                                      dashPastaEventsRecordList
                                                          .last.reference) &&
                                                  (e.ncNa == 'NA'))
                                              .toList()
                                              .length
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 100.0,
                                        child: FlutterFlowBarChart(
                                          barData: [
                                            FFBarChartData(
                                              yData: functions
                                                  .newCustomFunction3Copy(
                                                      dashPastaEventsRecordList
                                                          .toList(),
                                                      containerNewcomersRecordList
                                                          .toList())!,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            )
                                          ],
                                          xLabels: dashPastaEventsRecordList
                                              .unique((e) => e.reference)
                                              .sortedList(
                                                  keyOf: (e) => e.startDate!,
                                                  desc: true)
                                              .map((e) => e.startDate)
                                              .withoutNulls
                                              .toList()
                                              .map((e) => e.toString())
                                              .toList(),
                                          barWidth: 16.0,
                                          barBorderRadius:
                                              BorderRadius.circular(8.0),
                                          groupSpace: 8.0,
                                          alignment:
                                              BarChartAlignment.spaceAround,
                                          chartStylingInfo: ChartStylingInfo(
                                            enableTooltip: true,
                                            tooltipBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            showBorder: false,
                                          ),
                                          axisBounds: const AxisBounds(),
                                          xAxisLabelInfo: const AxisLabelInfo(
                                            reservedSize: 28.0,
                                          ),
                                          yAxisLabelInfo: const AxisLabelInfo(
                                            reservedSize: 42.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: StreamBuilder<List<EventStarRecord>>(
                            stream: queryEventStarRecord(
                              queryBuilder: (eventStarRecord) => eventStarRecord
                                  .whereIn(
                                      'event',
                                      dashPastaEventsRecordList
                                          .map((e) => e.reference)
                                          .toList())
                                  .orderBy('event_date', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFadingGrid(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<EventStarRecord>
                                  containerEventStarRecordList = snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      offset: const Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 0.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 0.0, 6.0),
                                        child: Text(
                                          'S.T.A.R',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          containerEventStarRecordList
                                              .where((e) =>
                                                  e.event ==
                                                  dashPastaEventsRecordList
                                                      .last.reference)
                                              .toList()
                                              .length
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 100.0,
                                        child: FlutterFlowLineChart(
                                          data: [
                                            FFLineChartData(
                                              xData: dashPastaEventsRecordList
                                                  .unique((e) => e.reference)
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.startDate!,
                                                      desc: true)
                                                  .map((e) => e.startDate)
                                                  .withoutNulls
                                                  .toList(),
                                              yData: functions.newCustomFunction3(
                                                  dashPastaEventsRecordList
                                                      .toList(),
                                                  containerEventStarRecordList
                                                      .toList())!,
                                              settings: LineChartBarData(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                barWidth: 2.0,
                                                isCurved: true,
                                                dotData: const FlDotData(show: false),
                                                belowBarData: BarAreaData(
                                                  show: true,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                ),
                                              ),
                                            )
                                          ],
                                          chartStylingInfo: ChartStylingInfo(
                                            enableTooltip: true,
                                            tooltipBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            showBorder: false,
                                          ),
                                          axisBounds: const AxisBounds(),
                                          xAxisLabelInfo: const AxisLabelInfo(
                                            reservedSize: 32.0,
                                          ),
                                          yAxisLabelInfo: const AxisLabelInfo(
                                            reservedSize: 40.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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
    );
  }
}
