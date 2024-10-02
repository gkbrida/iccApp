import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const LoginWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          requireAuth: true,
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'page2',
          path: '/page2',
          requireAuth: true,
          builder: (context, params) => const Page2Widget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'application',
          path: '/application',
          requireAuth: true,
          builder: (context, params) => const ApplicationWidget(),
        ),
        FFRoute(
          name: 'validatedCand',
          path: '/validatedCand',
          requireAuth: true,
          builder: (context, params) => const ValidatedCandWidget(),
        ),
        FFRoute(
          name: 'manag_appl',
          path: '/managAppl',
          requireAuth: true,
          builder: (context, params) => const ManagApplWidget(),
        ),
        FFRoute(
          name: 'DetailsApplic',
          path: '/detailsApplic',
          requireAuth: true,
          asyncParams: {
            'applicDetails':
                getDoc(['applications'], ApplicationsRecord.fromSnapshot),
          },
          builder: (context, params) => DetailsApplicWidget(
            applicDetails: params.getParam(
              'applicDetails',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ForgotPassword',
          path: '/forgotPassword',
          requireAuth: true,
          builder: (context, params) => const ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Profile')
              : const ProfileWidget(),
        ),
        FFRoute(
          name: 'planning',
          path: '/planning',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'planning')
              : const PlanningWidget(),
        ),
        FFRoute(
          name: 'services',
          path: '/services',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'services')
              : const ServicesWidget(),
        ),
        FFRoute(
          name: 'DetailsNewComer',
          path: '/detailsNewComer',
          requireAuth: true,
          builder: (context, params) => DetailsNewComerWidget(
            newComeriD: params.getParam(
              'newComeriD',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['newcomers'],
            ),
            affect: params.getParam(
              'affect',
              ParamType.bool,
            ),
            dtpID: params.getParam(
              'dtpID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['departments'],
            ),
            isManager: params.getParam(
              'isManager',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'traningNewComer',
          path: '/traningNewComer',
          requireAuth: true,
          builder: (context, params) => TraningNewComerWidget(
            idnewComer: params.getParam(
              'idnewComer',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['newcomers'],
            ),
            nom: params.getParam(
              'nom',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'interactionNewComer',
          path: '/interactionNewComer',
          requireAuth: true,
          builder: (context, params) => InteractionNewComerWidget(
            idnewComer: params.getParam(
              'idnewComer',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['newcomers'],
            ),
            nom: params.getParam(
              'nom',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'trackingNewComer',
          path: '/trackingNewComer',
          requireAuth: true,
          builder: (context, params) => TrackingNewComerWidget(
            id: params.getParam(
              'id',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['newcomers'],
            ),
            nom: params.getParam(
              'nom',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'dashRH',
          path: '/dashRH',
          requireAuth: true,
          builder: (context, params) => const DashRHWidget(),
        ),
        FFRoute(
          name: 'mondepartment',
          path: '/mondepartment',
          requireAuth: true,
          asyncParams: {
            'deptment': getDoc(['departments'], DepartmentsRecord.fromSnapshot),
          },
          builder: (context, params) => MondepartmentWidget(
            deptment: params.getParam(
              'deptment',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'events',
          path: '/events',
          requireAuth: true,
          builder: (context, params) => const EventsWidget(),
        ),
        FFRoute(
          name: 'DetailsEvent',
          path: '/detailsEvent',
          requireAuth: true,
          builder: (context, params) => DetailsEventWidget(
            idevent: params.getParam(
              'idevent',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['events'],
            ),
            isEdith: params.getParam(
              'isEdith',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'outline',
          path: '/outline',
          requireAuth: true,
          asyncParams: {
            'event': getDoc(['events'], EventsRecord.fromSnapshot),
            'outline': getDoc(['outlines'], OutlinesRecord.fromSnapshot),
          },
          builder: (context, params) => OutlineWidget(
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
            outline: params.getParam(
              'outline',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'departs',
          path: '/departs',
          requireAuth: true,
          builder: (context, params) => const DepartsWidget(),
        ),
        FFRoute(
          name: 'integrationStat',
          path: '/integrationStat',
          requireAuth: true,
          asyncParams: {
            'dpt': getDoc(['departments'], DepartmentsRecord.fromSnapshot),
          },
          builder: (context, params) => IntegrationStatWidget(
            uniqueEle: params.getParam<String>(
              'uniqueEle',
              ParamType.String,
              isList: true,
            ),
            countUniqEle: params.getParam<int>(
              'countUniqEle',
              ParamType.int,
              isList: true,
            ),
            dpt: params.getParam(
              'dpt',
              ParamType.Document,
            ),
            group: params.getParam(
              'group',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['groups'],
            ),
          ),
        ),
        FFRoute(
          name: 'membres',
          path: '/membres',
          requireAuth: true,
          asyncParams: {
            'stars':
                getDocList(['applications'], ApplicationsRecord.fromSnapshot),
          },
          builder: (context, params) => MembresWidget(
            stars: params.getParam<ApplicationsRecord>(
              'stars',
              ParamType.Document,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'DetailsSTAR',
          path: '/detailsSTAR',
          requireAuth: true,
          builder: (context, params) => DetailsSTARWidget(
            rh: params.getParam(
              'rh',
              ParamType.bool,
            ),
            id: params.getParam(
              'id',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['applications'],
            ),
          ),
        ),
        FFRoute(
          name: 'Ministry',
          path: '/ministry',
          requireAuth: true,
          asyncParams: {
            'minister': getDoc(['ministries'], MinistriesRecord.fromSnapshot),
          },
          builder: (context, params) => MinistryWidget(
            minister: params.getParam(
              'minister',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'departments',
          path: '/departments',
          requireAuth: true,
          asyncParams: {
            'departement':
                getDoc(['departments'], DepartmentsRecord.fromSnapshot),
          },
          builder: (context, params) => DepartmentsWidget(
            departement: params.getParam(
              'departement',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ceateSTAR',
          path: '/ceateSTAR',
          requireAuth: true,
          builder: (context, params) => CeateSTARWidget(
            isAdmin: params.getParam(
              'isAdmin',
              ParamType.bool,
            ),
            dptName: params.getParam(
              'dptName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'DetailsEventPlan',
          path: '/detailsEventPlan',
          requireAuth: true,
          asyncParams: {
            'eventDetails': getDoc(['events'], EventsRecord.fromSnapshot),
            'dtp': getDoc(['departments'], DepartmentsRecord.fromSnapshot),
          },
          builder: (context, params) => DetailsEventPlanWidget(
            eventDetails: params.getParam(
              'eventDetails',
              ParamType.Document,
            ),
            dtp: params.getParam(
              'dtp',
              ParamType.Document,
            ),
            forPlan: params.getParam(
              'forPlan',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'test',
          path: '/test',
          requireAuth: true,
          builder: (context, params) => const TestWidget(),
        ),
        FFRoute(
          name: 'choiceChurch',
          path: '/choiceChurch',
          requireAuth: true,
          builder: (context, params) => ChoiceChurchWidget(
            churchs: params.getParam<DocumentReference>(
              'churchs',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['churchs'],
            ),
          ),
        ),
        FFRoute(
          name: 'DetailsEventCopy',
          path: '/detailsEventCopy',
          requireAuth: true,
          asyncParams: {
            'eventDetails': getDoc(['events'], EventsRecord.fromSnapshot),
            'dpt': getDoc(['departments'], DepartmentsRecord.fromSnapshot),
          },
          builder: (context, params) => DetailsEventCopyWidget(
            eventDetails: params.getParam(
              'eventDetails',
              ParamType.Document,
            ),
            dpt: params.getParam(
              'dpt',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'affectionList',
          path: '/affectionList',
          requireAuth: true,
          builder: (context, params) => AffectionListWidget(
            dpt: params.getParam(
              'dpt',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['departments'],
            ),
          ),
        ),
        FFRoute(
          name: 'DetailsEventCopy2',
          path: '/detailsEventCopy2',
          requireAuth: true,
          asyncParams: {
            'eventDetails': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => DetailsEventCopy2Widget(
            eventDetails: params.getParam(
              'eventDetails',
              ParamType.Document,
            ),
            isEdith: params.getParam(
              'isEdith',
              ParamType.bool,
            ),
            statusText: params.getParam(
              'statusText',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ProfileCopy',
          path: '/profileCopy',
          requireAuth: true,
          builder: (context, params) => const ProfileCopyWidget(),
        ),
        FFRoute(
          name: 'servicesCopy',
          path: '/servicesCopy',
          requireAuth: true,
          builder: (context, params) => const ServicesCopyWidget(),
        ),
        FFRoute(
          name: 'integrationRg',
          path: '/integrationRg',
          requireAuth: true,
          builder: (context, params) => IntegrationRgWidget(
            idDpt: params.getParam(
              'idDpt',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['departments'],
            ),
            idGroup: params.getParam(
              'idGroup',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['groups'],
            ),
          ),
        ),
        FFRoute(
          name: 'integrationC',
          path: '/integrationC',
          requireAuth: true,
          builder: (context, params) => IntegrationCWidget(
            dptID: params.getParam(
              'dptID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['departments'],
            ),
          ),
        ),
        FFRoute(
          name: 'integrationRespo',
          path: '/integrationRespo',
          requireAuth: true,
          builder: (context, params) => IntegrationRespoWidget(
            idDpt: params.getParam(
              'idDpt',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['departments'],
            ),
          ),
        ),
        FFRoute(
          name: 'servicesCopy2',
          path: '/servicesCopy2',
          requireAuth: true,
          builder: (context, params) => const ServicesCopy2Widget(),
        ),
        FFRoute(
          name: 'backupIntegration',
          path: '/backupIntegration',
          requireAuth: true,
          builder: (context, params) => BackupIntegrationWidget(
            dpt: params.getParam(
              'dpt',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['departments'],
            ),
          ),
        ),
        FFRoute(
          name: 'adminEglise',
          path: '/adminEglise',
          requireAuth: true,
          builder: (context, params) => const AdminEgliseWidget(),
        ),
        FFRoute(
          name: 'adminministeres',
          path: '/adminministeres',
          requireAuth: true,
          builder: (context, params) => AdminministeresWidget(
            idchurch: params.getParam(
              'idchurch',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['churchs'],
            ),
          ),
        ),
        FFRoute(
          name: 'adminDeparts',
          path: '/adminDeparts',
          requireAuth: true,
          asyncParams: {
            'ministry': getDoc(['ministries'], MinistriesRecord.fromSnapshot),
          },
          builder: (context, params) => AdminDepartsWidget(
            ministry: params.getParam(
              'ministry',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'adminStars',
          path: '/adminStars',
          requireAuth: true,
          asyncParams: {
            'dpt': getDoc(['departments'], DepartmentsRecord.fromSnapshot),
          },
          builder: (context, params) => AdminStarsWidget(
            dpt: params.getParam(
              'dpt',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'edithInfoPerso',
          path: '/edithInfoPerso',
          requireAuth: true,
          asyncParams: {
            'detailSTAR':
                getDoc(['applications'], ApplicationsRecord.fromSnapshot),
          },
          builder: (context, params) => EdithInfoPersoWidget(
            detailSTAR: params.getParam(
              'detailSTAR',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ijevent',
          path: '/ijevent',
          requireAuth: true,
          builder: (context, params) => const IjeventWidget(),
        ),
        FFRoute(
          name: 'eventenfant',
          path: '/eventenfant',
          requireAuth: true,
          asyncParams: {
            'event': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => EventenfantWidget(
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'enfants',
          path: '/enfants',
          requireAuth: true,
          builder: (context, params) => const EnfantsWidget(),
        ),
        FFRoute(
          name: 'createSetEnfant',
          path: '/createSetEnfant',
          requireAuth: true,
          asyncParams: {
            'detailefant': getDoc(['enfants'], EnfantsRecord.fromSnapshot),
          },
          builder: (context, params) => CreateSetEnfantWidget(
            detailefant: params.getParam(
              'detailefant',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ijevents',
          path: '/ijevents',
          requireAuth: true,
          builder: (context, params) => const IjeventsWidget(),
        ),
        FFRoute(
          name: 'DetailsEfant',
          path: '/detailsEfant',
          requireAuth: true,
          builder: (context, params) => DetailsEfantWidget(
            id: params.getParam(
              'id',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['enfants'],
            ),
          ),
        ),
        FFRoute(
          name: 'enfantsrecup',
          path: '/enfantsrecup',
          requireAuth: true,
          builder: (context, params) => EnfantsrecupWidget(
            idevent: params.getParam(
              'idevent',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['events'],
            ),
          ),
        ),
        FFRoute(
          name: 'eventFutur',
          path: '/eventFutur',
          requireAuth: true,
          builder: (context, params) => const EventFuturWidget(),
        ),
        FFRoute(
          name: 'comptRendu',
          path: '/comptRendu',
          requireAuth: true,
          asyncParams: {
            'cr': getDoc(['compte_rendu'], CompteRenduRecord.fromSnapshot),
          },
          builder: (context, params) => ComptRenduWidget(
            cr: params.getParam(
              'cr',
              ParamType.Document,
            ),
            idDpt: params.getParam(
              'idDpt',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['departments'],
            ),
            nomDpt: params.getParam(
              'nomDpt',
              ParamType.String,
            ),
            idevent: params.getParam(
              'idevent',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['events'],
            ),
          ),
        ),
        FFRoute(
          name: 'crs',
          path: '/crs',
          requireAuth: true,
          asyncParams: {
            'event': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => CrsWidget(
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'crDpt',
          path: '/crDpt',
          requireAuth: true,
          asyncParams: {
            'cr': getDoc(['compte_rendu'], CompteRenduRecord.fromSnapshot),
            'star': getDocList(['event_star'], EventStarRecord.fromSnapshot),
            'event': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => CrDptWidget(
            cr: params.getParam(
              'cr',
              ParamType.Document,
            ),
            star: params.getParam<EventStarRecord>(
              'star',
              ParamType.Document,
              isList: true,
            ),
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'eccueilevent',
          path: '/eccueilevent',
          requireAuth: true,
          builder: (context, params) => const EccueileventWidget(),
        ),
        FFRoute(
          name: 'accueilCompte',
          path: '/accueilCompte',
          requireAuth: true,
          asyncParams: {
            'event': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => AccueilCompteWidget(
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'accueilevents',
          path: '/accueilevents',
          requireAuth: true,
          builder: (context, params) => const AccueileventsWidget(),
        ),
        FFRoute(
          name: 'eventenfantCopy',
          path: '/eventenfantCopy',
          requireAuth: true,
          asyncParams: {
            'event': getDoc(['events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => EventenfantCopyWidget(
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'DashPasta',
          path: '/dashPasta',
          requireAuth: true,
          builder: (context, params) => const DashPastaWidget(),
        ),
        FFRoute(
          name: 'integrationCFrespo',
          path: '/integrationCFrespo',
          requireAuth: true,
          asyncParams: {
            'advisor':
                getDoc(['group_advisor'], GroupAdvisorRecord.fromSnapshot),
          },
          builder: (context, params) => IntegrationCFrespoWidget(
            dptID: params.getParam(
              'dptID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['departments'],
            ),
            advisor: params.getParam(
              'advisor',
              ParamType.Document,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitFadingGrid(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
