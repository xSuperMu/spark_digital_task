import 'package:spark_digital/imports.dart';

class CustomLoadingView extends StatelessWidget {
  const CustomLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(.5),
      child: const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
