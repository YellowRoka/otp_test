import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_field_validator/form_field_validator.dart';

class InputField extends StatelessWidget {

  static const int maxSize = "pneumonoultramicroscopicsilicovolcanoconiosis".length;

  static final validator = MultiValidator(
    [  
      NullValidator( errorText:                    'A word is required'                                                              ),  
      MinLengthValidator( 1, errorText:            'The word must be at least 1 letter long'                                         ),  
      MaxLengthValidator( maxSize+1, errorText:    'The word colud not longer than:\n pneumonoultramicroscopicsilicovolcanoconiosis' ),  
      PatternValidator( r'^[a-zA-Z]+$', errorText: 'Only allow letters from the english alphabet'                                    ),  
    ]
  ); 

  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name:       'input_text_field',
      validator:  validator,
      decoration: const InputDecoration(
      hintText:   "Type a new english word",
      labelText:  'Input new word',
      border:     OutlineInputBorder(),
      ),
    );
  }
}

/**
** INFO: the original isRequred validator not running at this version, therfore must defined a class for it.
** This class is out of unit testing scope becuse it is just temporary until the package is not fixed.
**/

class NullValidator extends TextFieldValidator {  
  NullValidator({String errorText = 'Enter a data'}) : super(errorText);  
  
  @override  
   bool get ignoreEmptyValues => false;  
    
	  @override  
	  bool isValid(String? value) {  
	    return (value != null )?(true):(false); 
	  }  
} 
