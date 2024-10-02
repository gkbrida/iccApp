import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'planif_s_t_a_r_model.dart';
export 'planif_s_t_a_r_model.dart';

class PlanifSTARWidget extends StatefulWidget {
  const PlanifSTARWidget({
    super.key,
    required this.event,
    required this.dpt,
  });

  final EventsRecord? event;
  final DepartmentsRecord? dpt;

  @override
  State<PlanifSTARWidget> createState() => _PlanifSTARWidgetState();
}

class _PlanifSTARWidgetState extends State<PlanifSTARWidget> {
  late PlanifSTARModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanifSTARModel());

    _model.commentTextController ??= TextEditingController();
    _model.commentFocusNode ??= FocusNode();

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
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Text(
                      'Planifier une STAR de ${widget.dpt?.name}',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 20.0),
                    child: Text(
                      'pour ${widget.event?.title} du ${dateTimeFormat(
                        "d/M/y",
                        widget.event?.startDate,
                        locale: FFLocalizations.of(context).languageCode,
                      )}',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Poppins',
                            fontSize: 20.0,
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
                                _model.typeIntervenantValue ??= '0',
                              ),
                              options: List<String>.from(['0', '1']),
                              optionLabels: const ['S.T.A.R', 'Groupe'],
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
                          if (_model.typeIntervenantValue == '1')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: StreamBuilder<List<GroupsRecord>>(
                                stream: queryGroupsRecord(
                                  queryBuilder: (groupsRecord) =>
                                      groupsRecord.where(
                                    'department',
                                    isEqualTo: widget.dpt?.reference,
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
                                  List<GroupsRecord> groupGroupsRecordList =
                                      snapshot.data!;

                                  return FlutterFlowDropDown<String>(
                                    controller: _model.groupValueController ??=
                                        FormFieldController<String>(
                                      _model.groupValue ??= '',
                                    ),
                                    options: List<String>.from(
                                        groupGroupsRecordList
                                            .map((e) => e.reference.id)
                                            .toList()),
                                    optionLabels: groupGroupsRecordList
                                        .map((e) => e.name)
                                        .toList(),
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.groupValue = val);
                                      _model.currentGroupID =
                                          await actions.compareGroupIDtoRef(
                                        _model.groupValue!,
                                        groupGroupsRecordList
                                            .map((e) => e.reference)
                                            .toList(),
                                      );
                                      _model.currentGroupName =
                                          await actions.nameGroupFromRefID(
                                        context,
                                        _model.groupValue!,
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
                                    hintText: 'Groupe',
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
                          if (_model.typeIntervenantValue == '0')
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
                                          )
                                          .where(
                                            'Department',
                                            isEqualTo: widget.dpt?.reference,
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
                                  controller: _model.commentTextController,
                                  focusNode: _model.commentFocusNode,
                                  autofocus: true,
                                  autofillHints: const [
                                    AutofillHints.telephoneNumber
                                  ],
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Commentaire',
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
                                      .commentTextControllerValidator
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
                              await EventStarRecord.collection.doc().set({
                                ...createEventStarRecordData(
                                  event: widget.event?.reference,
                                  star: _model.currentSTARID,
                                  dpt: widget.dpt?.reference,
                                  ministry: widget.dpt?.ministry,
                                  starName: _model.currentStarName,
                                  dptName: widget.dpt?.name,
                                  createdBy: currentUserDocument?.candidate,
                                  comment: _model.commentTextController.text,
                                ),
                                ...mapToFirestore(
                                  {
                                    'created_at': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            } else {
                              await EventStarRecord.collection.doc().set({
                                ...createEventStarRecordData(
                                  event: widget.event?.reference,
                                  dpt: widget.dpt?.reference,
                                  ministry: widget.dpt?.ministry,
                                  dptName: widget.dpt?.name,
                                  createdBy: currentUserDocument?.candidate,
                                  comment: _model.commentTextController.text,
                                  group: _model.currentGroupID,
                                  groupName: _model.currentGroupName,
                                ),
                                ...mapToFirestore(
                                  {
                                    'created_at': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                            }

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
