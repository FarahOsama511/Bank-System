import 'Account.dart';
import 'Contact.dart';
import 'loans.dart';

class Bank {
  String? Name;
  String? Manger;
  String? location;
  List<String> branches = [];
  Contact? contactinfo;
  List<Account> accounts = [];
  List<Loans> loans = [];
  Bank({
    this.Name,
    this.Manger,
    this.location,
    this.contactinfo,
    required Contact contactInfo,
  });
  void addBranch(String branch) {
    branches.add(branch);
    print('Branch $branch added.');
  }

  void removeBranch(String branch) {
    branches.remove(branch);
    print('Branch $branch removed.');
  }

  void addAccount(Account account) {
    accounts.add(account);
    print('Account added.');
  }

  void removeAccount(Account account) {
    accounts.remove(account);
    print('Account removed.');
  }

  void addLoan(Loans loan) {
    loans.add(loan);
    print('Loan added.');
  }

  void removeLoan(Loans loan) {
    loans.remove(loan);
    print('Loan removed.');
  }

  displayBankDetails() {
    print('Bank Name: $Name');
    print('Manager: $Manger');
    print('Location: $location');
    print('Branches: ${branches.join(', ')}');
    print('Number of Accounts: ${accounts.length}');
    print('Number of Loans: ${loans.length}');
  }
}
