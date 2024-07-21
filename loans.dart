class Loans {
  double? amount;
  DateTime? period;
  double? interestRate;
  String? id;
  Loans(
      {required this.amount,
      required this.period,
      required this.interestRate,
      required this.id});
  Payment() {
    double interest = amount! * (interestRate! / 100);
    double totalpayment = interest + amount!;
    print(
        'Total payment amount (including interest): \$${totalpayment.toStringAsFixed(2)}');
  }

  setloandetial() {
    this.amount;
    this.interestRate;
    this.period;
  }

  getlonadetial() {
    print('Loan Amount: \$${amount!.toStringAsFixed(2)}');
    print('Loan Period: ${period}');
    print('Interest Rate: ${interestRate}%');
  }
}
