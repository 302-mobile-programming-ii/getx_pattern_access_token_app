import 'package:get/get.dart';

import '../constants/constant_language.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      ConstantLanguage.listPost: 'List Post',
      ConstantLanguage.home: 'Home',
      ConstantLanguage.dashboard: 'Dashboard',
    },
    'km_KM': {
      ConstantLanguage.listPost: 'ប្រកាសបញ្ជី',
      ConstantLanguage.home: 'ទំព័រដើម',
      ConstantLanguage.dashboard: 'ផ្ទាំងគ្រប់គ្រង',
    },
  };
}
