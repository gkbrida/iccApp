import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'services_model.dart';
export 'services_model.dart';

class ServicesWidget extends StatefulWidget {
  const ServicesWidget({super.key});

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  late ServicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServicesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFF4210FB),
          automaticallyImplyLeading: false,
          title: Text(
            'Mes services',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            FFButtonWidget(
              onPressed: () async {
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.goNamedAuth('login', context.mounted);
              },
              text: 'Button',
              options: FFButtonOptions(
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: AuthUserStreamWidget(
            builder: (context) => StreamBuilder<List<ServicesRecord>>(
              stream: queryServicesRecord(
                queryBuilder: (servicesRecord) => servicesRecord
                    .where(
                      'status',
                      isEqualTo: true,
                    )
                    .where(
                      'application',
                      isEqualTo: currentUserDocument?.candidate,
                    ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: SpinKitFadingGrid(
                        color: FlutterFlowTheme.of(context).primary,
                        size: 50.0,
                      ),
                    ),
                  );
                }
                List<ServicesRecord> columnServicesRecordList = snapshot.data!;

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(columnServicesRecordList.length,
                        (columnIndex) {
                      final columnServicesRecord =
                          columnServicesRecordList[columnIndex];
                      return StreamBuilder<DepartmentsRecord>(
                        stream: DepartmentsRecord.getDocument(
                            columnServicesRecord.department!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitFadingGrid(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }

                          final containerDepartmentsRecord = snapshot.data!;

                          return Container(
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 15.0, 16.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (columnServicesRecord.departmentName ==
                                      'Intégration') {
                                    if ((containerDepartmentsRecord.manager ==
                                            currentUserDocument?.candidate) ||
                                        (containerDepartmentsRecord.second ==
                                            currentUserDocument?.candidate)) {
                                      context.pushNamed(
                                        'integrationRespo',
                                        queryParameters: {
                                          'idDpt': serializeParam(
                                            columnServicesRecord.department,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );
                                    } else {
                                      _model.group =
                                          await queryGroupsRecordOnce(
                                        queryBuilder: (groupsRecord) =>
                                            groupsRecord
                                                .where(
                                                  'manager',
                                                  isEqualTo: currentUserDocument
                                                      ?.candidate,
                                                )
                                                .where(
                                                  'department',
                                                  isEqualTo:
                                                      columnServicesRecord
                                                          .department,
                                                ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.group?.reference != null) {
                                        context.pushNamed(
                                          'integrationRg',
                                          queryParameters: {
                                            'idDpt': serializeParam(
                                              columnServicesRecord.department,
                                              ParamType.DocumentReference,
                                            ),
                                            'idGroup': serializeParam(
                                              _model.group?.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        context.pushNamed(
                                          'integrationC',
                                          queryParameters: {
                                            'dptID': serializeParam(
                                              columnServicesRecord.department,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    }
                                  } else {
                                    if (columnServicesRecord.departmentName ==
                                        'RH') {
                                      context.pushNamed('dashRH');
                                    } else {
                                      if (columnServicesRecord.departmentName ==
                                          'Coordination générale') {
                                        context.pushNamed('events');

                                        FFAppState().eventStarFilted = true;
                                        safeSetState(() {});
                                      } else {
                                        if (columnServicesRecord
                                                .departmentName ==
                                            'Impact junior') {
                                          context.pushNamed('ijevent');
                                        } else {
                                          if (columnServicesRecord
                                                  .departmentName ==
                                              'Accueil') {
                                            context.pushNamed('eccueilevent');
                                          } else {
                                            if (columnServicesRecord
                                                    .departmentName ==
                                                'Staff pastoral') {
                                              context.pushNamed('DashPasta');
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 5.0,
                                        color: Color(0x3416202A),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              columnServicesRecord
                                                  .departmentName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 17.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.9, 0.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
