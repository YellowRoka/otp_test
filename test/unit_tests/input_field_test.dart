import 'package:flutter_test/flutter_test.dart';
import 'package:otp_test/pages/input_page/parts/input_field.dart';

void main() {

  late NullValidator        nullValidator;
  late RealEngWordValidator realEngWordValidator;
  
  setUp(
    (){
      nullValidator        = NullValidator();
      realEngWordValidator = RealEngWordValidator();
    }
  );

  test("1 NullValidator - empty input",(){
      expect( nullValidator.isValid(null), false );
    }
  );

  test("2 NullValidator - filled input",(){
      expect( nullValidator.isValid("word"), true );
    }
  );
  test("3 RealEngWordValidator - not real english word",(){
      expect( realEngWordValidator.isValid("pneumonoultramicroscopicsilicovolcanoconiosis"), false );
    }
  );

  test("4 RealEngWordValidator - real english word input",(){
      expect( realEngWordValidator.isValid("word"), true );
    }
  );
}
