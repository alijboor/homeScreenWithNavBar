import 'package:home_screen/component/enums/e_payment_method.dart';

class CardEntity {
  String holderName;
  String bankName;
  String expireDate;
  String cardNumber;
  String accountNumber;
  EPaymnetMethod type;

  CardEntity(this.holderName, this.type, this.accountNumber, this.bankName,
      this.cardNumber, this.expireDate);
}