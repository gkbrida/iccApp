import '/flutter_flow/flutter_flow_util.dart';
import 'edith_tach_widget.dart' show EdithTachWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EdithTachModel extends FlutterFlowModel<EdithTachWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for startdate widget.
  FocusNode? startdateFocusNode;
  TextEditingController? startdateTextController;
  final startdateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? startdateTextControllerValidator;
  String? _startdateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for duree widget.
  FocusNode? dureeFocusNode;
  TextEditingController? dureeTextController;
  String? Function(BuildContext, String?)? dureeTextControllerValidator;
  String? _dureeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    startdateTextControllerValidator = _startdateTextControllerValidator;
    dureeTextControllerValidator = _dureeTextControllerValidator;
  }

  @override
  void dispose() {
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    startdateFocusNode?.dispose();
    startdateTextController?.dispose();

    dureeFocusNode?.dispose();
    dureeTextController?.dispose();
  }
}
