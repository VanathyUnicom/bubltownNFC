enum PackagesEnum { employment, selfEmployment, partnerShip, pensionIncome, bankInterest, divident, rentalIncome, capitalGain }

extension PackagesEnumExtenstion on PackagesEnum {
  int get status {
    switch (this) {
      case PackagesEnum.employment:
        return 1;
      case PackagesEnum.selfEmployment:
        return 2;
      case PackagesEnum.partnerShip:
        return 3;
      case PackagesEnum.pensionIncome:
        return 4;
      case PackagesEnum.bankInterest:
        return 5;
      case PackagesEnum.divident:
        return 6;
      case PackagesEnum.rentalIncome:
        return 7;
      case PackagesEnum.capitalGain:
        return 8;
      default:
        return 0;
    }
  }
}
