import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'details_event_copy_model.dart';
export 'details_event_copy_model.dart';

class DetailsEventCopyWidget extends StatefulWidget {
  const DetailsEventCopyWidget({
    super.key,
    required this.eventDetails,
    required this.dpt,
  });

  final EventsRecord? eventDetails;
  final DepartmentsRecord? dpt;

  @override
  State<DetailsEventCopyWidget> createState() => _DetailsEventCopyWidgetState();
}

class _DetailsEventCopyWidgetState extends State<DetailsEventCopyWidget>
    with TickerProviderStateMixin {
  late DetailsEventCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsEventCopyModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CompteRenduRecord>>(
      stream: queryCompteRenduRecord(
        queryBuilder: (compteRenduRecord) => compteRenduRecord
            .where(
              'event',
              isEqualTo: widget.eventDetails?.reference,
            )
            .where(
              'dpt',
              isEqualTo: widget.dpt?.reference,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<CompteRenduRecord> detailsEventCopyCompteRenduRecordList =
            snapshot.data!;
        final detailsEventCopyCompteRenduRecord =
            detailsEventCopyCompteRenduRecordList.isNotEmpty
                ? detailsEventCopyCompteRenduRecordList.first
                : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: Visibility(
              visible: !(detailsEventCopyCompteRenduRecord != null),
              child: FloatingActionButton.extended(
                onPressed: () async {
                  context.pushNamed(
                    'comptRendu',
                    queryParameters: {
                      'idDpt': serializeParam(
                        widget.dpt?.reference,
                        ParamType.DocumentReference,
                      ),
                      'nomDpt': serializeParam(
                        widget.dpt?.name,
                        ParamType.String,
                      ),
                      'idevent': serializeParam(
                        widget.eventDetails?.reference,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );
                },
                backgroundColor: FlutterFlowTheme.of(context).primary,
                elevation: 8.0,
                label: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.add_rounded,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    Text(
                      'Compte rendu',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).info,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
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
                    valueOrDefault<String>(
                      widget.eventDetails?.title,
                      '\"\"',
                    ),
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    valueOrDefault<String>(
                      dateTimeFormat(
                        "MMMMEEEEd",
                        widget.eventDetails?.startDate,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      '\"\"',
                    ),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
              actions: [
                Visibility(
                  visible: detailsEventCopyCompteRenduRecord != null,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    child: FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.document_scanner_outlined,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        context.pushNamed(
                          'comptRendu',
                          queryParameters: {
                            'cr': serializeParam(
                              detailsEventCopyCompteRenduRecord,
                              ParamType.Document,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            'cr': detailsEventCopyCompteRenduRecord,
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: StreamBuilder<List<EventStarRecord>>(
                stream: queryEventStarRecord(
                  queryBuilder: (eventStarRecord) => eventStarRecord
                      .where(
                        'event',
                        isEqualTo: widget.eventDetails?.reference,
                      )
                      .where(
                        'dpt',
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
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<EventStarRecord> tabBarEventStarRecordList =
                      snapshot.data!;

                  return Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                          unselectedLabelStyle: const TextStyle(),
                          indicatorColor: FlutterFlowTheme.of(context).primary,
                          padding: const EdgeInsets.all(4.0),
                          tabs: const [
                            Tab(
                              text: 'infos',
                            ),
                            Tab(
                              text: 'S.T.A.R',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 10.0, 16.0, 12.0),
                                              child: Container(
                                                width: double.infinity,
                                                constraints: const BoxConstraints(
                                                  maxWidth: 570.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${dateTimeFormat(
                                                                "MMMEd",
                                                                widget
                                                                    .eventDetails
                                                                    ?.startDate,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )} à ${dateTimeFormat(
                                                                "Hm",
                                                                widget
                                                                    .eventDetails
                                                                    ?.startDate,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Date et heure de début',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 12.0),
                                              child: Container(
                                                width: double.infinity,
                                                constraints: const BoxConstraints(
                                                  maxWidth: 570.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${dateTimeFormat(
                                                                "MMMEd",
                                                                widget
                                                                    .eventDetails
                                                                    ?.endDate,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )}à ${dateTimeFormat(
                                                                "Hm",
                                                                widget
                                                                    .eventDetails
                                                                    ?.endDate,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Date et heure de fin',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 12.0),
                                              child: Container(
                                                width: double.infinity,
                                                constraints: const BoxConstraints(
                                                  maxWidth: 570.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                widget
                                                                    .eventDetails!
                                                                    .place,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Lieu',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 12.0),
                                              child: Container(
                                                width: double.infinity,
                                                constraints: const BoxConstraints(
                                                  maxWidth: 570.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 12.0,
                                                          16.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                widget
                                                                    .eventDetails!
                                                                    .comments,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  'Commentaire',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
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
                                            Divider(
                                              height: 1.0,
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent4,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            StreamBuilder<List<IndisposRecord>>(
                              stream: queryIndisposRecord(
                                queryBuilder: (indisposRecord) => indisposRecord
                                    .where(
                                      'dpt',
                                      isEqualTo: widget.dpt?.reference,
                                    )
                                    .where(
                                      'event',
                                      isEqualTo:
                                          widget.eventDetails?.reference,
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
                                List<IndisposRecord>
                                    containerIndisposRecordList =
                                    snapshot.data!;

                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: StreamBuilder<List<GroupsRecord>>(
                                    stream: queryGroupsRecord(
                                      queryBuilder: (groupsRecord) =>
                                          groupsRecord
                                              .where(
                                                'department',
                                                isEqualTo:
                                                    widget.dpt?.reference,
                                              )
                                              .orderBy('name'),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<GroupsRecord>
                                          containerGroupsRecordList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (containerGroupsRecordList.isNotEmpty)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          'Affecter par groupe',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Switch.adaptive(
                                                          value: _model
                                                                  .switchValue ??=
                                                              (tabBarEventStarRecordList.isNotEmpty) &&
                                                                  (tabBarEventStarRecordList
                                                                          .first
                                                                          .groupAffectation ==
                                                                      true),
                                                          onChanged:
                                                              (tabBarEventStarRecordList.isNotEmpty)
                                                                  ? null
                                                                  : (newValue) async {
                                                                      safeSetState(() =>
                                                                          _model.switchValue =
                                                                              newValue);

                                                                      if (!newValue) {
                                                                        if (tabBarEventStarRecordList.isNotEmpty) {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: const Text('Erreur'),
                                                                                content: const Text('Vous avez déjà des S.T.A.R sur ce événement , merci des les supprimer avant de changer le type d\'affectation'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                    child: const Text('Ok'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          );
                                                                        } else {
                                                                          return;
                                                                        }
                                                                      }
                                                                    },
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          activeTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .accent1,
                                                          inactiveTrackColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          inactiveThumbColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                StreamBuilder<
                                                    List<ServicesRecord>>(
                                                  stream: queryServicesRecord(
                                                    queryBuilder:
                                                        (servicesRecord) =>
                                                            servicesRecord
                                                                .where(
                                                                  'Department',
                                                                  isEqualTo: widget
                                                                      .dpt
                                                                      ?.reference,
                                                                )
                                                                .where(
                                                                  'deleted',
                                                                  isEqualTo:
                                                                      false,
                                                                ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitFadingGrid(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<ServicesRecord>
                                                        cstServicesRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    20.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .inputValueController ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.inputValue ??=
                                                                '',
                                                          ),
                                                          options: List<String>.from(_model
                                                                      .switchValue ==
                                                                  true
                                                              ? containerGroupsRecordList
                                                                  .where((e) => !functions.checkgroupInList(
                                                                      e
                                                                          .reference,
                                                                      tabBarEventStarRecordList
                                                                          .map((e) => e
                                                                              .group)
                                                                          .withoutNulls
                                                                          .toList())!)
                                                                  .toList()
                                                                  .map((e) => e
                                                                      .reference
                                                                      .id)
                                                                  .toList()
                                                              : cstServicesRecordList
                                                                  .where(
                                                                      (e) => !functions.checkStarInList(e.application!, tabBarEventStarRecordList.map((e) => e.star).withoutNulls.toList())! && !functions.checkStarInList(e.application!, containerIndisposRecordList.map((e) => e.star).withoutNulls.toList())!)
                                                                  .toList()
                                                                  .map((e) => e.reference.id)
                                                                  .toList()),
                                                          optionLabels: _model
                                                                      .switchValue ==
                                                                  true
                                                              ? containerGroupsRecordList
                                                                  .where((e) => !functions.checkgroupInList(
                                                                      e
                                                                          .reference,
                                                                      tabBarEventStarRecordList
                                                                          .map((e) => e
                                                                              .group)
                                                                          .withoutNulls
                                                                          .toList())!)
                                                                  .toList()
                                                                  .map((e) =>
                                                                      e.name)
                                                                  .toList()
                                                              : cstServicesRecordList
                                                                  .where((e) =>
                                                                      !functions.checkStarInList(e.application!, tabBarEventStarRecordList.map((e) => e.star).withoutNulls.toList())! &&
                                                                      !functions.checkStarInList(
                                                                          e.application!,
                                                                          containerIndisposRecordList.map((e) => e.star).withoutNulls.toList())!)
                                                                  .toList()
                                                                  .map((e) => e.starName)
                                                                  .toList(),
                                                          onChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.inputValue =
                                                                    val);
                                                            if (_model
                                                                    .switchValue ==
                                                                true) {
                                                              _model.currentGroupID =
                                                                  await actions
                                                                      .compareGroupIDtoRef(
                                                                _model
                                                                    .inputValue!,
                                                                containerGroupsRecordList
                                                                    .map((e) =>
                                                                        e.id)
                                                                    .withoutNulls
                                                                    .toList(),
                                                              );
                                                              _model.currentGroupName =
                                                                  await actions
                                                                      .nameGroupFromRefID(
                                                                context,
                                                                _model
                                                                    .inputValue!,
                                                              );
                                                              _model.groupSTARs =
                                                                  await queryGroupAdvisorRecordOnce(
                                                                queryBuilder:
                                                                    (groupAdvisorRecord) =>
                                                                        groupAdvisorRecord
                                                                            .where(
                                                                  'group',
                                                                  isEqualTo: _model
                                                                      .currentGroupID,
                                                                ),
                                                              );
                                                              _model.indeXGoup =
                                                                  0;
                                                              while (_model
                                                                      .indeXGoup! <=
                                                                  _model
                                                                      .groupSTARs!
                                                                      .length) {
                                                                await EventStarRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set({
                                                                  ...createEventStarRecordData(
                                                                    event: widget
                                                                        .eventDetails
                                                                        ?.reference,
                                                                    dpt: widget
                                                                        .dpt
                                                                        ?.reference,
                                                                    ministry:
                                                                        widget
                                                                            .dpt
                                                                            ?.ministry,
                                                                    dptName:
                                                                        widget
                                                                            .dpt
                                                                            ?.name,
                                                                    createdBy:
                                                                        currentUserDocument
                                                                            ?.candidate,
                                                                    groupAffectation:
                                                                        true,
                                                                    groupName:
                                                                        _model
                                                                            .currentGroupName,
                                                                    star: _model
                                                                        .groupSTARs?[
                                                                            _model.indeXGoup!]
                                                                        .advisor,
                                                                    starName: _model
                                                                        .groupSTARs?[
                                                                            _model.indeXGoup!]
                                                                        .advisorName,
                                                                    eventDate: widget
                                                                        .eventDetails
                                                                        ?.startDate,
                                                                    eventName: widget
                                                                        .eventDetails
                                                                        ?.title,
                                                                    group: _model
                                                                        .currentGroupID,
                                                                  ),
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'created_at':
                                                                          FieldValue
                                                                              .serverTimestamp(),
                                                                    },
                                                                  ),
                                                                });
                                                                _model.indeXGoup =
                                                                    _model.indeXGoup! +
                                                                        1;
                                                              }
                                                            } else {
                                                              _model.currentStarID =
                                                                  await actions
                                                                      .compareServiceIDtoRef(
                                                                _model
                                                                    .inputValue!,
                                                                cstServicesRecordList
                                                                    .map((e) =>
                                                                        e.reference)
                                                                    .toList(),
                                                              );
                                                              _model.currentStarService =
                                                                  await ServicesRecord
                                                                      .getDocumentOnce(
                                                                          _model
                                                                              .currentStarID!);

                                                              await EventStarRecord
                                                                  .collection
                                                                  .doc()
                                                                  .set({
                                                                ...createEventStarRecordData(
                                                                  event: widget
                                                                      .eventDetails
                                                                      ?.reference,
                                                                  dpt: widget
                                                                      .dpt
                                                                      ?.reference,
                                                                  ministry: widget
                                                                      .dpt
                                                                      ?.ministry,
                                                                  dptName:
                                                                      widget
                                                                          .dpt
                                                                          ?.name,
                                                                  createdBy:
                                                                      currentUserDocument
                                                                          ?.candidate,
                                                                  groupAffectation:
                                                                      true,
                                                                  star: _model
                                                                      .currentStarService
                                                                      ?.application,
                                                                  starName: _model
                                                                      .currentStarService
                                                                      ?.starName,
                                                                  eventDate: widget
                                                                      .eventDetails
                                                                      ?.startDate,
                                                                  eventName: widget
                                                                      .eventDetails
                                                                      ?.title,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'created_at':
                                                                        FieldValue
                                                                            .serverTimestamp(),
                                                                  },
                                                                ),
                                                              });
                                                            }

                                                            safeSetState(() {
                                                              _model
                                                                  .inputValueController
                                                                  ?.reset();
                                                            });

                                                            safeSetState(() {});
                                                          },
                                                          width:
                                                              double.infinity,
                                                          height: 56.0,
                                                          searchHintTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          searchTextStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          hintText: _model
                                                                      .switchValue ==
                                                                  true
                                                              ? 'Rechercher un groupe'
                                                              : 'Rechercher une S.T.A.R',
                                                          searchHintText: (containerGroupsRecordList.isNotEmpty
                                                                  ? (_model
                                                                          .switchValue ==
                                                                      false)
                                                                  : true)
                                                              ? 'Rechercher une S.T.A.R'
                                                              : 'Rechercher un groupe',
                                                          icon: Icon(
                                                            Icons.search_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          borderWidth: 2.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      4.0,
                                                                      16.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isOverButton: true,
                                                          isSearchable: true,
                                                          isMultiSelect: false,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Container(
                                                  height: 738.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final selectedEventStar =
                                                          tabBarEventStarRecordList
                                                              .map((e) => e)
                                                              .toList();

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            selectedEventStar
                                                                .length,
                                                        itemBuilder: (context,
                                                            selectedEventStarIndex) {
                                                          final selectedEventStarItem =
                                                              selectedEventStar[
                                                                  selectedEventStarIndex];
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        12.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              constraints:
                                                                  const BoxConstraints(
                                                                maxWidth: 570.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: functions.checkStarInList(
                                                                        selectedEventStarItem
                                                                            .star!,
                                                                        containerIndisposRecordList
                                                                            .map((e) => e
                                                                                .star)
                                                                            .withoutNulls
                                                                            .toList())!
                                                                    ? const Color(
                                                                        0xFFA2A9AE)
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  width: 2.0,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        12.0,
                                                                        16.0,
                                                                        12.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              selectedEventStarItem.starName,
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                            if (selectedEventStarItem.groupName != '')
                                                                              Text(
                                                                                selectedEventStarItem.groupName,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w300,
                                                                                    ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await selectedEventStarItem
                                                                            .reference
                                                                            .delete();
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .close_sharp,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
