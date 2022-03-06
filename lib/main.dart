import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'core/constants/app/app_constants.dart';
import 'core/init/cache/cache_manager.dart';
import 'core/init/language/language_manager.dart';
import 'core/init/notifier/provider_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheManager.instance.initStorage();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
      child: const App(),
      path: ApplicationConstants.LANG_ASSETS_PATH,
      supportedLocales: LanguageManager.instance.supportedLocales,
      fallbackLocale: LanguageManager.instance.enLocale,
    ),
  ));
}
