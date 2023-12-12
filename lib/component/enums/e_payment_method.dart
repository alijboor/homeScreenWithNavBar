enum EPaymnetMethod {
  payPal('https://s3.cointelegraph.com/storage/uploads/view/3278bdc14c74dd4e85732b776d0e5b1d.png'),
  visa('https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/1024px-Visa_Inc._logo.svg.png'),
  masterCard('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Mastercard_2019_logo.svg/2560px-Mastercard_2019_logo.svg.png'),
  applePay('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Apple_Pay_logo.svg/2560px-Apple_Pay_logo.svg.png'),
  googlePay('https://assets.stickpng.com/images/60e7f964711cf700048b6a6a.png');

  const EPaymnetMethod(this.link);
  final String link;

}