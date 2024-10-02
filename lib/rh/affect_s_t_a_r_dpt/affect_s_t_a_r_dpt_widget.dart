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
import 'affect_s_t_a_r_dpt_model.dart';
export 'affect_s_t_a_r_dpt_model.dart';

class AffectSTARDptWidget extends StatefulWidget {
  const AffectSTARDptWidget({
    super.key,
    required this.dpt,
  });

  final DepartmentsRecord? dpt;

  @override
  State<AffectSTARDptWidget> createState() => _AffectSTARDptWidgetState();
}

class _AffectSTARDptWidgetState extends State<AffectSTARDptWidget> {
  late AffectSTARDptModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AffectSTARDptModel());

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
      child: StreamBuilder<List<ServicesRecord>>(
        stream: queryServicesRecord(
          queryBuilder: (servicesRecord) => servicesRecord
              .where(
                'churchID',
                isEqualTo: FFAppState().appChurch,
              )
              .where(
                'Department',
                isNotEqualTo: widget.dpt?.reference,
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
          List<ServicesRecord> createNoteServicesRecordList = snapshot.data!;

          return Material(
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
              height: 327.0,
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
                            0.0, 15.0, 0.0, 25.0),
                        child: Text(
                          'Affecter une STAR : ${widget.dpt?.name}',
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
                            child: FlutterFlowDropDown<String>(
                              controller: _model.sstarValueController ??=
                                  FormFieldController<String>(
                                _model.sstarValue ??= '',
                              ),
                              options: List<String>.from(
                                  createNoteServicesRecordList
                                      .map((e) => e.application?.id)
                                      .withoutNulls
                                      .toList()),
                              optionLabels: createNoteServicesRecordList
                                  .map((e) => e.starName)
                                  .toList(),
                              onChanged: (val) async {
                                safeSetState(() => _model.sstarValue = val);
                                _model.currentAppID =
                                    await actions.compareAdvisorIDtoRef(
                                  _model.sstarValue!,
                                  createNoteServicesRecordList
                                      .map((e) => e.application)
                                      .withoutNulls
                                      .toList(),
                                );
                                _model.currentAppName =
                                    await actions.nameAppFromRefID(
                                  context,
                                  _model.sstarValue!,
                                );

                                safeSetState(() {});
                              },
                              width: double.infinity,
                              height: 50.0,
                              searchHintTextStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                              searchTextStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
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
                              searchHintText: 'chercher une STAR',
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
                              isSearchable: true,
                              isMultiSelect: false,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 44.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await ServicesRecord.collection.doc().set({
                                  ...createServicesRecordData(
                                    createBy: currentUserDocument?.candidate,
                                    application: _model.currentAppID,
                                    department: widget.dpt?.reference,
                                    status: true,
                                    departmentName: widget.dpt?.name,
                                    starName: _model.currentAppName,
                                    churchID: FFAppState().appChurch,
                                    deleted: false,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'create_date':
                                          FieldValue.serverTimestamp(),
                                    },
                                  ),
                                });
                                Navigator.pop(context);
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
          );
        },
      ),
    );
  }
}
