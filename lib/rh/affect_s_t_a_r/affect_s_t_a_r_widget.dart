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
import 'affect_s_t_a_r_model.dart';
export 'affect_s_t_a_r_model.dart';

class AffectSTARWidget extends StatefulWidget {
  const AffectSTARWidget({
    super.key,
    required this.star,
  });

  final ApplicationsRecord? star;

  @override
  State<AffectSTARWidget> createState() => _AffectSTARWidgetState();
}

class _AffectSTARWidgetState extends State<AffectSTARWidget> {
  late AffectSTARModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AffectSTARModel());

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

    return StreamBuilder<List<ServicesRecord>>(
      stream: queryServicesRecord(
        queryBuilder: (servicesRecord) => servicesRecord
            .where(
              'application',
              isEqualTo: widget.star?.reference,
            )
            .where(
              'deleted',
              isEqualTo: false,
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
        List<ServicesRecord> formServicesRecordList = snapshot.data!;

        return Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: StreamBuilder<List<DepartmentsRecord>>(
            stream: queryDepartmentsRecord(
              queryBuilder: (departmentsRecord) => departmentsRecord
                  .where(
                    'church_id',
                    isEqualTo: FFAppState().appChurch,
                  )
                  .whereNotIn(
                      'id',
                      formServicesRecordList
                          .map((e) => e.department)
                          .withoutNulls
                          .toList()),
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
              List<DepartmentsRecord> createNoteDepartmentsRecordList =
                  snapshot.data!;

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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 25.0),
                            child: Text(
                              'Affecter ${widget.star?.firstName} ${widget.star?.lastName}',
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
                                  controller: _model.dptValueController ??=
                                      FormFieldController<String>(
                                    _model.dptValue ??= '',
                                  ),
                                  options: List<String>.from(
                                      createNoteDepartmentsRecordList
                                          .map((e) => e.reference.id)
                                          .toList()),
                                  optionLabels: createNoteDepartmentsRecordList
                                      .map((e) => e.name)
                                      .toList(),
                                  onChanged: (val) async {
                                    safeSetState(() => _model.dptValue = val);
                                    _model.currentDptID =
                                        await actions.compareDocIDtoRefID(
                                      _model.dptValue!,
                                      createNoteDepartmentsRecordList
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
                                  searchHintTextStyle:
                                      FlutterFlowTheme.of(context)
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
                                  hintText: 'Départements',
                                  searchHintText: 'Search for an item...',
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
                                        createBy:
                                            currentUserDocument?.candidate,
                                        application: widget.star?.reference,
                                        department: _model.currentDptID,
                                        status: true,
                                        departmentName: _model.currentDptName,
                                        starName:
                                            '${widget.star?.firstName} ${widget.star?.lastName}',
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
      },
    );
  }
}
