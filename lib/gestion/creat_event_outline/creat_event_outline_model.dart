import '/flutter_flow/flutter_flow_util.dart';
import 'creat_event_outline_widget.dart' show CreatEventOutlineWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreatEventOutlineModel extends FlutterFlowModel<CreatEventOutlineWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nomSession widget.
  FocusNode? nomSessionFocusNode;
  TextEditingController? nomSessionTextController;
  String? Function(BuildContext, String?)? nomSessionTextControllerValidator;
  String? _nomSessionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for startdate widget.
  FocusNode? startdateFocusNode;
  TextEditingController? startdateTextController;
  final startdateMask = MaskTextInputFormatter(mask: '##/## ##:##');
  String? Function(BuildContext, String?)? startdateTextControllerValidator;
  String? _startdateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for enddate widget.
  FocusNode? enddateFocusNode;
  TextEditingController? enddateTextController;
  final enddateMask = MaskTextInputFormatter(mask: '##/## ##:##');
  String? Function(BuildContext, String?)? enddateTextControllerValidator;
  String? _enddateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {
    nomSessionTextControllerValidator = _nomSessionTextControllerValidator;
    startdateTextControllerValidator = _startdateTextControllerValidator;
    enddateTextControllerValidator = _enddateTextControllerValidator;
  }

  @override
  void dispose() {
    nomSessionFocusNode?.dispose();
    nomSessionTextController?.dispose();

    startdateFocusNode?.dispose();
    startdateTextController?.dispose();

    enddateFocusNode?.dispose();
    enddateTextController?.dispose();
  }
}
