import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'tr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? trText = '',
  }) =>
      [enText, trText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // giris
  {
    '4fxojg66': {
      'en': '',
      'tr': '',
    },
  },
  // indirildi
  {
    'kxj53icn': {
      'en': 'Great!',
      'tr': 'Harika!',
    },
    'un1erl02': {
      'en':
          'Your wallpaper has been downloaded successfully, now you can go to your gallery and set it as wallpaper.\n',
      'tr':
          'Duvar kağıdınız başarıyla indirildi, şimdi galerinize gidebilir ve duvar kağıdı olarak ayarlayabilirsiniz.',
    },
    'wkg770d2': {
      'en': 'Okay',
      'tr': 'Tamam',
    },
    'zb9pjrks': {
      'en':
          'We always provide you the highest resolution image possible, the save time in your gallery may vary depending on your connection speed.',
      'tr':
          'Sizlere her zaman mümkün olan en yüksek çözünürlüklü görüntüyü sunuyoruz, galerinize kayıt süresi bağlantı hızınıza bağlı olarak değişebilir.',
    },
    'xc664kip': {
      'en': '',
      'tr': '',
    },
  },
  // collections
  {
    'neahu9c2': {
      'en': 'Collections',
      'tr': 'Koleksiyonlar',
    },
    '4y2a3tcf': {
      'en': 'a new',
      'tr': 'yeni bir',
    },
    't2rh3spb': {
      'en': 'perspective...',
      'tr': 'bakış açısı...',
    },
    'cdk720hg': {
      'en': 'Singularity',
      'tr': 'Tekillik',
    },
    '2c4yan13': {
      'en': 'Different',
      'tr': 'Farklı',
    },
    'm88gr49a': {
      'en': 'Art',
      'tr': 'Sanat',
    },
    '2v71accp': {
      'en': 'Minimal',
      'tr': 'Minimal',
    },
    'wh94wgrq': {
      'en': 'Human',
      'tr': 'Beşeri',
    },
    'ydzhskpd': {
      'en': 'Instinct',
      'tr': 'Güdü',
    },
    '78fq7sfv': {
      'en': 'Blurry',
      'tr': 'Bulanık',
    },
    'avp14hpg': {
      'en': 'Cars',
      'tr': 'Rüya',
    },
    'tzfd8fs6': {
      'en': 'Dream',
      'tr': 'Rüya',
    },
    'o8pksj67': {
      'en': 'Stratosphere',
      'tr': 'Stratosfer',
    },
    'v8ok3pg5': {
      'en': 'Petricor',
      'tr': 'Yağmur',
    },
    'a3pnbxxg': {
      'en': 'Breath',
      'tr': 'Nefes',
    },
    'sti9tfpl': {
      'en': 'Dream',
      'tr': 'Rüya',
    },
    'cqxa8ngo': {
      'en': 'Ghrelin',
      'tr': 'Ghrelin',
    },
    'gyve32fn': {
      'en': 'Silence',
      'tr': 'Sessizlik',
    },
    '1vove1i2': {
      'en': 'Always\nRefreshing',
      'tr': 'Her zaman\nYenileniyor...',
    },
    '31wh51t4': {
      'en': 'Dream',
      'tr': 'Rüya',
    },
    'cc28hxqi': {
      'en': 'Dream',
      'tr': 'Rüya',
    },
    'rlsy5qmk': {
      'en': 'Editorial...',
      'tr': 'Farklı Seçimler...',
    },
    '1esnqdrx': {
      'en': 'Social',
      'tr': 'Sosyal',
    },
    'hpit3akf': {
      'en': 'Instagram',
      'tr': 'Instagram',
    },
    'o8q7n44n': {
      'en': 'Mail',
      'tr': 'e-Posta',
    },
    '06og9e8x': {
      'en': 'Oorbs.Studio',
      'tr': 'Oorbs.Studio',
    },
    '909sclot': {
      'en': 'Would you like to support us?',
      'tr': 'Bize destek olmak ister misiniz?',
    },
    'qbc6wvn5': {
      'en':
          'When you click on the icon, you will be directed to the ad. In return you only support us.',
      'tr':
          'İkona tıkladığınızda, reklama yönlendirileceksiniz. Karşılığında, sadece bizi desteklemiş olursunuz.',
    },
    'anse1de4': {
      'en': '',
      'tr': '',
    },
  },
  // above
  {
    'u9imkvtv': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    '92ju4f0z': {
      'en': 'Stratosphere',
      'tr': 'Stratosfer',
    },
    'c7abzjyd': {
      'en': '\"Icarus\"',
      'tr': '\"Ikarus\"',
    },
    'mymsvliy': {
      'en': 'Icarus, son of Daidalus...',
      'tr': 'Daidalus\'un oğlu Ikarus...',
    },
    'k5x6byff': {
      'en': 'II',
      'tr': 'II',
    },
    '43ekixgs': {
      'en': 'III',
      'tr': 'III',
    },
    'rrkwjobs': {
      'en': 'IV',
      'tr': 'IV',
    },
    '0ikww7p1': {
      'en': 'V',
      'tr': 'V',
    },
    'auy7cbzb': {
      'en': 'VI',
      'tr': 'VI',
    },
    '568t5h7v': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    '922mrbia': {
      'en': '',
      'tr': '',
    },
  },
  // black
  {
    '9q2hbz4a': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    'emzqn4pr': {
      'en': 'Singularity',
      'tr': 'Tekillik',
    },
    'vi5n8ujx': {
      'en': '\"furvus\"',
      'tr': '\"furvus\"',
    },
    'hjjvmtbc': {
      'en': 'It’s always darkest before it becomes totally black.',
      'tr': 'Tamamen siyah olmadan önce her şey kararır.',
    },
    'yx2epc6r': {
      'en': 'II',
      'tr': 'II',
    },
    'knu1apbl': {
      'en': 'III',
      'tr': 'III',
    },
    'wwje1zi5': {
      'en': 'IV',
      'tr': 'IV',
    },
    'cjllzlhr': {
      'en': 'V',
      'tr': 'V',
    },
    'cgl3bo5r': {
      'en': 'VI',
      'tr': 'VI',
    },
    'pry55oxl': {
      'en': 'VII',
      'tr': 'VII',
    },
    'qo4qoi22': {
      'en': 'VIII',
      'tr': 'VIII',
    },
    'fbuqwo6b': {
      'en': 'IX',
      'tr': 'IX',
    },
    'kdyj07om': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    '6119l4fl': {
      'en': '',
      'tr': '',
    },
  },
  // kilavuz
  {
    'etkb22k4': {
      'en': 'O',
      'tr': 'O',
    },
    'cmlhhlk5': {
      'en': 'What does this app contain?',
      'tr': 'Bu uygulama ne içeriyor?',
    },
    'b9qwfw38': {
      'en':
          'First of all, thank you very much for downloading the app.\n\nSwipe right to learn more...',
      'tr':
          'Öncelikle uygulamayı indirdiğiniz için çok teşekkür ederiz.\n\nDaha fazla bilgi için sağa kaydırın...',
    },
    'q8hws0rs': {
      'en': 'Our application is completely free and will remain free',
      'tr': 'Uygulamamız tamamen ücretsizdir ve ücretsiz kalacaktır',
    },
    'u8d4l7xe': {
      'en':
          'While we developing \"OORBS Wallpaper\", we agreed to offer this service completely free of charge.',
      'tr':
          'OORBS\'u geliştirirken bu hizmeti tamamen ücretsiz olarak sunmaya sözleştik.',
    },
    'smklvtis': {
      'en': 'We support designers',
      'tr': 'Tasarımcıları destekliyoruz',
    },
    'fb3cpf36': {
      'en':
          'If you have any design you want us to share with us, we will gladly consider.',
      'tr':
          'Bizimle paylaşmamızı istediğiniz herhangi bir tasarımınız varsa memnuniyetle değerlendiririz.',
    },
    'k6y7cv0c': {
      'en': 'Get rid of cliches',
      'tr': 'Klişelerden kurtulun',
    },
    '6osvwrzt': {
      'en':
          'Choose from the aesthetic wallpapers in the collections we have carefully prepared. Choose the one that is different for you.',
      'tr':
          'Özenle hazırladığımız koleksiyonlardaki estetik duvar kağıtları arasından seçim yapın. Sizin için farklı olanı seçin.',
    },
    'n6g99l1q': {
      'en': 'We are renewing every day',
      'tr': 'Her gün yeniliyoruz',
    },
    'dhhi1q0b': {
      'en':
          'Our circadian page constantly updates itself. You may want to check it from time to time.',
      'tr':
          'Sirkadiyen sayfamız sürekli kendini güncellemektedir. Zaman zaman kontrol etmek isteyebilirsiniz.',
    },
    'gp7jw61b': {
      'en': 'Well...\nHow do I use App?',
      'tr': 'Peki...\nUygulamayı nasıl kullanırım?',
    },
    '3cd3w1qv': {
      'en':
          'Actually, the answer to this question is very easy. There are 2 separate sections in the application where you can access the wallpapers.\n\n        -The first of these is the \"Circadian\" section, which is renewed every 24 hours.\n        -Other one is, the \"Collection\" section, carefully choosed photos by us.\n\nYou can access other specific information about the application or parts such as language settings from the settings menu.',
      'tr':
          'Aslında bu sorunun cevabı çok kolay. Uygulama içerisinde duvar kağıtlarına ulaşabileceğiniz 2 ayrı bölüm bulunmaktadır.\n\n        -Bunlardan ilki 24 saatte bir yenilenen \"Sirkadiyen\" bölümüdür.\n        -Diğeri ise, \"Koleksiyon\"bölümü, tarafımızca özenle seçilmiş fotoğraflardır. \n\nAyarlar sayfasından bölümlerle ilgili diğer spesifik bilgilere erişebilirsiniz.',
    },
    '832z75yr': {
      'en': 'I\'m Ready',
      'tr': 'Başlayalım',
    },
    'd1u3efsw': {
      'en': '',
      'tr': '',
    },
  },
  // circadiandailywallp
  {
    'kpmbqcrp': {
      'en': 'Circadian',
      'tr': 'Sirkadiyen',
    },
    'i1k3a6y6': {
      'en': '',
      'tr': '',
    },
  },
  // ayarlar
  {
    '6pubbr81': {
      'en': 'Settings',
      'tr': 'Ayarlar',
    },
    'sxwxx97w': {
      'en': 'Language Settings',
      'tr': 'Dil Ayarları',
    },
    'lwmmakjo': {
      'en': 'About\nApp',
      'tr': 'Uygulama\nHakkında',
    },
    'mf9g7ee2': {
      'en': 'About\nDeveloper',
      'tr': 'Geliştirici\nHakkında',
    },
    'py16e6m0': {
      'en': 'Tutorial',
      'tr': 'Kılavuz',
    },
    'bhpf8g4y': {
      'en': 'What\'s in the app?',
      'tr': 'Uygulamada neler var?',
    },
    'hkuvng4t': {
      'en': 'How about a short introduction about our app?',
      'tr': 'Kısa bir tanıtıma ne dersiniz?',
    },
    'q48f5k1k': {
      'en': 'Contact Us',
      'tr': 'Bize Ulaşın',
    },
    'j0o6f1pj': {
      'en': 'info@invenire.com.tr',
      'tr': 'e-Posta',
    },
    'nbujs9gw': {
      'en': 'invenirecomtr',
      'tr': 'Instagram',
    },
    'k9mzyyeg': {
      'en': 'Would you like to rate us?',
      'tr': 'Bizi değerlendirmek ister misiniz?',
    },
    'gkbzzneu': {
      'en': '',
      'tr': '',
    },
  },
  // gizliliksozlesmesi
  {
    'ggl2ywiz': {
      'en': 'About App',
      'tr': 'Uygulama Hakkında',
    },
    '4m1xp76m': {
      'en': 'Legal Terms of App',
      'tr': 'Yasal Şartlar ve İşleyiş',
    },
    'ndsaj210': {
      'en':
          '-This application does not guarantee that the information contained in it is complete and correct.\n\n-The rights of the works of the artists shared in the application belong to them. You can request editing about the work or the owner of the work.\nWhen a request for removal of any work is requested, the work is immediately removed as a result of reaching us if the rights of the work are shown.\n\n-You are deemed to have given us the necessary permissions for us to publish the works you have sent for us to share.\n\n-For all your questions or problems, you can contact us from the \"contact us\" section in the \"Settings\" menu.',
      'tr':
          '-Bu uygulama, yer alan bilgilerin tam ve doğru olduğunu garanti etmemektedir.  \n\n-Uygulamada paylaşımı yapılan sanatçıların eserlerinin hakları şahıslarına aittir. Eser bilgileri veya eser sahibi hakkında düzenleme talep edebilirsiniz.\nHerhangi bir eserin kaldırılma talebi istenildiğinde tarafımıza  eser haklarının gösterildiği takdirde ulaşılması sonucunda eser ivedilikle kaldırılır.\n\n-Tarafımıza paylaşmamız için göndermiş olduğunuz eserleri yayınlamamız  için gerekli izinleri vermiş sayılırsınız.\n\n-Tüm soru veya sorunlarınız için \"Ayarlar\" menüsünde bulunan \"bize ulaşın\" kısmından bize ulaşabilirsiniz.',
    },
    'e4kfqhhs': {
      'en':
          'Copyright © 2022 - OORBS Wallpaper\nVersion 1.0.0\nAll rights reserved.',
      'tr':
          'Copyright © 2022 - OORBS Wallpaper\nVersion 1.0.0\nTüm hakları saklıdır.',
    },
    'ng7ov0vf': {
      'en': '',
      'tr': '',
    },
  },
  // instinct
  {
    'odea1qna': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    'fds705nv': {
      'en': 'Instinct',
      'tr': 'Güdü',
    },
    'lf75thqn': {
      'en': 'It\'s better to be a lion for a day than a sheep all your life.',
      'tr':
          'Hayatın boyunca koyun olmaktansa bir günlüğüne aslan olmak daha iyidir.',
    },
    'cqyj712m': {
      'en': 'II',
      'tr': 'II',
    },
    'uji6ne0i': {
      'en': 'III',
      'tr': 'III',
    },
    '1dpsbjpq': {
      'en': 'IV',
      'tr': 'IV',
    },
    'stn7gf21': {
      'en': 'V',
      'tr': 'V',
    },
    'yps6ax2a': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    'o1b05cit': {
      'en': '',
      'tr': '',
    },
  },
  // silence
  {
    'ascwgzo3': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    'iw6f8q99': {
      'en': 'Silence',
      'tr': 'Sessizlik',
    },
    'go1j4eqs': {
      'en': 'Never assume that loud is strong and quiet is weak.',
      'tr':
          'Asla yüksek sesin güçlü ve sessizliğin zayıf olduğunu varsaymayın.',
    },
    'ik01gl3u': {
      'en': 'II',
      'tr': 'II',
    },
    'i0v8wygz': {
      'en': 'III',
      'tr': 'III',
    },
    'm5yfgif5': {
      'en': 'IV',
      'tr': 'IV',
    },
    'ua9xp2zl': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    '24trzd1s': {
      'en': '',
      'tr': '',
    },
  },
  // blurry
  {
    'vz3d0tts': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    'gu6pideo': {
      'en': 'Blurry',
      'tr': 'Bulanık',
    },
    'hafovalk': {
      'en': 'The Universal view melts things into a blur. ',
      'tr': 'Evrensel açıdan her şey bulanıktır.',
    },
    'yiegsxwc': {
      'en': 'II',
      'tr': 'II',
    },
    'o4jj5lri': {
      'en': 'III',
      'tr': 'III',
    },
    '3b17k57y': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    '4tdec8vx': {
      'en': '',
      'tr': '',
    },
  },
  // minimal
  {
    'ws1uzc9o': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    '0ccde7ih': {
      'en': 'Minimal',
      'tr': 'Minimal',
    },
    'm4l44ypa': {
      'en': 'keep it simple.',
      'tr': 'sadelik.',
    },
    '1mafq3f7': {
      'en': 'II',
      'tr': 'II',
    },
    'g0fnevlt': {
      'en': 'III',
      'tr': 'III',
    },
    '42dkuhuj': {
      'en': 'IV',
      'tr': 'IV',
    },
    'raytmeil': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    'g6cb0prr': {
      'en': '',
      'tr': '',
    },
  },
  // petricor
  {
    'qsclnt6r': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    'lvqbygsq': {
      'en': 'Petricor',
      'tr': 'Petrikor',
    },
    'grlf3ahm': {
      'en': 'Without rain, there is no life.',
      'tr': 'Yağmur\'suz bir hayat düşünülemez.',
    },
    '1p3r7b6c': {
      'en': 'II',
      'tr': 'II',
    },
    '3ecd7ftj': {
      'en': 'III',
      'tr': 'III',
    },
    'rooon293': {
      'en': 'IV',
      'tr': 'IV',
    },
    'rznqsmh3': {
      'en': 'V',
      'tr': 'V',
    },
    'k63vg705': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    'cybw9021': {
      'en': '',
      'tr': '',
    },
  },
  // dream
  {
    '4fjb2qcd': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    'c423odtr': {
      'en': 'Dream',
      'tr': 'Rüya',
    },
    '71o3p1h4': {
      'en': 'You have to dream before your dreams can come true.',
      'tr': 'Hayallerinizin gerçekleşmesi için önce hayal kurmalısınız.',
    },
    'xijctzxr': {
      'en': 'II',
      'tr': 'II',
    },
    'fp4a2zx2': {
      'en': 'III',
      'tr': 'III',
    },
    'prj9clu7': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    'ub49hijb': {
      'en': '',
      'tr': '',
    },
  },
  // breath
  {
    'i8vqxqcc': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    'si8mteym': {
      'en': 'Breath',
      'tr': 'Nefes',
    },
    'tlk7g7ee': {
      'en': 'Space is the breath of art.',
      'tr': 'Uzay sanatın nefesidir.',
    },
    'ly2z4i5v': {
      'en': 'II',
      'tr': 'II',
    },
    'emvxjajy': {
      'en': 'III',
      'tr': 'III',
    },
    'vmi1lvf7': {
      'en': 'IV',
      'tr': 'IV',
    },
    'bgepebl6': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    '1jsd1w8q': {
      'en': '',
      'tr': '',
    },
  },
  // human
  {
    'czwldbku': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    '67jd9o3k': {
      'en': 'Human',
      'tr': 'Beşeri',
    },
    '2acjxstk': {
      'en': 'Developed.',
      'tr': 'Geliştirilmiş.',
    },
    'r5bcz3lj': {
      'en': 'II',
      'tr': 'II',
    },
    '3x6ave7c': {
      'en': 'III',
      'tr': 'III',
    },
    'xvwg252n': {
      'en': 'IV',
      'tr': 'IV',
    },
    '6qmg3jnn': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    'bahpl338': {
      'en': '',
      'tr': '',
    },
  },
  // different
  {
    'w77ptwu4': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    'j0t4ke2e': {
      'en': 'Different',
      'tr': 'Farklı',
    },
    'fzzrwt8k': {
      'en': 'In order to be irreplaceable, one must always be different.',
      'tr': 'Yeri doldurulamaz olmak için her zaman farklı olmak gerekir.',
    },
    'c2tfdgd5': {
      'en': 'II',
      'tr': 'II',
    },
    '7l6escdb': {
      'en': 'III',
      'tr': 'III',
    },
    '2i69hj0i': {
      'en': 'IV',
      'tr': 'IV',
    },
    'p6t5wp7d': {
      'en': 'V',
      'tr': 'V',
    },
    's7fhlpkq': {
      'en': 'VI',
      'tr': 'VI',
    },
    'tpo2x1zv': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    '25369cgq': {
      'en': '',
      'tr': '',
    },
  },
  // ghrelin
  {
    'dxvn6o1i': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    'pep9eqwr': {
      'en': 'Ghrelin',
      'tr': 'Ghrelin',
    },
    '3fmzkhcz': {
      'en': 'Life is uncertain. Eat dessert first.',
      'tr': 'Hayat belirsiz. Önce bi tatlı yiyin.',
    },
    't514rhcj': {
      'en': 'II',
      'tr': 'II',
    },
    'oqkty0ru': {
      'en': 'III',
      'tr': 'III',
    },
    'g5vkqsba': {
      'en': 'IV',
      'tr': 'IV',
    },
    'v5p1yldr': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    'rrc9dd27': {
      'en': '',
      'tr': '',
    },
  },
  // arsonist
  {
    '0y2m4bw9': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    'jt57j39i': {
      'en': 'Art',
      'tr': 'Sanat',
    },
    'dnwlxi2f': {
      'en': 'Painting is just another way of keeping a diary.',
      'tr': 'Resim, günlük tutmanın başka bir yoludur.',
    },
    'ju5ezsg3': {
      'en': 'II',
      'tr': 'II',
    },
    '9rj4b72r': {
      'en': 'III',
      'tr': 'III',
    },
    'ik82619j': {
      'en': 'IV',
      'tr': 'IV',
    },
    '7qvcl02p': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    '0pxt3kjs': {
      'en': '',
      'tr': '',
    },
  },
  // editorial
  {
    '6l1kmv08': {
      'en': '◀︎ Collections',
      'tr': '◀︎ Koleksiyonlar',
    },
    '4oxjr8sa': {
      'en': 'Editorial',
      'tr': 'Editörün Seçimi',
    },
    'azfrnx7n': {
      'en': 'We tried to pick a few things for you.',
      'tr': 'Sizin için bir kaç şey seçtik.',
    },
    '6mgpyruf': {
      'en': 'II',
      'tr': 'II',
    },
    'npy5s4ck': {
      'en': 'III',
      'tr': 'III',
    },
    'qjmjh4r6': {
      'en': 'IV',
      'tr': 'IV',
    },
    'p0nbu6yo': {
      'en': 'Share your work with us.',
      'tr': 'Çalışmalarınızı bizimle paylaşmak ister misiniz?',
    },
    'm3sfs9sr': {
      'en': '',
      'tr': '',
    },
  },
  // mailscreen
  {
    '7dt1tjd6': {
      'en': 'Great!',
      'tr': 'Harika!',
    },
    'dypbuf6p': {
      'en':
          'Thank you for sending us an e-mail, we will reply you as soon as possible.',
      'tr':
          'Bize mail gönderdiğin için teşekkür ederiz, sizlere en yakın sürede cevap vereceğiz.',
    },
    'czykdu3w': {
      'en': 'Okay',
      'tr': 'Tamam',
    },
    'i479rcr5': {
      'en': '',
      'tr': '',
    },
  },
  // aboutoorbs
  {
    'z6hhnz10': {
      'en': 'Back to Settings',
      'tr': 'Ayarlara Dön',
    },
    'a17ujw2c': {
      'en': '',
      'tr': '',
    },
  },
  // gorunum
  {
    '4n4y8hwu': {
      'en': 'Home',
      'tr': '',
    },
  },
  // collectionsComponent
  {
    'lou130q7': {
      'en': 'WALLPAPER',
      'tr': '',
    },
    'gnj1b29z': {
      'en': 'Circadian',
      'tr': 'Sirkadiyen',
    },
    '5ua6kcvj': {
      'en': 'Refreshed daily',
      'tr': '',
    },
    'wmj3q825': {
      'en': 'Singularity',
      'tr': 'Tekillik',
    },
    '2i47iihi': {
      'en': 'Different',
      'tr': 'Farklı',
    },
    'ybddrlgu': {
      'en': 'Art',
      'tr': 'Sanat',
    },
    'upuw9gdr': {
      'en': 'Minimal',
      'tr': 'Minimal',
    },
    'drnmr8ln': {
      'en': 'Human',
      'tr': 'Beşeri',
    },
    'h8j08o5g': {
      'en': 'Instinct',
      'tr': 'Güdü',
    },
    'chqozkjk': {
      'en': 'Blurry',
      'tr': 'Bulanık',
    },
    's4w9biuh': {
      'en': 'Button',
      'tr': '',
    },
    'it8jcik5': {
      'en': 'Instinct',
      'tr': 'Güdü',
    },
    'aoy3bfvr': {
      'en': 'Stratosphere',
      'tr': 'Stratosfer',
    },
    'px3ih9u6': {
      'en': 'Petricor',
      'tr': 'Yağmur',
    },
    'uea9kdb9': {
      'en': 'Breath',
      'tr': 'Nefes',
    },
    '2prxj4ou': {
      'en': 'Dream',
      'tr': 'Rüya',
    },
    'urmqi9dk': {
      'en': 'Ghrelin',
      'tr': 'Ghrelin',
    },
    'dkx3100o': {
      'en': 'Silence',
      'tr': 'Sessizlik',
    },
    'ixkn35hl': {
      'en': 'Always\nRefreshing',
      'tr': 'Her zaman\nYenileniyor...',
    },
    'n85oljqo': {
      'en': 'Editorial...',
      'tr': 'Farklı Seçimler...',
    },
  },
  // Miscellaneous
  {
    'bzws463t': {
      'en': '',
      'tr': '',
    },
    'lkyx1ch3': {
      'en': '',
      'tr': '',
    },
    'ilsjj34d': {
      'en': 'Error',
      'tr': 'Hata',
    },
    'k0gs06ep': {
      'en': '',
      'tr': '',
    },
    'cr6skblp': {
      'en': '',
      'tr': '',
    },
    'tfq0hhkc': {
      'en': '',
      'tr': '',
    },
    '7e9ydw7u': {
      'en': '',
      'tr': '',
    },
    'sbmo55j9': {
      'en': '',
      'tr': '',
    },
    'bimawrep': {
      'en': '',
      'tr': '',
    },
    '12849zlt': {
      'en': '',
      'tr': '',
    },
    '5ll7tpzn': {
      'en': '',
      'tr': '',
    },
    'i62oaw0n': {
      'en': '',
      'tr': '',
    },
    'fb4w0fxo': {
      'en': '',
      'tr': '',
    },
    'ghqswvko': {
      'en': '',
      'tr': '',
    },
    'uxph5p9n': {
      'en': '',
      'tr': '',
    },
    'p4tbkcdy': {
      'en': '',
      'tr': '',
    },
    'ix2b35vu': {
      'en': '',
      'tr': '',
    },
    'ogyrttpd': {
      'en': '',
      'tr': '',
    },
    '16gjkem3': {
      'en': '',
      'tr': '',
    },
    'aun8uv60': {
      'en': '',
      'tr': '',
    },
    'w4ym7ycr': {
      'en': '',
      'tr': '',
    },
    'sn46hcd6': {
      'en': '',
      'tr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
