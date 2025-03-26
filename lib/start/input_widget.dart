import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:prepicofeed/components/custom_button.dart';
import 'package:prepicofeed/data/pref_manager.dart';
import 'package:prepicofeed/home/home_page.dart';

import '../../../components/labeled_text_form_field.dart';

class InputWidget extends StatefulWidget {
  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LabeledTextFormField(
            title: 'name_dot'.tr(),
            controller: _nameController,
            keyboardType: TextInputType.name,
            hintText: 'Name',
            validator: FormBuilderValidators.required(errorText:'required'.tr() ),
          ),
          LabeledTextFormField(
            title: 'phonenumber_dot'.tr(),
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            hintText: '+22505909296015',
            padding: 0,
            validator: FormBuilderValidators.required(errorText:'required'.tr() ),
          ),
          SizedBox(
            height: 30,
          ),
          CustomButton(
            onPressed: () {
    if (_formKey.currentState!.validate()) {

      Prefs.setString(Prefs.NAME, _nameController.text);
      Prefs.setString(Prefs.PHONE, _phoneController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),

      );
    }
            },
            text: 'login'.tr(),
          ),
        ],
      ),
    );
  }
}
