import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'accueil_compte_model.dart';
export 'accueil_compte_model.dart';

class AccueilCompteWidget extends StatefulWidget {
  const AccueilCompteWidget({
    super.key,
    required this.event,
  });

  final EventsRecord? event;

  @override
  State<AccueilCompteWidget> createState() => _AccueilCompteWidgetState();
}

class _AccueilCompteWidgetState extends State<AccueilCompteWidget> {
  late AccueilCompteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccueilCompteModel());

    _model.homFocusNode ??= FocusNode();

    _model.femFocusNode ??= FocusNode();

    _model.enfFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AccueilRecord>>(
      stream: queryAccueilRecord(
        queryBuilder: (accueilRecord) => accueilRecord.where(
          'event',
          isEqualTo: widget.event?.reference,
        ),
        singleRecord: true,
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
        List<AccueilRecord> accueilCompteAccueilRecordList = snapshot.data!;
        final accueilCompteAccueilRecord =
            accueilCompteAccueilRecordList.isNotEmpty
                ? accueilCompteAccueilRecordList.first
                : null;

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
              title: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.event!.title,
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    dateTimeFormat(
                      "MMMMEEEEd",
                      widget.event!.startDate!,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).info,
                          fontSize: 13.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              actions: const [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 15.0),
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          maxWidth: 570.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nombre d\'hommes',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderRadius: 8.0,
                                              buttonSize: 50.0,
                                              fillColor: const Color(0xFFE3E5EE),
                                              icon: FaIcon(
                                                FontAwesomeIcons.minus,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              onPressed:
                                                  (accueilCompteAccueilRecord
                                                              ?.nbHomme ==
                                                          0)
                                                      ? null
                                                      : () async {
                                                          if (accueilCompteAccueilRecord !=
                                                              null) {
                                                            await accueilCompteAccueilRecord
                                                                .reference
                                                                .update({
                                                              ...createAccueilRecordData(
                                                                modifiePar:
                                                                    currentUserDocument
                                                                        ?.candidate,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'nbHomme': FieldValue
                                                                      .increment(
                                                                          -(1)),
                                                                  'modifie_le':
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                },
                                                              ),
                                                            });
                                                            safeSetState(() {
                                                              _model.homTextController
                                                                      ?.text =
                                                                  (accueilCompteAccueilRecord
                                                                              .nbHomme -
                                                                          1)
                                                                      .toString();
                                                              _model.homTextController
                                                                      ?.selection =
                                                                  TextSelection.collapsed(
                                                                      offset: _model
                                                                          .homTextController!
                                                                          .text
                                                                          .length);
                                                            });
                                                          }
                                                        },
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                            .homTextController ??=
                                                        TextEditingController(
                                                      text: accueilCompteAccueilRecord !=
                                                              null
                                                          ? accueilCompteAccueilRecord
                                                              .nbHomme
                                                              .toString()
                                                          : '0',
                                                    ),
                                                    focusNode:
                                                        _model.homFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText: '0',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .homTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 8.0,
                                              buttonSize: 50.0,
                                              fillColor: const Color(0xFFE3E5EE),
                                              icon: Icon(
                                                Icons.add,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                if (accueilCompteAccueilRecord !=
                                                    null) {
                                                  await accueilCompteAccueilRecord
                                                      .reference
                                                      .update({
                                                    ...createAccueilRecordData(
                                                      modifiePar:
                                                          currentUserDocument
                                                              ?.candidate,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'nbHomme': FieldValue
                                                            .increment(1),
                                                        'modifie_le': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  safeSetState(() {
                                                    _model.homTextController
                                                            ?.text =
                                                        (accueilCompteAccueilRecord
                                                                    .nbHomme +
                                                                1)
                                                            .toString();
                                                    _model.homTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .homTextController!
                                                                .text
                                                                .length);
                                                  });
                                                } else {
                                                  await AccueilRecord.collection
                                                      .doc()
                                                      .set({
                                                    ...createAccueilRecordData(
                                                      nbHomme: 1,
                                                      event: widget
                                                          .event?.reference,
                                                      creePar:
                                                          currentUserDocument
                                                              ?.candidate,
                                                      eventDate: widget
                                                          .event?.startDate,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'cree_le': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  safeSetState(() {
                                                    _model.homTextController
                                                            ?.text =
                                                        (accueilCompteAccueilRecord!
                                                                    .nbHomme +
                                                                1)
                                                            .toString();
                                                    _model.homTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .homTextController!
                                                                .text
                                                                .length);
                                                  });
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 15.0),
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          maxWidth: 570.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nombre de femmes',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 8.0,
                                              buttonSize: 50.0,
                                              fillColor: const Color(0xFFE3E5EE),
                                              icon: FaIcon(
                                                FontAwesomeIcons.minus,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              onPressed:
                                                  (accueilCompteAccueilRecord
                                                              ?.nbFemme ==
                                                          0)
                                                      ? null
                                                      : () async {
                                                          if (accueilCompteAccueilRecord !=
                                                              null) {
                                                            await accueilCompteAccueilRecord
                                                                .reference
                                                                .update({
                                                              ...createAccueilRecordData(
                                                                modifiePar:
                                                                    currentUserDocument
                                                                        ?.candidate,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'nbFemme': FieldValue
                                                                      .increment(
                                                                          -(1)),
                                                                  'modifie_le':
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                },
                                                              ),
                                                            });
                                                            safeSetState(() {
                                                              _model.femTextController
                                                                      ?.text =
                                                                  accueilCompteAccueilRecord
                                                                      .nbFemme
                                                                      .toString();
                                                              _model.femTextController
                                                                      ?.selection =
                                                                  TextSelection.collapsed(
                                                                      offset: _model
                                                                          .femTextController!
                                                                          .text
                                                                          .length);
                                                            });
                                                          }
                                                        },
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                            .femTextController ??=
                                                        TextEditingController(
                                                      text: accueilCompteAccueilRecord !=
                                                              null
                                                          ? accueilCompteAccueilRecord
                                                              .nbFemme
                                                              .toString()
                                                          : '0',
                                                    ),
                                                    focusNode:
                                                        _model.femFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText: '0',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .femTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 8.0,
                                              buttonSize: 50.0,
                                              fillColor: const Color(0xFFE3E5EE),
                                              icon: Icon(
                                                Icons.add,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                if (accueilCompteAccueilRecord !=
                                                    null) {
                                                  await accueilCompteAccueilRecord
                                                      .reference
                                                      .update({
                                                    ...createAccueilRecordData(
                                                      modifiePar:
                                                          currentUserDocument
                                                              ?.candidate,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'nbFemme': FieldValue
                                                            .increment(1),
                                                        'modifie_le': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  safeSetState(() {
                                                    _model.femTextController
                                                            ?.text =
                                                        accueilCompteAccueilRecord
                                                            .nbFemme
                                                            .toString();
                                                    _model.femTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .femTextController!
                                                                .text
                                                                .length);
                                                  });
                                                } else {
                                                  await AccueilRecord.collection
                                                      .doc()
                                                      .set({
                                                    ...createAccueilRecordData(
                                                      nbFemme: 1,
                                                      event: widget
                                                          .event?.reference,
                                                      creePar:
                                                          currentUserDocument
                                                              ?.candidate,
                                                      eventDate: widget
                                                          .event?.startDate,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'cree_le': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  safeSetState(() {
                                                    _model.femTextController
                                                            ?.text =
                                                        accueilCompteAccueilRecord!
                                                            .nbFemme
                                                            .toString();
                                                    _model.femTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .femTextController!
                                                                .text
                                                                .length);
                                                  });
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 15.0),
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          maxWidth: 570.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 12.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nombre d\'enfants',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 8.0,
                                              buttonSize: 50.0,
                                              fillColor: const Color(0xFFE3E5EE),
                                              icon: FaIcon(
                                                FontAwesomeIcons.minus,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              onPressed:
                                                  (accueilCompteAccueilRecord
                                                              ?.nbEnfant ==
                                                          0)
                                                      ? null
                                                      : () async {
                                                          if (accueilCompteAccueilRecord !=
                                                              null) {
                                                            await accueilCompteAccueilRecord
                                                                .reference
                                                                .update({
                                                              ...createAccueilRecordData(
                                                                modifiePar:
                                                                    currentUserDocument
                                                                        ?.candidate,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'nbEnfant': FieldValue
                                                                      .increment(
                                                                          -(1)),
                                                                  'modifie_le':
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                },
                                                              ),
                                                            });
                                                            safeSetState(() {
                                                              _model.enfTextController
                                                                      ?.text =
                                                                  accueilCompteAccueilRecord
                                                                      .nbEnfant
                                                                      .toString();
                                                              _model.enfTextController
                                                                      ?.selection =
                                                                  TextSelection.collapsed(
                                                                      offset: _model
                                                                          .enfTextController!
                                                                          .text
                                                                          .length);
                                                            });
                                                          }
                                                        },
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: SizedBox(
                                                  width: 200.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                            .enfTextController ??=
                                                        TextEditingController(
                                                      text: accueilCompteAccueilRecord !=
                                                              null
                                                          ? accueilCompteAccueilRecord
                                                              .nbEnfant
                                                              .toString()
                                                          : '0',
                                                    ),
                                                    focusNode:
                                                        _model.enfFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText: '0',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      filled: true,
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    textAlign: TextAlign.center,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    validator: _model
                                                        .enfTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 8.0,
                                              buttonSize: 50.0,
                                              fillColor: const Color(0xFFE3E5EE),
                                              icon: Icon(
                                                Icons.add,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                if (accueilCompteAccueilRecord !=
                                                    null) {
                                                  await accueilCompteAccueilRecord
                                                      .reference
                                                      .update({
                                                    ...createAccueilRecordData(
                                                      modifiePar:
                                                          currentUserDocument
                                                              ?.candidate,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'nbEnfant': FieldValue
                                                            .increment(1),
                                                        'modifie_le': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  safeSetState(() {
                                                    _model.enfTextController
                                                            ?.text =
                                                        accueilCompteAccueilRecord
                                                            .nbEnfant
                                                            .toString();
                                                    _model.enfTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .enfTextController!
                                                                .text
                                                                .length);
                                                  });
                                                } else {
                                                  await AccueilRecord.collection
                                                      .doc()
                                                      .set({
                                                    ...createAccueilRecordData(
                                                      nbEnfant: 1,
                                                      event: widget
                                                          .event?.reference,
                                                      creePar:
                                                          currentUserDocument
                                                              ?.candidate,
                                                      eventDate: widget
                                                          .event?.startDate,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'cree_le': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  safeSetState(() {
                                                    _model.enfTextController
                                                            ?.text =
                                                        accueilCompteAccueilRecord!
                                                            .nbEnfant
                                                            .toString();
                                                    _model.enfTextController
                                                            ?.selection =
                                                        TextSelection.collapsed(
                                                            offset: _model
                                                                .enfTextController!
                                                                .text
                                                                .length);
                                                  });
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 570.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total adultes',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      accueilCompteAccueilRecord != null
                                          ? (accueilCompteAccueilRecord
                                                      .nbHomme +
                                                  accueilCompteAccueilRecord
                                                      .nbFemme)
                                              .toString()
                                          : '0',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 15.0),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 570.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total global',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      accueilCompteAccueilRecord != null
                                          ? (accueilCompteAccueilRecord
                                                      .nbHomme +
                                                  accueilCompteAccueilRecord
                                                      .nbFemme +
                                                  accueilCompteAccueilRecord
                                                      .nbEnfant)
                                              .toString()
                                          : '0',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 40.0, 16.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (accueilCompteAccueilRecord != null) {
                            await accueilCompteAccueilRecord.reference.update({
                              ...createAccueilRecordData(
                                nbHomme:
                                    int.tryParse(_model.homTextController.text),
                                nbFemme:
                                    int.tryParse(_model.femTextController.text),
                                nbEnfant:
                                    int.tryParse(_model.enfTextController.text),
                                modifiePar: currentUserDocument?.candidate,
                              ),
                              ...mapToFirestore(
                                {
                                  'modifie_le': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                          } else {
                            await AccueilRecord.collection.doc().set({
                              ...createAccueilRecordData(
                                nbHomme:
                                    int.tryParse(_model.homTextController.text),
                                nbFemme:
                                    int.tryParse(_model.femTextController.text),
                                nbEnfant:
                                    int.tryParse(_model.enfTextController.text),
                                event: widget.event?.reference,
                                creePar: currentUserDocument?.candidate,
                                eventDate: widget.event?.startDate,
                              ),
                              ...mapToFirestore(
                                {
                                  'cree_le': FieldValue.serverTimestamp(),
                                },
                              ),
                            });
                          }

                          context.pop();
                        },
                        text: 'Valider',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 55.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
