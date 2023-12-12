import 'package:home_screen/component/enums/e_payment_method.dart';
import 'package:home_screen/models/cards/card_entity.dart';

class CardController {
  List<CardEntity> cards = [
    CardEntity('Ali jboor', EPaymnetMethod.visa, '6406008', 'BOP',
        '6406 0044 8888 1113 8888', '08/24'),

    CardEntity('Ali jboor', EPaymnetMethod.masterCard, '6406008', 'BOP',
        '6406 0044 8888 1113 8888', '08/24')
  ];
}