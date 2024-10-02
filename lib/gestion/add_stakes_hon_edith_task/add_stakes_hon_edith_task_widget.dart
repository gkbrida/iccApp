import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'add_stakes_hon_edith_task_model.dart';
export 'add_stakes_hon_edith_task_model.dart';

class AddStakesHonEdithTaskWidget extends StatefulWidget {
  const AddStakesHonEdithTaskWidget({
    super.key,
    required this.session,
    required this.outline,
    required this.description,
    required this.duree,
    required this.startDate,
    required this.task,
  });

  final EventSessionsRecord? session;
  final OutlinesRecord? outline;
  final String? description;
  final int? duree;
  final DateTime? startDate;
  final EventTasksRecord? task;

  @override
  State<AddStakesHonEdithTaskWidget> createState() =>
      _AddStakesHonEdithTaskWidgetState();
}

class _AddStakesHonEdithTaskWidgetState
    extends State<AddStakesHonEdithTaskWidget> {
  late AddStakesHonEdithTaskModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddStakesHonEdithTaskModel());

    _model.nomExterneTextController ??= TextEditingController();
    _model.nomExterneFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 846.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 20.0),
                    child: Text(
                      'Ajouter un intervenant',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: FlutterFlowDropDown<String>(
                              controller:
                                  _model.typeIntervenantValueController ??=
                                      FormFieldController<String>(
                                _model.typeIntervenantValue ??= '',
                              ),
                              options: List<String>.from(['0', '1', '2']),
                              optionLabels: const [
                                'Département ',
                                'S.T.A.R',
                                'Invité(e)'
                              ],
                              onChanged: (val) => safeSetState(
                                  () => _model.typeIntervenantValue = val),
                              width: double.infinity,
                              height: 50.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              hintText: 'Type d\'intervenant',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              elevation: 2.0,
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                          if (_model.typeIntervenantValue == '0')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: StreamBuilder<List<DepartmentsRecord>>(
                                stream: queryDepartmentsRecord(
                                  queryBuilder: (departmentsRecord) =>
                                      departmentsRecord.where(
                                    'church',
                                    isEqualTo: FFAppState().appChurch?.id,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<DepartmentsRecord>
                                      dptDepartmentsRecordList = snapshot.data!;

                                  return FlutterFlowDropDown<String>(
                                    controller: _model.dptValueController ??=
                                        FormFieldController<String>(
                                      _model.dptValue ??= '',
                                    ),
                                    options: List<String>.from(
                                        dptDepartmentsRecordList
                                            .map((e) => e.reference.id)
                                            .toList()),
                                    optionLabels: dptDepartmentsRecordList
                                        .map((e) => e.name)
                                        .toList(),
                                    onChanged: (val) async {
                                      safeSetState(() => _model.dptValue = val);
                                      _model.currentDptID =
                                          await actions.compareDocIDtoRefID(
                                        _model.dptValue!,
                                        dptDepartmentsRecordList
                                            .map((e) => e.reference)
                                            .toList(),
                                      );
                                      _model.currentDptName =
                                          await actions.nameDocFromRefID(
                                        context,
                                        _model.dptValue!,
                                      );

                                      safeSetState(() {});
                                    },
                                    width: double.infinity,
                                    height: 50.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    hintText: 'Departement',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            ),
                          if (_model.typeIntervenantValue == '1')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: StreamBuilder<List<ServicesRecord>>(
                                stream: queryServicesRecord(
                                  queryBuilder: (servicesRecord) =>
                                      servicesRecord
                                          .where(
                                            'status',
                                            isEqualTo: true,
                                          )
                                          .where(
                                            'churchID',
                                            isEqualTo: FFAppState().appChurch,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ServicesRecord> starServicesRecordList =
                                      snapshot.data!;

                                  return FlutterFlowDropDown<String>(
                                    controller: _model.starValueController ??=
                                        FormFieldController<String>(
                                      _model.starValue ??= '',
                                    ),
                                    options: List<String>.from(
                                        starServicesRecordList
                                            .map((e) => e.application?.id)
                                            .withoutNulls
                                            .toList()),
                                    optionLabels: starServicesRecordList
                                        .map((e) => e.starName)
                                        .toList(),
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.starValue = val);
                                      _model.currentSTARID =
                                          await actions.compareAdvisorIDtoRef(
                                        _model.starValue!,
                                        starServicesRecordList
                                            .map((e) => e.application)
                                            .withoutNulls
                                            .toList(),
                                      );
                                      _model.currentStarName =
                                          await actions.nameAppFromRefID(
                                        context,
                                        _model.starValue!,
                                      );

                                      safeSetState(() {});
                                    },
                                    width: double.infinity,
                                    height: 50.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    hintText: 'S.T.A.R',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            ),
                          if (_model.typeIntervenantValue == '2')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.nomExterneTextController,
                                  focusNode: _model.nomExterneFocusNode,
                                  autofocus: true,
                                  autofillHints: const [
                                    AutofillHints.telephoneNumber
                                  ],
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nom et Prenoms de l\'externe',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0.0,
                                      ),
                                  textAlign: TextAlign.start,
                                  maxLines: null,
                                  validator: _model
                                      .nomExterneTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 44.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.typeIntervenantValue == '0') {
                              FFAppState()
                                  .addToInterveantDptName(_model.dptValue!);
                              safeSetState(() {});
                            } else {
                              if (_model.typeIntervenantValue == '1') {
                                FFAppState()
                                    .addToInterveantDptName(_model.starValue!);
                                safeSetState(() {});
                              } else {
                                FFAppState().addToStakeholders(
                                    _model.nomExterneTextController.text);
                                safeSetState(() {});
                              }
                            }

                            await widget.task!.reference
                                .update(createEventTasksRecordData(
                              description: widget.description,
                              duree: widget.duree,
                              startDate: widget.startDate,
                            ));

                            await StakeholdersRecord.collection.doc().set({
                              ...createStakeholdersRecordData(
                                invite: _model.nomExterneTextController.text,
                                typeStakeholder: _model.typeIntervenantValue,
                                createdBy: currentUserDocument?.candidate,
                                star: _model.currentSTARID,
                                dpt: _model.currentDptID,
                                starName: _model.currentStarName,
                                dptName: _model.currentDptName,
                                tasks: widget.task?.reference,
                              ),
                              ...mapToFirestore(
                                {
                                  'created_date': FieldValue.serverTimestamp(),
                                },
                              ),
                            });

                            await widget.outline!.reference
                                .update(createOutlinesRecordData(
                              lastTaskDate: functions.computeLastDate(
                                  widget.startDate, widget.duree),
                            ));
                            Navigator.pop(context);
                          },
                          text: 'Ajouter',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
