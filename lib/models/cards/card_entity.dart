class CardEntity {
  String holderName;
  String bankName;
  String expireDate;
  String cardNumber;
  String accountNumber;
  ECardType type;

  CardEntity(this.holderName, this.type, this.accountNumber, this.bankName,
      this.cardNumber, this.expireDate);
}

enum ECardType { visa, masterCard }