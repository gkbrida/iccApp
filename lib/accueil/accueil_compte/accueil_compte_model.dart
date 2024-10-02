import '/flutter_flow/flutter_flow_util.dart';
import 'accueil_compte_widget.dart' show AccueilCompteWidget;
import 'package:flutter/material.dart';

class AccueilCompteModel extends FlutterFlowModel<AccueilCompteWidget> {
  ///  Local state fields for this page.

  int nbH = 0;

  int nbF = 0;

  int nbE = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for hom widget.
  FocusNode? homFocusNode;
  TextEditingController? homTextController;
  String? Function(BuildContext, String?)? homTextControllerValidator;
  // State field(s) for fem widget.
  FocusNode? femFocusNode;
  TextEditingController? femTextController;
  String? Function(BuildContext, String?)? femTextControllerValidator;
  // State field(s) for enf widget.
  FocusNode? enfFocusNode;
  TextEditingController? enfTextController;
  String? Function(BuildContext, String?)? enfTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    homFocusNode?.dispose();
    homTextController?.dispose();

    femFocusNode?.dispose();
    femTextController?.dispose();

    enfFocusNode?.dispose();
    enfTextController?.dispose();
  }
}
