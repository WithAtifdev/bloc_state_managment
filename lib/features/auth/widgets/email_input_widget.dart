
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/validators.dart';
import '../../../l10n/app_localizations.dart';
import '../login_bloc/login_bloc.dart';


class EmailInputWidget extends StatefulWidget {
  const EmailInputWidget({super.key});

  @override
  State<EmailInputWidget> createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {

  final FocusNode focusNode = FocusNode();
  final TextEditingController  emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocBuilder<LoginBloc, LoginStates>(
          buildWhen: (current, previous) => false,
          builder: (context, state) {
            return TextFormField(
              controller: emailController,
              focusNode: focusNode, 
              decoration: InputDecoration(
                icon: const Icon(Icons.email), 
                labelText: AppLocalizations.of(context)!.email, 
                helperText: AppLocalizations.of(context)!.aCompleteValidEmailExamplejoegmailcom, 
              ),
              keyboardType: TextInputType.emailAddress, 
              onChanged: (value) {
                context.read<LoginBloc>().add(EmailChanged(email: value));
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter email';
                }
                if (!value.emailValidator()) {
                  return 'Email is not correct';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
            );
          },
        );
      }
    );
  }
}

