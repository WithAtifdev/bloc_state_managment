import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../l10n/app_localizations.dart';
import '../login_bloc/login_bloc.dart';


class PasswordInputWidget extends StatefulWidget {
  const PasswordInputWidget({super.key});
  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}
class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController  passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      buildWhen: (current, previous) => false,
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          focusNode: focusNode, 
          decoration: InputDecoration(
            icon: const Icon(Icons.lock), 
            helperText: AppLocalizations.of(context)!.passwordShouldbeatleast_characterswithatleastoneletterandnumber, 
            helperMaxLines: 2,
            labelText: AppLocalizations.of(context)!.password, 
            errorMaxLines: 2, 
          ),
          obscureText: true, 
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter password';
            }
            if (value.length < 6) {
              return 'please enter password greater than 6 char';
            }
            return null;
          },
          onChanged: (value) {
            context.read<LoginBloc>().add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}

