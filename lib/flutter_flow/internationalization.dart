import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'de'];

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
    String? frText = '',
    String? deText = '',
  }) =>
      [enText, frText, deText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SignIn
  {
    'cev1swow': {
      'en': 'Sign In',
      'de': 'Anmelden',
      'fr': 'Se connecter',
    },
    'vor85dop': {
      'en': 'Email',
      'de': 'Email',
      'fr': 'E-mail',
    },
    'cycj0nui': {
      'en': 'Password',
      'de': 'Passwort',
      'fr': 'Mot de passe',
    },
    '1wgjbzhj': {
      'en': 'Sign In',
      'de': 'Anmelden',
      'fr': 'Se connecter',
    },
    'mt1vod7e': {
      'en': 'Forgot Password',
      'de': 'Passwort vergessen',
      'fr': 'Mot de passe oublié',
    },
    'c2gn05il': {
      'en': 'or register for free',
      'de': 'oder registrieren Sie sich kostenlos',
      'fr': 'ou inscrivez-vous gratuitement',
    },
    'zo7sllcg': {
      'en': 'EN',
      'de': 'EN',
      'fr': 'EN',
    },
    'spxbwg8y': {
      'en': 'FR',
      'de': 'FR',
      'fr': 'FR',
    },
    'zillwwi9': {
      'en': 'DE',
      'de': 'DE',
      'fr': 'DE',
    },
    'q89024o8': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // SignUp
  {
    '90q4r65s': {
      'en': 'Create a business account',
      'de': 'Erstellen Sie ein Geschäftskonto',
      'fr': 'Créer un compte business',
    },
    'cr6l3yif': {
      'en': 'Smart Order Processing System',
      'de': 'Beginnen wir mit dem Ausfüllen des untenstehenden Formulars.',
      'fr': 'Commençons par remplir le formulaire ci-dessous.',
    },
    '8m2k3zp5': {
      'en': 'Your name (i.e. John Doe)',
      'de': 'Ihr Name',
      'fr': 'Votre nom',
    },
    '9hryc0wd': {
      'en': 'Email',
      'de': 'Email',
      'fr': 'E-mail',
    },
    'rczel21o': {
      'en': 'Password',
      'de': 'Passwort',
      'fr': 'Mot de passe',
    },
    'g5psaqnj': {
      'en': 'Confirm Password',
      'de': 'Bestätige das Passwort',
      'fr': 'Confirmez le mot de passe',
    },
    '3wg2ejup': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'fr': 'Créer un compte',
    },
    'ffuogz8k': {
      'en': 'OR',
      'de': 'ODER',
      'fr': 'OU',
    },
    'rruico30': {
      'en': 'Already have an account? ',
      'de': 'Sie haben bereits ein Konto?',
      'fr': 'Vous avez déjà un compte?',
    },
    'dfumtc6e': {
      'en': ' Sign In here',
      'de': 'Hier anmelden',
      'fr': 'Se connecter ici',
    },
    'kr3wuu4j': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // Dashboard
  {
    '9akdegwo': {
      'en': 'Good to see you.',
      'de': 'Schön dich zu sehen.',
      'fr': 'Content de te voir.',
    },
    'vj7v2whv': {
      'en': 'Daily tracker',
      'de': 'Dashboard',
      'fr': 'Dashboard',
    },
    'pz7n52zr': {
      'en': 'Active orders:',
      'de': 'Aktive Bestellungen',
      'fr': 'Commandes actives',
    },
    '0n8cqwso': {
      'en': 'Scan table',
      'de': 'Tisch-Scanner',
      'fr': 'Scanner table',
    },
    '60cbeqlx': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    'l2bhjwd9': {
      'en': 'New order',
      'de': 'Neue Bestellung',
      'fr': 'Nouvelle commande',
    },
    'pwc11enu': {
      'en': '!',
      'de': '!',
      'fr': '!',
    },
    'g2h1drr0': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // MyAccount
  {
    'up98zaxn': {
      'en': 'Account',
      'de': 'Konto',
      'fr': 'Mes données',
    },
    '2khlweni': {
      'en': 'Shop data',
      'de': 'Daten aus Ihrem Shop',
      'fr': 'Données de votre shop',
    },
    'xx664n43': {
      'en': 'Edit bank details',
      'de': 'Zahlungsdaten',
      'fr': 'Données de paiement',
    },
    'bobwa9c9': {
      'en': 'Please fill in !',
      'de': 'Bitte vervollständigen',
      'fr': 'Complétez s\'il vous plaît !',
    },
    'cnf34vox': {
      'en': 'My items',
      'de': 'Speisekarte',
      'fr': 'Menu',
    },
    'j1uirksk': {
      'en': 'My tables',
      'de': 'Meine Tische',
      'fr': 'Mes tables',
    },
    'z9t4z17g': {
      'en': 'Orders history',
      'de': 'Bestellhistorie',
      'fr': 'Historique des commandes',
    },
    '6xna5bs1': {
      'en': 'My orders',
      'de': 'Meine Bestellungen',
      'fr': 'Mes commandes',
    },
    'qnkp6lwa': {
      'en': 'General',
      'de': 'Allgemein',
      'fr': 'Général',
    },
    'dii70qkf': {
      'en': 'Team',
      'de': 'Team',
      'fr': 'Team',
    },
    'qhxun5go': {
      'en': 'Terms of Service',
      'de': 'Nutzungsbedingungen',
      'fr': 'Conditions d\'utilisation',
    },
    'dzaxg07o': {
      'en': 'Log Out',
      'de': 'Ausloggen',
      'fr': 'Se déconnecter',
    },
  },
  // CreateStore1
  {
    '0u4c9s1a': {
      'en': 'Your store details',
      'de': 'Ihre Shop-Daten',
      'fr': 'Détails de votre shop',
    },
    '53jrljgi': {
      'en': 'Create your store 1/2',
      'de': 'Erstellen Sie Ihren Shop 1/2',
      'fr': 'Créez votre shop 1/2',
    },
    'wuiv1p3z': {
      'en': 'Name of your store',
      'de': 'Name Ihres Shops',
      'fr': 'Nom de votre shop',
    },
    'poznsbl0': {
      'en': 'Adress and number',
      'de': 'Adresse und Nummer',
      'fr': 'Adresse et numéro',
    },
    'q140i61q': {
      'en': 'ZIP Code and City',
      'de': 'Postleitzahl und Stadt',
      'fr': 'NPA Localité',
    },
    'r9ufxz5p': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'fr': 'Continuer',
    },
    't94oryla': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // CreateStore2
  {
    'lt0pxa0q': {
      'en': 'Your bank \ndetails',
      'de': 'Deine Bank\nEinzelheiten',
      'fr': 'Détail de votre banque',
    },
    'pw3ins32': {
      'en': 'Bill payments will be transferred to this account',
      'de': 'Die Zahlungen für die Zugaben werden auf dieses Konto überwiesen.',
      'fr': 'Les paiements des additions seront versés sur ce compte',
    },
    'hp3wfn6x': {
      'en': 'Create your store 2/2',
      'de': 'Erstellen Sie Ihren Shop 2/2',
      'fr': 'Créez votre Shop 2/2',
    },
    'tzrt8vsu': {
      'en': 'Beneficiary name',
      'de': 'Name des Begünstigten',
      'fr': 'Nom du bénéficiaire',
    },
    'sn0ho2nz': {
      'en': 'Company name / Private name',
      'de': 'Firmenname / Privatname',
      'fr': 'Nom de l\'entreprise / Nom privé',
    },
    '4n06jm1b': {
      'en': 'Beneficiary adress',
      'de': 'Empfängeradresse',
      'fr': 'Adresse du bénéficiaire',
    },
    'm2zocnwe': {
      'en': 'Zip code & City',
      'de': 'Postleitzahl Stadt',
      'fr': 'Code postal',
    },
    'qen8lga0': {
      'en': 'IBAN',
      'de': 'IBAN',
      'fr': 'IBAN',
    },
    '7uv5eubo': {
      'en': 'CH',
      'de': 'CH',
      'fr': 'CH',
    },
    '7g3aewgx': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    'xiyq22qp': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'pjy6l2y0': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    '00wzlhjc': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ilmdq5yh': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    'qtk7r4sj': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'wrdmdcgp': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'fr': 'Continuer',
    },
    'fmoqp1no': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // Items
  {
    'xkcwnsqc': {
      'en': 'Add item',
      'de': 'Artikel hinzufügen',
      'fr': 'Ajouter un article',
    },
    '73anikk3': {
      'en': 'Items',
      'de': 'Artikel',
      'fr': 'Articles',
    },
    '04ebnc2l': {
      'en': 'Availability',
      'de': 'Verfügbarkeit',
      'fr': 'Disponibilité',
    },
    'ijfpugws': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // UpdateItem
  {
    'ikatvup2': {
      'en': 'Update item',
      'de': 'Artikel aktualisieren',
      'fr': 'Mettre à jour l\'article',
    },
    '27r0048h': {
      'en': 'Name',
      'de': 'Name',
      'fr': 'Nom',
    },
    'ujwdtpza': {
      'en': 'Price',
      'de': 'Preis',
      'fr': 'Prix',
    },
    'sjnbq8tb': {
      'en': 'Comma [ , ] is not allowed',
      'de': 'Komma [ , ] ist nicht zulässig',
      'fr': 'La virgule [ , ] n\'est pas autorisée',
    },
    'spd7s5eh': {
      'en': 'Description',
      'de': 'Beschreibung',
      'fr': 'Description',
    },
    'dwyuvsjj': {
      'en': 'Specifications',
      'de': 'Spezifikationen',
      'fr': 'Caractéristiques',
    },
    'wfj2i7y0': {
      'en':
          'Inform service personnel about the item. (e.g. no more mozzarella)',
      'de':
          'Informieren Sie das Servicepersonal über den Artikel. (z. B. kein Mozzarella mehr)',
      'fr':
          'Informez le personnel de service à propos de l\'article. (par exemple plus de mozzarella)',
    },
    '6zebc9yi': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    'yrjn2rxk': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'yk6mnfla': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    'n650yftl': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '2hiyrijh': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    '5qkz0rdt': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ye55v4yt': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    '572cf2go': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '1r0wwe57': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    '3nd1bgy7': {
      'en': 'Save',
      'de': 'Speichern',
      'fr': 'Sauvegarder',
    },
    'zs2etkx3': {
      'en': 'Delete item',
      'de': 'Element löschen',
      'fr': 'Effacer l\'article',
    },
    'xclzttak': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // AddUpdateItem
  {
    's3oxdjgv': {
      'en': 'Add item',
      'de': 'Artikel hinzufügen',
      'fr': 'Ajouter un article',
    },
    'h2d12361': {
      'en': 'Name',
      'de': 'Name',
      'fr': 'Nom',
    },
    'cogzt4p1': {
      'en': 'Price',
      'de': 'Preis',
      'fr': 'Prix',
    },
    'eogfffd5': {
      'en': 'Comma [ , ] is not allowed',
      'de': 'Komma [ , ] ist nicht zulässig',
      'fr': 'La virgule [ , ] n\'est pas autorisée',
    },
    '0n63w9xv': {
      'en': 'Description',
      'de': 'Beschreibung',
      'fr': 'Description',
    },
    'eevza735': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    'u4gym8k5': {
      'en': 'Save',
      'de': 'Speichern',
      'fr': 'Sauvegarder',
    },
    'ei5ix61l': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    'kjyblf4n': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'j1ju5w4i': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    'exgx4i2p': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'xcip5our': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    'e2u1tz13': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'wya8y0rl': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    'tg6rwdhz': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'q8ulakov': {
      'en': 'Home',
      'de': 'ome',
      'fr': 'Home',
    },
  },
  // StoreDetails
  {
    'mgeb7vvr': {
      'en': 'Store details',
      'de': 'Details zum Shop',
      'fr': 'Détails du Shop',
    },
    '7qb6r8sl': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // UpdateStoreDetails
  {
    '64lbmz9d': {
      'en': 'Update Store details',
      'de': 'Store-Details aktualisieren',
      'fr': 'Mettre à jour les détails du Shop',
    },
    'rz9byklb': {
      'en': 'Name of your store\n',
      'de': 'Name Ihres Shops',
      'fr': 'Nom de votre Shop',
    },
    'zzsfb5rm': {
      'en': 'Adress and number\n',
      'de': 'Adresse und Nummer',
      'fr': 'Adresse et numéro',
    },
    'awg69tbc': {
      'en': 'ZIP Code and City',
      'de': 'Postleitzahl und Stadt',
      'fr': 'Code postal et ville',
    },
    'u8snmq08': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    'i839p3vu': {
      'en': 'Save',
      'de': 'Speichern',
      'fr': 'Sauvegarder',
    },
    '8wsihjca': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // UpdateBankDetails
  {
    'ta3ev8e6': {
      'en': 'Update Bank details',
      'de': 'Bankdaten aktualisieren',
      'fr': 'Mettre à jour les coordonnées bancaires',
    },
    'sxvjmpd2': {
      'en': 'Beneficiary Name',
      'de': 'Name des Begünstigten',
      'fr': 'Nom du bénéficiaire',
    },
    '6vtixg4s': {
      'en': 'Beneficiary adress',
      'de': 'Adresse des Empfängers',
      'fr': 'Adresse du bénéficiaire',
    },
    'dbp287ig': {
      'en': 'IBAN',
      'de': 'IBAN',
      'fr': 'IBAN',
    },
    'c91mkiit': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    'x2c8gu1v': {
      'en': 'Save',
      'de': 'Speichern',
      'fr': 'Sauvegarder',
    },
    'qn4549wz': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // Tables
  {
    '52kb2jxv': {
      'en': 'Add table',
      'de': 'Tisch hinzufügen',
      'fr': 'Ajouter une table',
    },
    'gqmvdmc4': {
      'en': 'Print',
      'de': 'Drucken',
      'fr': 'Imprimer',
    },
    'jmj70uxe': {
      'en': 'My tables',
      'de': 'Meine Tische',
      'fr': 'Mes Tables',
    },
    'iw285nr2': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // AddTable
  {
    'mtbg1vdd': {
      'en': 'Add table',
      'de': 'Tisch hinzufügen',
      'fr': 'Ajouter une table',
    },
    'f3fcd6g8': {
      'en': 'Name or Number',
      'de': 'Name oder Nummer',
      'fr': 'Nom ou numéro',
    },
    'ixf8tor5': {
      'en': 'Description',
      'de': 'Beschreibung',
      'fr': 'Description',
    },
    'x7xj7upz': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    'x1bpn64t': {
      'en': 'Save',
      'de': 'Speichern',
      'fr': 'Sauvegarder',
    },
    '8brehlp2': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // NewOrder
  {
    '5dc3zra4': {
      'en': 'Add items',
      'de': 'Artikel hinzufügen',
      'fr': 'Ajouter des articles',
    },
    '2y4taya9': {
      'en': 'Search by name',
      'de': 'Suche mit Name',
      'fr': 'Rechercher par nom',
    },
    '7h49xgte': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // ChooseTable
  {
    'op19v9hx': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    '42apecf9': {
      'en': 'Scan table',
      'de': 'Scan-Tisch',
      'fr': 'Scanez la table',
    },
    'n6uyvtcn': {
      'en': 'If you want to take a new order, you must scan the QR code',
      'de':
          'Wenn Sie eine neue Bestellung annehmen möchten, müssen Sie den QR-Code scannen',
      'fr':
          'Si vous souhaitez prendre une nouvelle commande, vous devez scanner le QR code',
    },
    '4w77qrpw': {
      'en': 'Scan table QR',
      'de': 'Scannen Sie den Tabellen-QR',
      'fr': 'Scanner le QR de la table',
    },
    'pxkewsky': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    'uvzpuiym': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // InvitedUser
  {
    'hjma4j6y': {
      'en': 'Join OrderNow',
      'de': 'Treten Sie OrderNow bei',
      'fr': 'Rejoignez OrderNow',
    },
    'nzsc7tuq': {
      'en': 'Create your profile as a staff member',
      'de': 'Erstellen Sie Ihr Profil als Mitarbeiter',
      'fr': 'Créez votre profil en tant que membre du Staff',
    },
    'g3vh33va': {
      'en': 'Your name',
      'de': 'Ihr Name',
      'fr': 'Votre nom',
    },
    '8e5ksd9o': {
      'en': 'Email',
      'de': 'Email',
      'fr': 'E-mail',
    },
    'kcz9xr1o': {
      'en': 'Password',
      'de': 'Passwort',
      'fr': 'Mot de passe',
    },
    'udpq7thh': {
      'en': 'Confirm Password',
      'de': 'Bestätige das Passwort',
      'fr': 'Confirmez le mot de passe',
    },
    '3a4kmz6x': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'fr': 'Créer un compte',
    },
    'eybid8wl': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // Team
  {
    'oaty8e3g': {
      'en': 'My Team',
      'de': 'Mein Team',
      'fr': 'Mon équipe',
    },
    'q0qfok18': {
      'en': 'Invited',
      'de': 'Eingeladen',
      'fr': 'Invités',
    },
    'fpnxkrf0': {
      'en': 'Team',
      'de': 'Team',
      'fr': 'Team',
    },
    'dv2t5pej': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // InvitePage
  {
    '2k7kes4i': {
      'en': 'Invite your staff',
      'de': 'Laden Sie Ihre Mitarbeiter ein',
      'fr': 'Invitez votre personnel',
    },
    'wwwl8k90': {
      'en':
          'Invite your team to join OrderNow. They\'ll be able to take orders, access items, add tables.',
      'de':
          'Laden Sie Ihr Team ein, sich OrderNow anzuschließen. Sie können Bestellungen entgegennehmen, auf Artikel zugreifen und Tische hinzufügen.',
      'fr':
          'Invitez votre équipe à rejoindre OrderNow. Ils pourront prendre des commandes, accéder aux articles, ajouter des tables.',
    },
    '1d2bbl6g': {
      'en': 'Email adress',
      'de': 'E-Mail-Adresse',
      'fr': 'Adresse email',
    },
    'jkvbo883': {
      'en': 'Enter email',
      'de': 'Email eingeben',
      'fr': 'Entrez l\'e-mail',
    },
    '01rr0i4l': {
      'en': 'Send invitation',
      'de': 'Einladung senden',
      'fr': 'Envoyer une invitation',
    },
    'hkvxz1zg': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    'f06ta97j': {
      'en': 'Back',
      'de': 'Zurück',
      'fr': 'Retour',
    },
    '6bfqj9xn': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // InvitationPageCopyLink
  {
    '86xy1gzi': {
      'en': 'Join OrderNow',
      'de': 'Treten Sie OrderNow bei',
      'fr': 'Rejoignez OrderNow',
    },
    'zgr3f1wq': {
      'en': 'Paste the code you received by email',
      'de': 'Fügen Sie den Code ein, den Sie per E-Mail erhalten haben',
      'fr': 'Collez le code que vous avez reçu par email',
    },
    'lkjvk16k': {
      'en': 'Your code goes here',
      'de': 'Ihr Code kommt hierher',
      'fr': 'Votre code va ici',
    },
    'pot0n8aq': {
      'en': 'Continue with registration',
      'de': 'Fahren Sie mit der Registrierung fort',
      'fr': 'Continuer l\'inscription',
    },
    'whpy8b1a': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // ProductDetails
  {
    's3nitay0': {
      'en': 'Description',
      'de': 'Beschreibung',
      'fr': 'Description',
    },
    '0mig3lyr': {
      'en': 'Extra comments',
      'de': ' Kommentare',
      'fr': 'Commentaires',
    },
    '0z7htsjg': {
      'en': 'e.g. without mushrooms',
      'de': 'z.B. ohne Pilze',
      'fr': 'par exemple. sans champignons',
    },
    'cakadscq': {
      'en': 'Quanity',
      'de': 'Menge',
      'fr': 'Quantité',
    },
    'gpbvrq5z': {
      'en': 'Add To Cart',
      'de': 'In den Warenkorb legen',
      'fr': 'Ajouter au panier',
    },
    '96rqgv5x': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // Checkout
  {
    'hflxqq6b': {
      'en': 'Price Breakdown',
      'de': 'Preisaufschlüsselung',
      'fr': 'Détails prix',
    },
    '5ercb35x': {
      'en': 'Subtotal',
      'de': 'Zwischensumme',
      'fr': 'Total',
    },
    'jr1t9dhk': {
      'en': 'Extra charges',
      'de': 'Extrakosten',
      'fr': 'Frais supplémentaires',
    },
    'lliu3wtb': {
      'en': 'Discount',
      'de': 'Rabatt',
      'fr': 'Rabais',
    },
    'rhz0gmgt': {
      'en': 'Tip',
      'de': 'Tipp',
      'fr': 'Pourboire',
    },
    'j33amz85': {
      'en': 'OrderNow Pay fees',
      'de': 'Tipp',
      'fr': 'Pourboire',
    },
    'afcy56k9': {
      'en': 'Total',
      'de': 'Gesamt',
      'fr': 'Total',
    },
    '5whot6tx': {
      'en': 'Tip',
      'de': 'Trinkgeld',
      'fr': 'Pourboire',
    },
    'hhnblemg': {
      'en': 'Extra charges',
      'de': 'Extrakosten',
      'fr': 'Frais extra',
    },
    'ldhts9xe': {
      'en': 'Discount',
      'de': 'Rabatt',
      'fr': 'Remise',
    },
    'vnriltvf': {
      'en': 'Pay',
      'de': 'Pay',
      'fr': 'Pay',
    },
    's0skw56o': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // SignUpUser
  {
    '1kl9sc8o': {
      'en': 'Sign up',
      'de': 'Melden Sie sich an',
      'fr': 'S\'inscrire',
    },
    '39eackbk': {
      'en': 'Pay your bill online',
      'de': 'Bezahlen Sie Ihre Rechnung online',
      'fr': 'Payez votre addition en ligne',
    },
    'd2umx05j': {
      'en': 'Your name',
      'de': 'Ihr Name',
      'fr': 'Votre nom',
    },
    'l11nlv2q': {
      'en': 'Email',
      'de': 'Email',
      'fr': 'E-mail',
    },
    'el4na3zd': {
      'en': 'Password',
      'de': 'Passwort',
      'fr': 'Mot de passe',
    },
    'ebb5anju': {
      'en': 'Confirm Password',
      'de': 'Bestätige das Passwort',
      'fr': 'Confirmez le mot de passe',
    },
    'rn8zkhuq': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'fr': 'Créer un compte',
    },
    'w96elwqt': {
      'en': 'OR',
      'de': 'ODER',
      'fr': 'OU',
    },
    'zbz9mpxb': {
      'en': 'Already have an account? ',
      'de': 'Sie haben bereits ein Konto?',
      'fr': 'Vous avez déjà un compte?',
    },
    'r2316awf': {
      'en': ' Sign In here',
      'de': 'Hier anmelden',
      'fr': 'Se connecter ici',
    },
    'facq8d7e': {
      'en': 'Create account for my restaurant',
      'de': 'Ich bin ein Profi\nGehen Sie zur Seite Business',
      'fr': 'je suis un professionnel\nAller à la page Business',
    },
    'mvof82sy': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    'j4z0c26u': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'tf8frwhu': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    'hs68ckxi': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '2v7iwred': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    '220iwgom': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '94b5kex9': {
      'en': 'Field is required',
      'de': 'Feld ist erforderlich',
      'fr': 'Champ requis',
    },
    'jub9ht5r': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste aus',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'mbog1y5p': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // BusinessListOrderHistory
  {
    'bjmm93pw': {
      'en': 'Recent Orders',
      'de': 'letzte Bestellungen',
      'fr': 'Historique des commandes',
    },
    'aoejo1c2': {
      'en': 'Below are your most recent orders',
      'de': 'Nachfolgend finden Sie Ihre letzten Bestellungen',
      'fr': 'Ci-dessous vos dernières commandes',
    },
    'cljinu9z': {
      'en': 'Order #: ',
      'de': 'Befehl #:',
      'fr': 'Commande #:',
    },
    'ua2h2pt2': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // UserOrderHistory
  {
    'jx6xaipi': {
      'en': 'Recent Orders',
      'de': 'letzte Bestellungen',
      'fr': 'Dernières commandes',
    },
    'pc60wsa6': {
      'en': 'Below are your orders',
      'de': 'Nachfolgend finden Sie Ihre Bestellungen',
      'fr': 'Ci-dessous vos commandes',
    },
    'g6iwdvyh': {
      'en': '@',
      'de': '@',
      'fr': '@',
    },
    'boh7chiq': {
      'en': 'Order #: ',
      'de': 'Befehl #:',
      'fr': 'Commande #:',
    },
    'cxubtz9n': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // PaymentList
  {
    'rcp5ms8t': {
      'en': 'Logout',
      'de': 'Ausloggen',
      'fr': 'Se déconnecter',
    },
    'sh0bxdln': {
      'en': 'Restaurants payments',
      'de': 'Liste der Zahlungen Restaurants',
      'fr': 'Liste des paiements Restaurant',
    },
    'fjn6umqv': {
      'en': 'Staff payments',
      'de': 'Liste der Zahlungen Staff',
      'fr': 'Paiements Staff',
    },
    '7j11cdyy': {
      'en': 'To be paid',
      'de': 'Zu bezahlen',
      'fr': 'A payer',
    },
    'usmw28qy': {
      'en': 'Paid',
      'de': 'Bezahlt',
      'fr': 'Payé',
    },
    'cqee3uin': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // ticketDetail
  {
    '1k9lq4d5': {
      'en': 'Payment Details',
      'de': 'Zahlungsdetails',
      'fr': 'Détails du paiement',
    },
    'eena52fo': {
      'en': 'Transaction ID',
      'de': 'Transaktions-ID',
      'fr': 'ID de la transaction',
    },
    'tm4dtury': {
      'en': 'Date',
      'de': 'Datum',
      'fr': 'Date',
    },
    'bc11qf5e': {
      'en': 'Amount',
      'de': 'Menge',
      'fr': 'Montant',
    },
    '02367vwd': {
      'en': 'Status',
      'de': 'Status',
      'fr': 'Statut',
    },
    '3v06lvwz': {
      'en': 'Completed',
      'de': 'Vollendet',
      'fr': 'Terminé',
    },
    'gxt0rgmh': {
      'en': 'Payment Method',
      'de': 'Bezahlverfahren',
      'fr': 'Mode de paiement',
    },
    'z833o7la': {
      'en': 'Debit/Credit Card',
      'de': 'Lastschrift [?] Kreditkarte',
      'fr': 'Carte de débit/crédit',
    },
    '515qjm9i': {
      'en': 'Transaction Breakdown (VAT Incl.)',
      'de': 'Transaktionsaufschlüsselung (inkl. MwSt.)',
      'fr': 'Répartition des transactions (TVA incl.)',
    },
    'ucv811j4': {
      'en': 'Subtotal',
      'de': 'Zwischensumme',
      'fr': 'Total',
    },
    'u08ywe7r': {
      'en': 'Extra charges',
      'de': 'Extrakosten',
      'fr': 'Frais supplémentaires',
    },
    '71p6putr': {
      'en': 'Tip',
      'de': 'Trinkgeld',
      'fr': 'Pourboire',
    },
    'vf8o0xwc': {
      'en': 'Discount',
      'de': 'Rabatt',
      'fr': 'Rabais',
    },
    'mv14dugh': {
      'en': 'Total',
      'de': 'Gesamt',
      'fr': 'Total',
    },
    '0kb8r8cz': {
      'en': 'Store details',
      'de': 'Details zum Shop',
      'fr': 'Détails du Shop',
    },
    'lk0ty2fb': {
      'en': 'Share',
      'de': 'Aktie',
      'fr': 'Partager',
    },
    '694orle0': {
      'en': 'Store details',
      'de': 'Details zum Shop',
      'fr': 'Détails du Shop',
    },
    'lu5xzqu4': {
      'en': 'Address',
      'de': 'Adresse',
      'fr': 'Adresse',
    },
    'bmavrn9n': {
      'en': 'Message Customer',
      'de': 'Nachricht an den Kunden',
      'fr': 'Message client',
    },
    '8qzzjlc6': {
      'en': 'Report Now',
      'de': 'Jetzt melden',
      'fr': 'Signaler maintenant',
    },
    'owyvz7h7': {
      'en': 'Order Details',
      'de': 'Bestelldetails',
      'fr': 'détails de la commande',
    },
  },
  // SuccessPage
  {
    'rjmgqn56': {
      'en': 'Payment successful',
      'de': 'Bezahlung erfolgreich',
      'fr': 'Paiement réussi',
    },
    'iwp2knyv': {
      'en': 'Thank you !',
      'de': 'Danke !',
      'fr': 'Merci !',
    },
    '6bc51u0j': {
      'en': 'Go Home',
      'de': 'Go Home',
      'fr': 'Retou',
    },
    'lx7esnsc': {
      'en': 'Home',
      'de': 'Home',
      'fr': 'Home',
    },
  },
  // RestaurantPaymentDetails
  {
    '4dw7f6be': {
      'en': 'Details du paiement',
      'de': 'Einzelheiten zur Zahlung',
      'fr': 'Détails du paiement',
    },
    'quf72vqr': {
      'en':
          'Lorsque le paiement a bien été effecuté sur l\'ebanking, merci de cliquer sur le bouton \"Payer\"',
      'de':
          'Wenn die Zahlung bereits bei E-Banking erfolgt ist, klicken Sie bitte auf die Schaltfläche „Zahler“.',
      'fr':
          'Lorsque le paiement a bien été effectué sur l\'ebanking, merci de cliquer sur le bouton \"Payer\"',
    },
    'zwll5lpa': {
      'en': 'Numéro de la commande\n(Message pour le bénéficiaire)',
      'de': 'Numéro de la commande\n(Message pour le bénéficiaire)',
      'fr': 'Numéro de commande\n(Message pour le bénéficiaire)',
    },
    'dgcyuk5e': {
      'en': 'Bénéficiaire',
      'de': 'Bénéficiaire',
      'fr': 'Bénéficiaire',
    },
    'iyoaajkl': {
      'en': 'Adresse',
      'de': 'Adresse',
      'fr': 'Adresse',
    },
    'sy54fwb3': {
      'en': 'IBAN',
      'de': 'IBAN',
      'fr': 'IBAN',
    },
    'ip3ds7x6': {
      'en': 'Montant net à verser (CHF)',
      'de': 'Netto-Umsatz (CHF)',
      'fr': 'Montant net à verser (CHF)',
    },
    '2p5cwxay': {
      'en': 'Payer',
      'de': 'Zahler',
      'fr': 'Payeur',
    },
    '31is1nh6': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // AuthCindy
  {
    'x92q7e8s': {
      'en': 'OrderNow for Moderator',
      'de': 'Jetzt für Moderator bestellen',
      'fr': 'Commandez maintenant pour le modérateur',
    },
    '11cw4as6': {
      'en': '',
      'de': 'Anmeldung',
      'fr': 'Se connecter',
    },
    '3a2kdf8n': {
      'en': 'Welcome Back',
      'de': 'Willkommen zurück',
      'fr': 'Content de te revoir',
    },
    'cwnsxt89': {
      'en': 'Fill out the information below in order to access your account.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um auf Ihr Konto zuzugreifen.',
      'fr':
          'Remplissez les informations ci-dessous afin d\'accéder à votre compte.',
    },
    'pzoc6qif': {
      'en': 'Email',
      'de': 'Email',
      'fr': 'E-mail',
    },
    'mftsvpsw': {
      'en': 'Password',
      'de': 'Passwort',
      'fr': 'Mot de passe',
    },
    '67v567yb': {
      'en': 'Sign In',
      'de': 'Anmelden',
      'fr': 'Se connecter',
    },
    'aybixaa9': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // page
  {
    '5zhv3dnd': {
      'en': 'Home',
      'de': '',
      'fr': '',
    },
  },
  // PaymentStaffList
  {
    'jkzbk0eh': {
      'en': 'Logout',
      'de': 'Ausloggen',
      'fr': 'Se déconnecter',
    },
    'm6ypk789': {
      'en': 'Staff Payments',
      'de': 'Liste der Zahlungen Staff',
      'fr': 'Paiements Staff',
    },
    '4myex7iv': {
      'en': 'Restaurant payments',
      'de': 'Liste der Zahlungen für Restaurant',
      'fr': 'Paiement restaurants',
    },
    'jpy1y2gn': {
      'en': 'A payer',
      'de': 'Zu  Zahlen',
      'fr': 'A payer',
    },
    '71vakx3u': {
      'en': 'Payé',
      'de': 'Payé',
      'fr': 'Payé',
    },
    'iztnq8p3': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // PaymentStaffDetails
  {
    'eo88nbc5': {
      'en': 'Details du paiement',
      'de': 'Einzelheiten zur Zahlung',
      'fr': 'Détails du paiement',
    },
    '1p447fnc': {
      'en':
          'Lorsque le paiement a bien été effecuté sur l\'ebanking, merci de cliquer sur le bouton \"Payer\"',
      'de':
          'Wenn die Zahlung bereits bei E-Banking erfolgt ist, klicken Sie bitte auf die Schaltfläche „Zahler“.',
      'fr':
          'Lorsque le paiement a bien été effectué sur l\'ebanking, merci de cliquer sur le bouton \"Payer\"',
    },
    '1tt7b8zb': {
      'en': 'Numéro de la commande\n(Message pour le bénéficiaire)',
      'de': 'Numéro de la commande\n(Message pour le bénéficiaire)',
      'fr': 'Numéro de commande\n(Message pour le bénéficiaire)',
    },
    'wky63pzy': {
      'en': 'Bénéficiaire',
      'de': 'Bénéficiaire',
      'fr': 'Bénéficiaire',
    },
    'izjdpu10': {
      'en': 'Adresse',
      'de': 'Adresse',
      'fr': 'Adresse',
    },
    'at6fe0g9': {
      'en': 'IBAN',
      'de': 'IBAN',
      'fr': 'IBAN',
    },
    'ydafk6hb': {
      'en': 'Montant net à verser (CHF)',
      'de': 'Netto-Umsatz (CHF)',
      'fr': 'Montant net à verser (CHF)',
    },
    'u6f1k9s8': {
      'en': 'Pay',
      'de': 'Zahlen',
      'fr': 'Payer',
    },
    '2h8hf4zs': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // OrderListEmpty
  {
    '5out5q08': {
      'en': 'Seems you don’t have \nany orders',
      'de': 'Scheint, als hättest du das nicht\nirgendwelche Bestellungen',
      'fr': 'Pas de commande en cours',
    },
    'bzbv6h5c': {
      'en': 'To create a new order, start by scanning your customer\'s table',
      'de':
          'Um eine neue Bestellung zu erstellen, scannen Sie zunächst den Tisch Ihres Kunden',
      'fr':
          'Pour créer une nouvelle commande, commence par scanner la table de du client',
    },
  },
  // Tagbutton
  {
    '4fn81jir': {
      'en': 'Hello World',
      'de': 'Hallo Welt',
      'fr': 'Bonjour le monde',
    },
  },
  // tags
  {
    'qsdhaxzt': {
      'en': 'X',
      'de': 'X',
      'fr': 'X',
    },
  },
  // tipSheet
  {
    'a2402x3l': {
      'en': 'Add tip',
      'de': 'Trinkgeld hinzufügen',
      'fr': 'Ajouter un pourboire',
    },
    'lvw6iwcu': {
      'en': 'You have been served by:',
      'de': 'Sie wurden bedient von:',
      'fr': 'Vous avez été servi par :',
    },
    'mqb3zuyg': {
      'en': 'CHF 0.00 (Comma [ , ] not allowed)',
      'de': 'CHF 0.00 (Komma [ , ] nicht erlaubt)',
      'fr': 'CHF 0.00 (virgule [ , ] non autorisée)',
    },
    'h9xjt5sp': {
      'en': 'Add tip',
      'de': 'Trinkgeld hinzufügen',
      'fr': 'Ajouter un pourboire',
    },
  },
  // Card40PropertyDetails
  {
    'u9t3v838': {
      'en': '56292 West Hollywood Blvd.',
      'de': '56292 West Hollywood Blvd.',
      'fr': '56292, boulevard West Hollywood.',
    },
    'jofu6m8f': {
      'en': 'San Fransico, CA. 98210',
      'de': 'San Francisco, Kalifornien. 98210',
      'fr': 'San Francisco, Californie. 98210',
    },
    '9vx8olvh': {
      'en': 'Available',
      'de': 'Verfügbar',
      'fr': 'Disponible',
    },
    'suq009i0': {
      'en': '621 Views',
      'de': '621 Aufrufe',
      'fr': '621 vues',
    },
  },
  // discountSheet
  {
    'lf1h386e': {
      'en': 'Add discount',
      'de': 'Rabatt hinzufügen',
      'fr': 'Ajouter une remise',
    },
    'kujtvg4i': {
      'en': 'CHF 0.00 (Comma [ , ] not allowed)',
      'de': 'CHF 0.00 (Komma [ , ] nicht erlaubt)',
      'fr': 'CHF 0.00 (virgule [ , ] non autorisée)',
    },
    '6tzsvpdk': {
      'en': 'Add discount',
      'de': 'Rabatt hinzufügen',
      'fr': 'Ajouter une remise',
    },
  },
  // extraChargeSheet
  {
    'p8x3x08a': {
      'en': 'Add extra charges',
      'de': 'Fügen Sie zusätzliche Gebühren in Höhe von hinzu',
      'fr': 'Ajouter des frais supplémentaires',
    },
    't8bzrwwa': {
      'en': 'CHF 0.00 (Comma [ , ] not allowed)',
      'de': 'CHF 0.00 (Komma [ , ] nicht erlaubt)',
      'fr': 'CHF 0.00 (virgule [ , ] non autorisée)',
    },
    'v7vix5h2': {
      'en': 'Add charge',
      'de': 'Gebühr hinzufügen',
      'fr': 'Ajouter des frais',
    },
  },
  // BuyStickers
  {
    'd1q84e2b': {
      'en': 'Vinyl Stickers',
      'de': 'Vinylaufkleber',
      'fr': 'Autocollants Vinyl',
    },
    'turznbm2': {
      'en': 'CHF 29.00',
      'de': 'CHF 29.00',
      'fr': 'CHF 29.00',
    },
    '7bue1wgo': {
      'en': 'Printed and send to your Adress',
      'de': 'Ausgedruckt und an Ihre Adresse verschicken',
      'fr': 'Imprimé et envoyé à votre adresse',
    },
    'lffkmh0g': {
      'en': 'Name',
      'de': 'Name',
      'fr': 'Nom',
    },
    'o2hw8mmu': {
      'en': 'Name',
      'de': '',
      'fr': '',
    },
    '8oo4mc38': {
      'en': 'Adress and number',
      'de': 'Adresse und numer',
      'fr': 'Adresse et numéro',
    },
    'lvyelkwg': {
      'en': 'Adress',
      'de': '',
      'fr': '',
    },
    'b16rix8w': {
      'en': 'Zip code and City',
      'de': 'PLZ Ort',
      'fr': 'NPA Localité',
    },
    'madthgdd': {
      'en': 'City',
      'de': '',
      'fr': '',
    },
    '62225jpp': {
      'en': 'Order & Pay',
      'de': 'Bestellen und bezahlen',
      'fr': 'Commander et payer',
    },
  },
  // Language
  {
    'qe6un6bj': {
      'en': 'Select language',
      'de': 'Sprache auswählen',
      'fr': 'Choisissez une langue',
    },
    '7j69lbou': {
      'en': 'English',
      'de': 'English',
      'fr': 'English',
    },
    '5yu9m6hr': {
      'en': 'Français',
      'de': 'Français',
      'fr': 'Français',
    },
    'qkdi8tkd': {
      'en': 'Deutsch',
      'de': 'Deutsch',
      'fr': 'Deutsch',
    },
  },
  // Miscellaneous
  {
    'czr5w4bn': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'de':
          'Um ein Bild oder Video aufzunehmen, benötigt diese App die Erlaubnis, auf die Kamera zuzugreifen.',
      'fr':
          'Afin de prendre une photo ou une vidéo, cette application nécessite une autorisation pour accéder à la caméra.',
    },
    '518rurxt': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'de':
          'Um Daten hochzuladen, benötigt diese App die Erlaubnis, auf die Fotobibliothek zuzugreifen.',
      'fr':
          'Afin de télécharger des données, cette application nécessite l\'autorisation d\'accéder à la photothèque.',
    },
    'vu5n3bic': {
      'en': '',
      'de': 'Error: [error]',
      'fr': 'Erreur: [error]',
    },
    'urfrgf49': {
      'en': '',
      'de': 'Es wurde eine E-Mail zum Zurücksetzen Ihres Passworts gesendet',
      'fr': 'Un email a été envoyé pour réinitialiser votre mot de passe',
    },
    '6qzjlj1q': {
      'en': '',
      'de': 'E-Mail erforderlich!',
      'fr': 'Email requis!',
    },
    'egwaa0mp': {
      'en': '',
      'de': '',
      'fr': '',
    },
    '1530ossm': {
      'en': '',
      'de': 'Die Passwörter stimmen nicht überein.',
      'fr': 'Les mots de passe ne correspondent pas.',
    },
    'sxli4rk2': {
      'en': '',
      'de': '',
      'fr': '',
    },
    'tuumdsk3': {
      'en': '',
      'de': '',
      'fr': '',
    },
    'n38jc781': {
      'en': '',
      'de': '',
      'fr': '',
    },
    '4ktivyvo': {
      'en': '',
      'de': '',
      'fr': '',
    },
    'mofr0v3p': {
      'en': '',
      'de': '',
      'fr': '',
    },
    'v96jquf3': {
      'en': '',
      'de': '',
      'fr': '',
    },
    'skcco06k': {
      'en': '',
      'de': '',
      'fr': '',
    },
    '94tovai9': {
      'en': '',
      'de': '',
      'fr': '',
    },
    '0q35pe83': {
      'en': '',
      'de': '',
      'fr': '',
    },
    '4799ctvi': {
      'en': '',
      'de': 'Quelle wählen',
      'fr': 'Choisir source',
    },
    's982fvot': {
      'en': '',
      'de': 'Galerie',
      'fr': 'Galerie',
    },
    'tixijvau': {
      'en': '',
      'de': 'Fotogalerie',
      'fr': 'Galie (Photo)',
    },
    'sa0gyxz0': {
      'en': '',
      'de': 'Video-Galerie',
      'fr': 'Galerie (Vidéo)',
    },
    '5njx7j0d': {
      'en': '',
      'de': 'Appereil Foto',
      'fr': 'Appereil photo',
    },
    'xg23sxb4': {
      'en': '',
      'de': '',
      'fr': '',
    },
    'wyiq5lpx': {
      'en': '',
      'de': '',
      'fr': '',
    },
    '4gs5kpaj': {
      'en': '',
      'de': '',
      'fr': '',
    },
    '68ud3bzc': {
      'en': 'Payment error! Check your payment method or contact your bank.',
      'de':
          'Zahlungsfehler! Überprüfen Sie Ihre Zahlungsmethode oder wenden Sie sich an Ihre Bank.',
      'fr':
          'Erreur de paiement! Vérifiez votre mode de paiement ou contactez votre banque.',
    },
  },
].reduce((a, b) => a..addAll(b));
