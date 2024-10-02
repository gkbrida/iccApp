import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'backup_integration_model.dart';
export 'backup_integration_model.dart';

class BackupIntegrationWidget extends StatefulWidget {
  const BackupIntegrationWidget({
    super.key,
    required this.dpt,
  });

  final DocumentReference? dpt;

  @override
  State<BackupIntegrationWidget> createState() =>
      _BackupIntegrationWidgetState();
}

class _BackupIntegrationWidgetState extends State<BackupIntegrationWidget> {
  late BackupIntegrationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackupIntegrationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'kevins',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: const Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      _model.depat = await DepartmentsRecord.getDocumentOnce(widget.dpt!);
      if ((_model.depat?.manager == currentUserDocument?.candidate) ||
          (_model.depat?.second == currentUserDocument?.candidate)) {
        context.pushNamed(
          'integrationRespo',
          queryParameters: {
            'idDpt': serializeParam(
              widget.dpt,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      } else {
        _model.group = await queryGroupsRecordOnce(
          queryBuilder: (groupsRecord) => groupsRecord
              .where(
                'manager',
                isEqualTo: currentUserDocument?.candidate,
              )
              .where(
                'department',
                isEqualTo: widget.dpt,
              ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.group?.reference != null) {
          context.pushNamed(
            'integrationRg',
            queryParameters: {
              'idDpt': serializeParam(
                widget.dpt,
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
                widget.dpt,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        }
      }
    });

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
        body: const SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
