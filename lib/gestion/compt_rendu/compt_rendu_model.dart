import '/flutter_flow/flutter_flow_util.dart';
import 'compt_rendu_widget.dart' show ComptRenduWidget;
import 'package:flutter/material.dart';

class ComptRenduModel extends FlutterFlowModel<ComptRenduWidget> {
  ///  Local state fields for this page.

  DocumentReference? idChurch;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for chObs widget.
  bool? chObsValue;
  // State field(s) for obs widget.
  FocusNode? obsFocusNode;
  TextEditingController? obsTextController;
  String? Function(BuildContext, String?)? obsTextControllerValidator;
  // State field(s) for difc widget.
  bool? difcValue;
  // State field(s) for difcul widget.
  FocusNode? difculFocusNode;
  TextEditingController? difculTextController;
  String? Function(BuildContext, String?)? difculTextControllerValidator;
  // State field(s) for ameli widget.
  bool? ameliValue;
  // State field(s) for ameli widget.
  FocusNode? ameliFocusNode;
  TextEditingController? ameliTextController;
  String? Function(BuildContext, String?)? ameliTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    obsFocusNode?.dispose();
    obsTextController?.dispose();

    difculFocusNode?.dispose();
    difculTextController?.dispose();

    ameliFocusNode?.dispose();
    ameliTextController?.dispose();
  }
}
