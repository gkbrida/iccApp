import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'plan_cand_widget.dart' show PlanCandWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PlanCandModel extends FlutterFlowModel<PlanCandWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for birthdate widget.
  FocusNode? birthdateFocusNode;
  TextEditingController? birthdateTextController;
  final birthdateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? birthdateTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for typeRdv widget.
  int? typeRdvValue;
  FormFieldController<int>? typeRdvValueController;
  // State field(s) for detailType widget.
  FocusNode? detailTypeFocusNode;
  TextEditingController? detailTypeTextController;
  String? Function(BuildContext, String?)? detailTypeTextControllerValidator;
  // State field(s) for comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    birthdateFocusNode?.dispose();
    birthdateTextController?.dispose();

    detailTypeFocusNode?.dispose();
    detailTypeTextController?.dispose();

    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
