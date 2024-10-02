import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'indispo_s_t_a_r_model.dart';
export 'indispo_s_t_a_r_model.dart';

class IndispoSTARWidget extends StatefulWidget {
  const IndispoSTARWidget({
    super.key,
    required this.eventName,
    required this.eventID,
  });

  final String? eventName;
  final DocumentReference? eventID;

  @override
  State<IndispoSTARWidget> createState() => _IndispoSTARWidgetState();
}

class _IndispoSTARWidgetState extends State<IndispoSTARWidget> {
  late IndispoSTARModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IndispoSTARModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: AuthUserStreamWidget(
        builder: (context) => StreamBuilder<List<ServicesRecord>>(
          stream: queryServicesRecord(
            queryBuilder: (servicesRecord) => servicesRecord
                .where(
                  'application',
                  isEqualTo: currentUserDocument?.candidate,
                )
                .where(
                  'status',
                  isEqualTo: true,
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
                              0.0, 12.0, 0.0, 0.0),
                          child: Text(
                            'Signaler mon indisponibilité sur ce event : ',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 16.0),
                          child: Text(
                            widget.eventName!,
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
                              child: SwitchListTile.adaptive(
                                value: _model.switchListTileValue ??= true,
                                onChanged: (newValue) async {
                                  safeSetState(() =>
                                      _model.switchListTileValue = newValue);
                                },
                                title: Text(
                                  'Je suis indisponible ',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).alternate,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ),
                            if (_model.switchListTileValue ?? true)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 16.0),
                                child: FlutterFlowDropDown<String>(
                                  controller: _model.namgerValueController ??=
                                      FormFieldController<String>(
                                    _model.namgerValue ??= '',
                                  ),
                                  options: List<String>.from(
                                      createNoteServicesRecordList
                                          .map((e) => e.department?.id)
                                          .withoutNulls
                                          .toList()),
                                  optionLabels: createNoteServicesRecordList
                                      .map((e) => e.departmentName)
                                      .toList(),
                                  onChanged: (val) async {
                                    safeSetState(
                                        () => _model.namgerValue = val);
                                    _model.currentDptID =
                                        await actions.compareDocIDtoRefID(
                                      _model.namgerValue!,
                                      createNoteServicesRecordList
                                          .map((e) => e.department)
                                          .withoutNulls
                                          .toList(),
                                    );
                                    _model.dpt =
                                        await DepartmentsRecord.getDocumentOnce(
                                            _model.currentDptID!);

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
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 44.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.namgerValue == null) {
                                    return;
                                  }
                                  _model.indispo =
                                      await queryIndisposRecordOnce(
                                    queryBuilder: (indisposRecord) =>
                                        indisposRecord
                                            .where(
                                              'star',
                                              isEqualTo: currentUserDocument
                                                  ?.candidate,
                                            )
                                            .where(
                                              'dpt',
                                              isEqualTo: _model.currentDptID,
                                            )
                                            .where(
                                              'event',
                                              isEqualTo: widget.eventID,
                                            ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  if (_model.indispo?.star != null) {
                                    if (!_model.switchListTileValue!) {
                                      await _model.indispo!.reference.delete();
                                    }
                                  } else {
                                    if (_model.switchListTileValue!) {
                                      await IndisposRecord.collection
                                          .doc()
                                          .set(createIndisposRecordData(
                                            star:
                                                currentUserDocument?.candidate,
                                            dpt: _model.currentDptID,
                                            event: widget.eventID,
                                            nomDpt: _model.dpt?.name,
                                          ));
                                    }
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
            );
          },
        ),
      ),
    );
  }
}
