import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'creat_event_widget.dart' show CreatEventWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CreatEventModel extends FlutterFlowModel<CreatEventWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for startdate widget.
  FocusNode? startdateFocusNode;
  TextEditingController? startdateTextController;
  final startdateMask = MaskTextInputFormatter(mask: '##/##/#### ##:##');
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
  final enddateMask = MaskTextInputFormatter(mask: '##/##/#### ##:##');
  String? Function(BuildContext, String?)? enddateTextControllerValidator;
  String? _enddateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for place widget.
  FocusNode? placeFocusNode;
  TextEditingController? placeTextController;
  String? Function(BuildContext, String?)? placeTextControllerValidator;
  String? _placeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  EventsRecord? currentEvent;

  @override
  void initState(BuildContext context) {
    titleTextControllerValidator = _titleTextControllerValidator;
    startdateTextControllerValidator = _startdateTextControllerValidator;
    enddateTextControllerValidator = _enddateTextControllerValidator;
    placeTextControllerValidator = _placeTextControllerValidator;
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    startdateFocusNode?.dispose();
    startdateTextController?.dispose();

    enddateFocusNode?.dispose();
    enddateTextController?.dispose();

    placeFocusNode?.dispose();
    placeTextController?.dispose();

    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
