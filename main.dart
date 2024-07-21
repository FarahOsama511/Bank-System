import 'dart:io';
import 'Account.dart';
import 'Contact.dart';

import 'Bank.dart';
import 'loans.dart';

void main() {
  Bank bank = Bank(
    Name: 'MyBank',
    Manger: 'John Doe',
    location: '123 Bank Street',
    contactInfo: Contact(phone: 123 - 456 - 7890, email: 'contact@mybank.com'),
  );

  while (true) {
    print('\n--- Bank Management System ---');
    print('1. Add Account');
    print('2. Remove Account');
    print('3. Add Loan');
    print('4. Remove Loan');
    print('5. Display Bank Details');
    print('6. Exit');
    print('Enter your choice: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter account number: ');
        String? accountNumberStr = stdin.readLineSync();
        print('Enter initial amount: ');
        String? amountStr = stdin.readLineSync();
        print('Enter period (yyyy-MM-dd): ');
        String? periodStr = stdin.readLineSync();
        print('Enter account type: ');
        String? type = stdin.readLineSync();

        if (accountNumberStr != null &&
            amountStr != null &&
            periodStr != null &&
            type != null &&
            accountNumberStr.isNotEmpty &&
            amountStr.isNotEmpty &&
            periodStr.isNotEmpty &&
            type.isNotEmpty) {
          int accountNumber = int.parse(accountNumberStr);
          double amount = double.parse(amountStr);
          DateTime period = DateTime.parse(periodStr);
          Account account = Account(
              accountNumber: accountNumber,
              amount: amount,
              period: period,
              type: type);
          bank.addAccount(account);
        } else {
          print('Invalid account details.');
        }
        break;
      case '2':
        print('Enter account number: ');
        String? accountNumberStr = stdin.readLineSync();
        if (accountNumberStr != null && accountNumberStr.isNotEmpty) {
          int accountNumber = int.parse(accountNumberStr);
          Account? account = bank.accounts.firstWhere(
            (acc) => acc.accountNumber == accountNumber,
            orElse: () => Account(
                accountNumber: null,
                amount: 0,
                period: DateTime.now(),
                type: null),
          );
          if (account.accountNumber != null) {
            bank.removeAccount(account);
          } else {
            print('Account not found.');
          }
        } else {
          print('Invalid account number.');
        }
        break;
      case '3':
        print('Enter loan ID: ');
        String? loanId = stdin.readLineSync();
        print('Enter loan amount: ');
        String? amountStr = stdin.readLineSync();
        print('Enter loan period (yyyy-MM-dd): ');
        String? periodStr = stdin.readLineSync();
        print('Enter interest rate: ');
        String? interestRateStr = stdin.readLineSync();

        if (loanId != null &&
            amountStr != null &&
            periodStr != null &&
            interestRateStr != null &&
            loanId.isNotEmpty &&
            amountStr.isNotEmpty &&
            periodStr.isNotEmpty &&
            interestRateStr.isNotEmpty) {
          double amount = double.parse(amountStr);
          DateTime period = DateTime.parse(periodStr);
          double interestRate = double.parse(interestRateStr);
          Loans loan = Loans(
              id: loanId,
              amount: amount,
              period: period,
              interestRate: interestRate);
          bank.addLoan(loan);
        } else {
          print('Invalid loan details.');
        }
        break;
      case '4':
        print('Enter loan ID: ');
        String? loanId = stdin.readLineSync();
        if (loanId != null && loanId.isNotEmpty) {
          Loans? loan = bank.loans.firstWhere(
            (loan) => loan.id == loanId,
            orElse: () => Loans(
                id: '', amount: 0, period: DateTime.now(), interestRate: 0),
          );
          if (loan.id!.isEmpty) {
            bank.removeLoan(loan);
          } else {
            print('Loan not found.');
          }
        } else {
          print('Invalid loan ID.');
        }
        break;
      case '5':
        bank.displayBankDetails();
        break;
      case '6':
        print('Exiting...');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
