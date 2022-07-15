import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sotintas/src/external/models/user.dart';
import 'package:sotintas/src/presentation/stores/user_store.dart';
import 'package:sotintas/src/presentation/views/login/login_screen.dart';

import 'package:sotintas/src/presentation/widgets/custom_appbar.dart';
import 'package:sotintas/src/utils/authentication.dart';
import 'package:sotintas/src/utils/custom_colors.dart';
import 'package:sotintas/src/utils/fonts.dart';

class ProfileScreen extends StatefulWidget {
  final UserStore store;
  const ProfileScreen({Key? key, required this.store}) : super(key: key);

  static const routeName = "profile_screen";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    widget.store.getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Perfil"),
      body: Center(
        child: Column(
          children: [
            Observer(builder: (_) => ProfileCard(user: widget.store.user)),
            const SizedBox(height: 20),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final User? user;
  const ProfileCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: CustomColors.darkGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: CustomColors.grey,
        ),
        child: user != null
            ? Row(
                children: [
                  const SizedBox(width: 20),
                  CircleAvatar(
                    backgroundImage: NetworkImage(user!.avatar!),
                    radius: 40,
                  ),
                  const SizedBox(width: 20),
                  Text("${user?.name}", style: Fonts.headline5),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: CustomColors.grey,
              shadowColor: CustomColors.darkGrey,
              textStyle: Fonts.headline5,
            ),
            onPressed: () {
              Authentication.logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginScreen.routeName, (Route<dynamic> route) => false);
            },
            child: const Text("Fazer logout")));
  }
}
