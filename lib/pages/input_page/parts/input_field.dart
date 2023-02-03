import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:isitaword/isitaword.dart';
import 'package:otp_test/commons/constans.dart';

class InputField extends StatelessWidget {

  static const int maxSize = constMaxLenghtWord.length;

  static final validator = MultiValidator(
    [ 
      NullValidator( errorText: constErrNullValidator ),  
      PatternValidator( constErrPattern, errorText: constErrpatternValidator ),  
      RealEngWordValidator(),
      MinLengthValidator( 1, errorText:       constErrminLenght ),  
      MaxLengthValidator( maxSize, errorText: constErrmaxLenght ),  
    ]
  ); 

  const InputField({super.key});

  @override
  Widget build( BuildContext context ){
    return FormBuilderTextField(
      name:       constFormbuilderTextName,
      validator:  validator,
      decoration: const InputDecoration(
      hintText:   consthintText,
      labelText:  constLabelText,
      border:     OutlineInputBorder(),
      ),
    );
  }
}

/*
** INFO: the original isRequred validator not running at this version, therfore must defined a class for it.
*/
class NullValidator extends TextFieldValidator {  
  NullValidator( { String errorText = constDefaultErrorText } ) : super( errorText );  
  
  @override  
  bool get ignoreEmptyValues => false;  
  
  @override  
  bool isValid( String? value ) {  
    return ( value != null )?( true ):( false ); 
  }  
} 

class RealEngWordValidator extends TextFieldValidator {  
  RealEngWordValidator( { String errorText = constErrRealworld } ) : super( errorText );  
  
  @override  
  bool get ignoreEmptyValues => true;  
    
  @override  
  bool isValid( String? value ) {  
    bool validity = isItAWord( value! ); 
    return validity;
  }  
} 
