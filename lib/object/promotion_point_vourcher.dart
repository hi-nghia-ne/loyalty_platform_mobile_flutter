class PromotionPointVoucher {
  final int id;
  final String thumbNail;
  final String description;
  final String title;
  final String effectiveDate;
  final String expirationDate;
  final int point;
  PromotionPointVoucher(this.id, this.thumbNail, this.description,
      this.effectiveDate, this.expirationDate, this.point, this.title);
}
