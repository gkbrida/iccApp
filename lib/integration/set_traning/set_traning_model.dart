import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'set_traning_widget.dart' show SetTraningWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SetTraningModel extends FlutterFlowModel<SetTraningWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for trainig widget.
  String? trainigValue;
  FormFieldController<String>? trainigValueController;
  // State field(s) for startdate widget.
  FocusNode? startdateFocusNode;
  TextEditingController? startdateTextController;
  final startdateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? startdateTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for enddate widget.
  FocusNode? enddateFocusNode;
  TextEditingController? enddateTextController;
  final enddateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? enddateTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    startdateFocusNode?.dispose();
    startdateTextController?.dispose();

    enddateFocusNode?.dispose();
    enddateTextController?.dispose();

    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
