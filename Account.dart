class Account {
  int? accountNumber;
  double? amount;
  DateTime? period;
  String? type;

  Account({this.accountNumber, this.amount, this.period, this.type});

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Withdrawal amount must be positive.');
      return;
    }
    if (this.amount != null && this.amount! >= amount) {
      this.amount = this.amount! - amount;
      print('Withdrawal successful. New balance: ${this.amount}');
    } else {
      print('Insufficient funds.');
    }
  }

  void deposit(double amount) {
    if (amount <= 0) {
      print('Deposit amount must be positive.');
      return;
    }
    if (this.amount != null) {
      this.amount = this.amount! + amount;
      print('Deposit successful. New balance: ${this.amount}');
    } else {
      print('Error: Account amount is null.');
    }
  }

  void delete() {
    accountNumber = null;
    amount = 0;
    type = null;
    period = DateTime.now();
    print("Account is deleted");
  }

  void check() {
    print('Account Number: $accountNumber');
    print('Balance: \$${amount}');
    print('Period: $period');
    print('Type: $type');
  }
}
