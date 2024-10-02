import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_tracking_widget.dart' show NewTrackingWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewTrackingModel extends FlutterFlowModel<NewTrackingWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for FI widget.
  bool? fiValue;
  // State field(s) for finame widget.
  String? finameValue;
  FormFieldController<String>? finameValueController;
  // State field(s) for startdate widget.
  FocusNode? startdateFocusNode;
  TextEditingController? startdateTextController;
  final startdateMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? startdateTextControllerValidator;
  DateTime? datePicked1;
  // State field(s) for baptis widget.
  bool? baptisValue;
  // State field(s) for enddate widget.
  FocusNode? enddateFocusNode1;
  TextEditingController? enddateTextController1;
  final enddateMask1 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? enddateTextController1Validator;
  DateTime? datePicked2;
  // State field(s) for star widget.
  bool? starValue;
  // State field(s) for depart widget.
  String? departValue;
  FormFieldController<String>? departValueController;
  // State field(s) for enddate widget.
  FocusNode? enddateFocusNode2;
  TextEditingController? enddateTextController2;
  final enddateMask2 = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? enddateTextController2Validator;
  DateTime? datePicked3;
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

    enddateFocusNode1?.dispose();
    enddateTextController1?.dispose();

    enddateFocusNode2?.dispose();
    enddateTextController2?.dispose();

    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
