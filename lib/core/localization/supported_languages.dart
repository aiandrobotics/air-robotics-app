/// Catalog of all 82 languages supported by Flutter/Android Material localizations.
class SupportedLanguage {
  final String code;
  final String name;

  const SupportedLanguage(this.code, this.name);
}

class SupportedLanguages {
  SupportedLanguages._();

  /// All 82 language codes from `kMaterialSupportedLanguages`, sorted by display name.
  static const List<SupportedLanguage> all = [
    SupportedLanguage('af', 'Afrikaans'),
    SupportedLanguage('sq', 'Shqip (Albanian)'),
    SupportedLanguage('am', 'አማርኛ (Amharic)'),
    SupportedLanguage('ar', 'العربية (Arabic)'),
    SupportedLanguage('hy', 'Հայերեն (Armenian)'),
    SupportedLanguage('as', 'অসমীয়া (Assamese)'),
    SupportedLanguage('az', 'Azərbaycan (Azerbaijani)'),
    SupportedLanguage('eu', 'Euskara (Basque)'),
    SupportedLanguage('be', 'Беларуская (Belarusian)'),
    SupportedLanguage('bn', 'বাংলা (Bengali)'),
    SupportedLanguage('bs', 'Bosanski (Bosnian)'),
    SupportedLanguage('bg', 'Български (Bulgarian)'),
    SupportedLanguage('my', 'မြန်မာ (Burmese)'),
    SupportedLanguage('ca', 'Català (Catalan)'),
    SupportedLanguage('zh', '中文 (Chinese)'),
    SupportedLanguage('hr', 'Hrvatski (Croatian)'),
    SupportedLanguage('cs', 'Čeština (Czech)'),
    SupportedLanguage('da', 'Dansk (Danish)'),
    SupportedLanguage('nl', 'Nederlands (Dutch)'),
    SupportedLanguage('en', 'English'),
    SupportedLanguage('et', 'Eesti (Estonian)'),
    SupportedLanguage('fil', 'Filipino'),
    SupportedLanguage('fi', 'Suomi (Finnish)'),
    SupportedLanguage('fr', 'Français (French)'),
    SupportedLanguage('gl', 'Galego (Galician)'),
    SupportedLanguage('ka', 'ქართული (Georgian)'),
    SupportedLanguage('de', 'Deutsch (German)'),
    SupportedLanguage('el', 'Ελληνικά (Greek)'),
    SupportedLanguage('gu', 'ગુજરાતી (Gujarati)'),
    SupportedLanguage('he', 'עברית (Hebrew)'),
    SupportedLanguage('hi', 'हिन्दी (Hindi)'),
    SupportedLanguage('hu', 'Magyar (Hungarian)'),
    SupportedLanguage('is', 'Íslenska (Icelandic)'),
    SupportedLanguage('id', 'Bahasa Indonesia (Indonesian)'),
    SupportedLanguage('ga', 'Gaeilge (Irish)'),
    SupportedLanguage('it', 'Italiano (Italian)'),
    SupportedLanguage('ja', '日本語 (Japanese)'),
    SupportedLanguage('kn', 'ಕನ್ನಡ (Kannada)'),
    SupportedLanguage('kk', 'Қазақ (Kazakh)'),
    SupportedLanguage('km', 'ខ្មែរ (Khmer)'),
    SupportedLanguage('ko', '한국어 (Korean)'),
    SupportedLanguage('ky', 'Кыргызча (Kyrgyz)'),
    SupportedLanguage('lo', 'ລາວ (Lao)'),
    SupportedLanguage('lv', 'Latviešu (Latvian)'),
    SupportedLanguage('lt', 'Lietuvių (Lithuanian)'),
    SupportedLanguage('mk', 'Македонски (Macedonian)'),
    SupportedLanguage('ms', 'Bahasa Melayu (Malay)'),
    SupportedLanguage('ml', 'മലയാളം (Malayalam)'),
    SupportedLanguage('mr', 'मराठी (Marathi)'),
    SupportedLanguage('mn', 'Монгол (Mongolian)'),
    SupportedLanguage('ne', 'नेपाली (Nepali)'),
    SupportedLanguage('no', 'Norsk (Norwegian)'),
    SupportedLanguage('nb', 'Norsk bokmål (Norwegian Bokmål)'),
    SupportedLanguage('or', 'ଓଡ଼ିଆ (Odia)'),
    SupportedLanguage('ps', 'پښتو (Pashto)'),
    SupportedLanguage('fa', 'فارسی (Persian)'),
    SupportedLanguage('pl', 'Polski (Polish)'),
    SupportedLanguage('pt', 'Português (Portuguese)'),
    SupportedLanguage('pa', 'ਪੰਜਾਬੀ (Punjabi)'),
    SupportedLanguage('ro', 'Română (Romanian)'),
    SupportedLanguage('ru', 'Русский (Russian)'),
    SupportedLanguage('sr', 'Српски (Serbian)'),
    SupportedLanguage('si', 'සිංහල (Sinhala)'),
    SupportedLanguage('sk', 'Slovenčina (Slovak)'),
    SupportedLanguage('sl', 'Slovenščina (Slovenian)'),
    SupportedLanguage('es', 'Español (Spanish)'),
    SupportedLanguage('sw', 'Kiswahili (Swahili)'),
    SupportedLanguage('sv', 'Svenska (Swedish)'),
    SupportedLanguage('gsw', 'Schwiizertüütsch (Swiss German)'),
    SupportedLanguage('tl', 'Tagalog'),
    SupportedLanguage('ta', 'தமிழ் (Tamil)'),
    SupportedLanguage('te', 'తెలుగు (Telugu)'),
    SupportedLanguage('th', 'ไทย (Thai)'),
    SupportedLanguage('bo', 'བོད་སྐད་ (Tibetan)'),
    SupportedLanguage('tr', 'Türkçe (Turkish)'),
    SupportedLanguage('uk', 'Українська (Ukrainian)'),
    SupportedLanguage('ur', 'اردو (Urdu)'),
    SupportedLanguage('ug', 'ئۇيغۇرچە (Uyghur)'),
    SupportedLanguage('uz', 'Oʻzbek (Uzbek)'),
    SupportedLanguage('vi', 'Tiếng Việt (Vietnamese)'),
    SupportedLanguage('cy', 'Cymraeg (Welsh)'),
    SupportedLanguage('zu', 'isiZulu (Zulu)'),
  ];

  static String labelForCode(String? code, String systemDefaultLabel) {
    if (code == null) return systemDefaultLabel;
    for (final lang in all) {
      if (lang.code == code) return lang.name;
    }
    return code.toUpperCase();
  }
}
