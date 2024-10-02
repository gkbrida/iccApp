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
import 'create_groupe_model.dart';
export 'create_groupe_model.dart';

class CreateGroupeWidget extends StatefulWidget {
  const CreateGroupeWidget({
    super.key,
    required this.dptName,
    required this.dptID,
  });

  final String? dptName;
  final DocumentReference? dptID;

  @override
  State<CreateGroupeWidget> createState() => _CreateGroupeWidgetState();
}

class _CreateGroupeWidgetState extends State<CreateGroupeWidget> {
  late CreateGroupeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateGroupeModel());

    _model.groupTextController ??= TextEditingController();
    _model.groupFocusNode ??= FocusNode();

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

    return StreamBuilder<List<GroupAdvisorRecord>>(
      stream: queryGroupAdvisorRecord(
        queryBuilder: (groupAdvisorRecord) => groupAdvisorRecord.where(
          'dpt',
          isEqualTo: widget.dptID,
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
        List<GroupAdvisorRecord> formGroupAdvisorRecordList = snapshot.data!;

        return Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.always,
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
              height: 434.0,
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 16.0),
                        child: Text(
                          'Créer un nouveau groupe',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: TextFormField(
                                controller: _model.groupTextController,
                                focusNode: _model.groupFocusNode,
                                autofocus: true,
                                autofillHints: const [AutofillHints.telephoneNumber],
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Nom du groupe',
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
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
                                validator: _model.groupTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: StreamBuilder<List<ServicesRecord>>(
                              stream: FFAppState().servStarDpt(
                                uniqueQueryKey: valueOrDefault<String>(
                                  widget.dptID?.id,
                                  '\"\"',
                                ),
                                requestFn: () => queryServicesRecord(
                                  queryBuilder: (servicesRecord) =>
                                      servicesRecord
                                          .where(
                                            'Department',
                                            isEqualTo: widget.dptID,
                                          )
                                          .whereNotIn(
                                              'application',
                                              formGroupAdvisorRecordList
                                                  .map((e) => e.advisor)
                                                  .withoutNulls
                                                  .toList()),
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
                                List<ServicesRecord> namgerServicesRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller: _model.namgerValueController ??=
                                      FormFieldController<String>(
                                    _model.namgerValue ??= '',
                                  ),
                                  options: List<String>.from(
                                      namgerServicesRecordList
                                          .map((e) => e.application?.id)
                                          .withoutNulls
                                          .toList()),
                                  optionLabels: namgerServicesRecordList
                                      .map((e) => e.starName)
                                      .toList(),
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.namgerValue = val);
                                    _model.currentManagerID =
                                        await actions.compareAdvisorIDtoRef(
                                      _model.namgerValue!,
                                      namgerServicesRecordList
                                          .map((e) => e.application)
                                          .withoutNulls
                                          .toList(),
                                    );
                                    _model.currentManagerName =
                                        await actions.nameAppFromRefID(
                                      context,
                                      _model.namgerValue!,
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
                                  hintText: 'Responsable du groupe',
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: StreamBuilder<List<ServicesRecord>>(
                              stream: FFAppState().servStarDpt(
                                uniqueQueryKey: valueOrDefault<String>(
                                  widget.dptID?.id,
                                  '\"\"',
                                ),
                                requestFn: () => queryServicesRecord(
                                  queryBuilder: (servicesRecord) =>
                                      servicesRecord
                                          .where(
                                            'Department',
                                            isEqualTo: widget.dptID,
                                          )
                                          .whereNotIn(
                                              'application',
                                              formGroupAdvisorRecordList
                                                  .map((e) => e.advisor)
                                                  .withoutNulls
                                                  .toList()),
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
                                List<ServicesRecord> secondServicesRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller: _model.secondValueController ??=
                                      FormFieldController<String>(
                                    _model.secondValue ??= '',
                                  ),
                                  options: List<String>.from(
                                      secondServicesRecordList
                                          .map((e) => e.application?.id)
                                          .withoutNulls
                                          .toList()),
                                  optionLabels: secondServicesRecordList
                                      .map((e) => e.starName)
                                      .toList(),
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.secondValue = val);
                                    _model.currentSecondID =
                                        await actions.compareAdvisorIDtoRef(
                                      _model.secondValue!,
                                      secondServicesRecordList
                                          .map((e) => e.application)
                                          .withoutNulls
                                          .toList(),
                                    );
                                    _model.currentSecondName =
                                        await actions.nameAppFromRefID(
                                      context,
                                      _model.secondValue!,
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
                                  hintText: 'Second du groupe',
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 44.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (_model.formKey.currentState == null ||
                                    !_model.formKey.currentState!.validate()) {
                                  return;
                                }
                                if (_model.namgerValue == null) {
                                  return;
                                }

                                var groupsRecordReference =
                                    GroupsRecord.collection.doc();
                                await groupsRecordReference.set({
                                  ...createGroupsRecordData(
                                    name: _model.groupTextController.text,
                                    department: widget.dptID,
                                    manager: _model.currentManagerID,
                                    second: _model.currentSecondID,
                                    createBy: currentUserDocument?.candidate,
                                    departmentName: widget.dptName,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'create_date':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                                _model.currentGroup =
                                    GroupsRecord.getDocumentFromData({
                                  ...createGroupsRecordData(
                                    name: _model.groupTextController.text,
                                    department: widget.dptID,
                                    manager: _model.currentManagerID,
                                    second: _model.currentSecondID,
                                    createBy: currentUserDocument?.candidate,
                                    departmentName: widget.dptName,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'create_date': DateTime.now(),
                                    },
                                  ),
                                }, groupsRecordReference);

                                await _model.currentGroup!.reference
                                    .update(createGroupsRecordData(
                                  id: _model.currentGroup?.reference,
                                ));

                                await GroupAdvisorRecord.collection.doc().set({
                                  ...createGroupAdvisorRecordData(
                                    group: _model.currentGroup?.reference,
                                    advisor: _model.currentManagerID,
                                    createdBy: currentUserDocument?.candidate,
                                    advisorName: _model.currentManagerName,
                                    dpt: widget.dptID,
                                    groupName: _model.groupTextController.text,
                                    church: FFAppState().appChurch,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'create_date':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                                if (_model.secondValue != null &&
                                    _model.secondValue != '') {
                                  await GroupAdvisorRecord.collection
                                      .doc()
                                      .set({
                                    ...createGroupAdvisorRecordData(
                                      group: _model.currentGroup?.reference,
                                      advisor: _model.currentSecondID,
                                      createdBy: currentUserDocument?.candidate,
                                      advisorName: _model.currentSecondName,
                                      dpt: widget.dptID,
                                      groupName:
                                          _model.groupTextController.text,
                                      church: FFAppState().appChurch,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'create_date':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                }
                                Navigator.pop(context);

                                safeSetState(() {});
                              },
                              text: 'Valider',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
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
      },
    );
  }
}
