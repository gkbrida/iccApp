import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_interaction_widget.dart' show NewInteractionWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewInteractionModel extends FlutterFlowModel<NewInteractionWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for interaction widget.
  String? interactionValue;
  FormFieldController<String>? interactionValueController;
  // State field(s) for startdate widget.
  FocusNode? startdateFocusNode;
  TextEditingController? startdateTextController;
  final startdateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? startdateTextControllerValidator;
  DateTime? datePicked;
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

    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
