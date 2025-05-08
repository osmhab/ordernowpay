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
  // SignIn
  {
    'xct8rr1u': {
      'en': 'AppStore',
      'de': 'AppStore',
      'fr': 'AppStore',
    },
    'iyehu8u0': {
      'en': 'Google Store',
      'de': 'Google Store',
      'fr': 'Boutique Google',
    },
    'cev1swow': {
      'en': 'Sign In',
      'de': 'Anmelden',
      'fr': 'Se connecter',
    },
    'vor85dop': {
      'en': 'Email',
      'de': 'E-Mail',
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
      'de': 'oder kostenlos registrieren',
      'fr': 'ou inscrivez-vous gratuitement',
    },
    'zo7sllcg': {
      'en': 'EN',
      'de': 'DE',
      'fr': 'FR',
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
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // SignUp
  {
    '90q4r65s': {
      'en': 'OrderNow Pay Business account',
      'de': 'Geschäftskonto',
      'fr': 'Compte professionnel',
    },
    'cr6l3yif': {
      'en': 'CHF 99.- / year subscription',
      'de': 'CHF 99.- / Jahresabonnement',
      'fr': 'CHF 99.- / abonnement annuel',
    },
    '8m2k3zp5': {
      'en': 'Your name (i.e. John Doe)*',
      'de': 'Ihr Name (z. B. John Doe)*',
      'fr': 'Votre nom (par exemple John Doe)*',
    },
    '9hryc0wd': {
      'en': 'Email*',
      'de': 'E-Mail*',
      'fr': 'E-mail*',
    },
    'xil1jbyp': {
      'en': 'Telephone number',
      'de': 'Telefonnummer',
      'fr': 'Numéro de téléphone',
    },
    'wftntjww': {
      'en': '+41 79',
      'de': '+41 79',
      'fr': '+41 79',
    },
    'rczel21o': {
      'en': 'Password*',
      'de': 'Passwort*',
      'fr': 'Mot de passe*',
    },
    'g5psaqnj': {
      'en': 'Confirm Password*',
      'de': 'Passwort bestätigen*',
      'fr': 'Confirmez le mot de passe*',
    },
    '0aut0w4o': {
      'en': 'I accept the terms and conditions of use',
      'de': 'Ich akzeptiere die Nutzungsbedingungen',
      'fr': 'J\'accepte les conditions générales d\'utilisation',
    },
    '3wg2ejup': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'fr': 'Créer un compte',
    },
    'llranzbi': {
      'en': 'Payment failed',
      'de': 'Zahlung fehler',
      'fr': 'Echec du paiement',
    },
    'mhzlty7e': {
      'en':
          'The payment has failed. Please check your information or contact your bank.',
      'de':
          'Die Zahlung ist fehlgeschlagen. Bitte prüfen Sie Ihre Angaben oder wenden Sie sich an Ihre Bank.',
      'fr':
          'Le paiement a échoué. Veuillez vérifier vos informations ou contactez votre banque.',
    },
    'tfpq24fw': {
      'en': 'Success',
      'de': 'Zahlung erfolgreich',
      'fr': 'Paiement effectué',
    },
    '958yqpbj': {
      'en': 'Thank you. Your payment has been successfully processed.',
      'de': 'Vielen Dank. Ihre Zahlung wurde erfolgreich abgeschlossen.',
      'fr': 'Merci. Votre paiement a été effectué avec succès.',
    },
    'muuajpak': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    '6t5sy419': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'kryxpjl3': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'thf9yn2e': {
      'en': 'Email adress not correct',
      'de': 'E-Mail-Adresse nicht korrekt',
      'fr': 'Adresse e-mail incorrecte',
    },
    '6ixfpuiw': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '33yp4qs2': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'jdsudwar': {
      'en': 'Minimum 8 characters',
      'de': 'Mindestens 8 Zeichen',
      'fr': 'Minimum 8 caractères',
    },
    'fvq863pp': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '3s6o1ylw': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'hz1iqnbc': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ffuogz8k': {
      'en': 'OR',
      'de': 'ODER',
      'fr': 'OU',
    },
    'rruico30': {
      'en': 'Already have an account? ',
      'de': 'Hast du schon ein Konto?',
      'fr': 'Vous avez déjà un compte ?',
    },
    'dfumtc6e': {
      'en': 'Sign In here',
      'de': 'Hier anmelden',
      'fr': 'Connectez-vous ici',
    },
    'lzyc11ws': {
      'en': 'OrderNow Business Subcription',
      'de': 'OrderNow-Geschäftsabonnement',
      'fr': 'Abonnement d\'entreprise OrderNow',
    },
    'c6mvjm95': {
      'en': 'CHF 99.-',
      'de': 'CHF 99.-',
      'fr': 'CHF 99.-',
    },
    '0b76247u': {
      'en': '/ year',
      'de': '/ Jahr',
      'fr': '/ année',
    },
    'kr3wuu4j': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // Dashboard
  {
    'mmb0k2rl': {
      'en': 'AppStore',
      'de': 'AppStore',
      'fr': 'AppStore',
    },
    'skude1nf': {
      'en': 'Google Store',
      'de': 'Google Store',
      'fr': 'Google Store',
    },
    'w0hx4i5c': {
      'en': 'Active orders:',
      'de': 'Aktive Bestellungen:',
      'fr': 'Commandes actives :',
    },
    '02azyase': {
      'en': 'Last orders',
      'de': 'Letzte Bestellungen',
      'fr': 'Dernières commandes',
    },
    'yjeqmnrk': {
      'en': 'View all',
      'de': 'Alle ansehen',
      'fr': 'Tout voir',
    },
    '1mfpanyg': {
      'en': 'Last orders',
      'de': 'Letzte Bestellungen',
      'fr': 'Dernières commandes',
    },
    'smx35c18': {
      'en': 'View all',
      'de': 'Alle ansehen',
      'fr': 'Tout voir',
    },
    '1vdteirm': {
      'en': 'New Order',
      'de': 'Neue Bestellung',
      'fr': 'Nouvelle commande',
    },
    'q2ycok3o': {
      'en': 'Pay',
      'de': 'Zahlen',
      'fr': 'Payer',
    },
    'ixp9ek8y': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    'g2h1drr0': {
      'en': 'Dashboard',
      'de': 'Armaturenbrett',
      'fr': 'Tableau de bord',
    },
  },
  // MyAccount
  {
    'up98zaxn': {
      'en': 'Account',
      'de': 'Konto',
      'fr': 'Compte',
    },
    '2khlweni': {
      'en': 'CRM',
      'de': 'CRM',
      'fr': 'CRM',
    },
    '1k41whhf': {
      'en': 'Payments',
      'de': 'Zahlungen',
      'fr': 'Paiements',
    },
    '4a77w8d5': {
      'en': 'Sales and revenue',
      'de': 'Umsatz und Erträge',
      'fr': 'Ventes et revenus',
    },
    'dzsfaple': {
      'en': 'My restaurant',
      'de': 'Mein Restaurant',
      'fr': 'Mon restaurant',
    },
    'xx664n43': {
      'en': 'Bank details',
      'de': 'Bankverbindung',
      'fr': 'Coordonnées bancaires',
    },
    'j1uirksk': {
      'en': 'Tables',
      'de': 'Tabellen',
      'fr': 'Tableaux',
    },
    'qnkp6lwa': {
      'en': 'General',
      'de': 'Allgemein',
      'fr': 'Général',
    },
    'dii70qkf': {
      'en': 'Team',
      'de': 'Team',
      'fr': 'Équipe',
    },
    'qhxun5go': {
      'en': 'My Account',
      'de': 'Mein Konto',
      'fr': 'Mon compte',
    },
    'dljlvqis': {
      'en': 'Help',
      'de': 'Helfen',
      'fr': 'Aide',
    },
    'dzaxg07o': {
      'en': 'Log Out',
      'de': 'Ausloggen',
      'fr': 'Se déconnecter',
    },
    'ola9epdy': {
      'en': 'Account',
      'de': 'Konto',
      'fr': 'Compte',
    },
  },
  // CreateStore1
  {
    '0u4c9s1a': {
      'en': 'Restaurant details',
      'de': 'Restaurantdetails',
      'fr': 'Détails du restaurant',
    },
    '53jrljgi': {
      'en': 'Create your store 1/2',
      'de': 'Erstellen Sie Ihren Shop 1/2',
      'fr': 'Créez votre boutique 1/2',
    },
    'wuiv1p3z': {
      'en': 'Restaurant\'s name',
      'de': 'Name des Restaurants',
      'fr': 'Nom du restaurant',
    },
    'poznsbl0': {
      'en': 'Adress and number',
      'de': 'Adresse und Nummer',
      'fr': 'Adresse et numéro',
    },
    'q140i61q': {
      'en': 'ZIP Code and City',
      'de': 'PLZ und Ort',
      'fr': 'Code postal et ville',
    },
    'r9ufxz5p': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'fr': 'Continuer',
    },
    't94oryla': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // CreateStore2
  {
    'lt0pxa0q': {
      'en': 'Your bank details',
      'de': 'Ihre Bankverbindung',
      'fr': 'Vos coordonnées bancaires',
    },
    'pw3ins32': {
      'en': 'For payments and refunds',
      'de': 'Für Zahlungen und Rückerstattungen',
      'fr': 'Pour les paiements et les remboursements',
    },
    'hp3wfn6x': {
      'en': 'Create your store 2/2',
      'de': 'Erstellen Sie Ihren Shop 2/2',
      'fr': 'Créez votre boutique 2/2',
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
      'de': 'PLZ & Ort',
      'fr': 'Code postal et ville',
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
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'xiyq22qp': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'pjy6l2y0': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    '00wzlhjc': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ilmdq5yh': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'qtk7r4sj': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'wrdmdcgp': {
      'en': 'Continue',
      'de': 'Weitermachen',
      'fr': 'Continuer',
    },
    'fmoqp1no': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // Items
  {
    '04ebnc2l': {
      'en': 'Available',
      'de': 'Verfügbar',
      'fr': 'Disponible',
    },
    '2mbjit0r': {
      'en': 'Add item',
      'de': 'Artikel hinzufügen',
      'fr': 'Ajouter un article',
    },
    'rhk3fu7y': {
      'en': 'Items',
      'de': 'Artikel',
      'fr': 'Articles',
    },
    'ijfpugws': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // UpdateItem
  {
    'ikatvup2': {
      'en': 'Update item',
      'de': 'Artikel aktualisieren',
      'fr': 'Mettre à jour l\'article',
    },
    '5lo7ca7s': {
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
      'de': 'Komma [ , ] ist nicht erlaubt',
      'fr': 'La virgule [ , ] n\'est pas autorisée',
    },
    'spd7s5eh': {
      'en': 'Description',
      'de': 'Beschreibung',
      'fr': 'Description',
    },
    'dwyuvsjj': {
      'en': 'Specifications',
      'de': 'Technische Daten',
      'fr': 'Caractéristiques',
    },
    'wfj2i7y0': {
      'en':
          'Inform service personnel about the item. (e.g. no more mozzarella)',
      'de':
          'Servicepersonal auf den Artikel aufmerksam machen. (z.B. kein Mozzarella mehr)',
      'fr':
          'Informez le personnel de service de l\'article (par exemple, plus de mozzarella).',
    },
    'g57kjv62': {
      'en': 'Tags',
      'de': 'Schlagwörter',
      'fr': 'Mots clés',
    },
    'rslkubds': {
      'en': 'Add tag',
      'de': 'Tag hinzufügen',
      'fr': 'Ajouter une balise',
    },
    '6zebc9yi': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'yrjn2rxk': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'yk6mnfla': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'n650yftl': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '2hiyrijh': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    '5qkz0rdt': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ye55v4yt': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    '572cf2go': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
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
      'en': 'Delete',
      'de': 'Löschen',
      'fr': 'Supprimer',
    },
    'xclzttak': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
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
      'de': 'Komma [ , ] ist nicht erlaubt',
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
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'kjyblf4n': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'j1ju5w4i': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'exgx4i2p': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'xcip5our': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'e2u1tz13': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'wya8y0rl': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'tg6rwdhz': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'q8ulakov': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // UpdateStoreDetails
  {
    '64lbmz9d': {
      'en': 'Restaurant details',
      'de': 'Restaurantdetails',
      'fr': 'Détails du restaurant',
    },
    'rz9byklb': {
      'en': 'Name of your store\n',
      'de': 'Name Ihres Shops',
      'fr': 'Nom de votre magasin',
    },
    'zzsfb5rm': {
      'en': 'Adress and number\n',
      'de': 'Adresse und Nummer',
      'fr': 'Adresse et numéro',
    },
    'awg69tbc': {
      'en': 'ZIP Code and City',
      'de': 'PLZ und Ort',
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
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // UpdateBankDetails
  {
    'ta3ev8e6': {
      'en': 'Update Bank details',
      'de': 'Bankdaten aktualisieren',
      'fr': 'Mettre à jour les coordonnées bancaires',
    },
    '7wo8povx': {
      'en':
          'Your payment details are essential for us to be able to pay your turnover. OrderNow Pay processes payments once a day.',
      'de':
          'Ihre Zahlungsdaten sind für die Auszahlung Ihres Umsatzes zwingend erforderlich. OrderNow Pay verarbeitet Zahlungen einmal täglich.',
      'fr':
          'Vos informations de paiement sont essentielles pour que nous puissions vous payer votre chiffre d\'affaires. OrderNow Pay traite les paiements une fois par jour.',
    },
    'sxvjmpd2': {
      'en': 'Beneficiary Name',
      'de': 'Name des Begünstigten',
      'fr': 'Nom du bénéficiaire',
    },
    '6vtixg4s': {
      'en': 'Beneficiary adress',
      'de': 'Empfängeradresse',
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
    '66j0kymb': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'cyfy1jbo': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'itp8fkvt': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'c9mivuwi': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'ekmybrxm': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'mk2vks1g': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'qn4549wz': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // Tables
  {
    'gzcoy1kf': {
      'en': 'My tables',
      'de': 'Meine Tabellen',
      'fr': 'Mes tableaux',
    },
    'iw285nr2': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // AddTable
  {
    'mtbg1vdd': {
      'en': 'Add table',
      'de': 'Tabelle hinzufügen',
      'fr': 'Ajouter un tableau',
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
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // NewOrder
  {
    '5dc3zra4': {
      'en': 'Menu',
      'de': 'Speisekarte',
      'fr': 'Menu',
    },
    '2y4taya9': {
      'en': 'Search by name',
      'de': 'Suche nach Namen',
      'fr': 'Recherche par nom',
    },
    '7h49xgte': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // ChooseTable
  {
    'sn8jl7c2': {
      'en': 'Scan table',
      'de': 'Scan-Tabelle',
      'fr': 'Table de numérisation',
    },
    '4w77qrpw': {
      'en': 'Scan table QR',
      'de': 'Tisch-QR scannen',
      'fr': 'Tableau de numérisation QR',
    },
    'pxkewsky': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    'uvzpuiym': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // InvitedUser
  {
    'hjma4j6y': {
      'en': 'Join OrderNow',
      'de': 'Werden Sie Mitglied bei OrderNow',
      'fr': 'Rejoignez OrderNow',
    },
    'nzsc7tuq': {
      'en': 'Create your profile as a staff member',
      'de': 'Erstellen Sie Ihr Profil als Mitarbeiter',
      'fr': 'Créez votre profil en tant que membre du personnel',
    },
    'g3vh33va': {
      'en': 'Your name',
      'de': 'Ihr Name',
      'fr': 'Votre nom',
    },
    '8e5ksd9o': {
      'en': 'Email',
      'de': 'E-Mail',
      'fr': 'E-mail',
    },
    'kcz9xr1o': {
      'en': 'Password',
      'de': 'Passwort',
      'fr': 'Mot de passe',
    },
    'udpq7thh': {
      'en': 'Confirm Password',
      'de': 'Passwort bestätigen',
      'fr': 'Confirmez le mot de passe',
    },
    '3a4kmz6x': {
      'en': 'Create Account',
      'de': 'Benutzerkonto erstellen',
      'fr': 'Créer un compte',
    },
    'eybid8wl': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // Team
  {
    'q0qfok18': {
      'en': 'Invited',
      'de': 'Eingeladen',
      'fr': 'Invité',
    },
    'fpnxkrf0': {
      'en': 'Organization',
      'de': 'Organisation',
      'fr': 'Organisation',
    },
    'nbvzc35o': {
      'en': '',
      'de': '',
      'fr': '',
    },
    'vh6swj8j': {
      'en': 'Invite',
      'de': 'Einladen',
      'fr': 'Inviter',
    },
    'glp5w3qj': {
      'en': 'Team',
      'de': 'Team',
      'fr': 'Équipe',
    },
    'dv2t5pej': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
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
          'Laden Sie Ihr Team ein, OrderNow beizutreten. Sie können Bestellungen entgegennehmen, auf Artikel zugreifen und Tische hinzufügen.',
      'fr':
          'Invitez votre équipe à rejoindre OrderNow. Ils pourront prendre des commandes, accéder aux articles et ajouter des tables.',
    },
    '1d2bbl6g': {
      'en': 'Email adress',
      'de': 'E-Mail-Adresse',
      'fr': 'Adresse e-mail',
    },
    'jkvbo883': {
      'en': 'Enter email',
      'de': 'E-Mail eingeben',
      'fr': 'Entrez l\'email',
    },
    '29mwf12h': {
      'en': 'Waiter / Waitress',
      'de': 'Kellner / Kellnerin',
      'fr': 'Serveur / Serveuse',
    },
    'vkogtbwa': {
      'en': '',
      'de': '',
      'fr': '',
    },
    'kvxcaa3g': {
      'en': 'Search for an item...',
      'de': 'Nach einem Artikel suchen...',
      'fr': 'Rechercher un article...',
    },
    'zvvdxi2k': {
      'en': 'Role',
      'de': 'Rolle',
      'fr': 'Rôle',
    },
    'nt9r1kn9': {
      'en': 'Waiter / Waitress',
      'de': 'Kellner / Kellnerin',
      'fr': 'Serveur / Serveuse',
    },
    '78hbxhz6': {
      'en': 'Cook',
      'de': 'Kochen',
      'fr': 'Cuisiner',
    },
    'x0qvluwe': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
      'fr': 'Le champ est obligatoire',
    },
    'vbbzmiy6': {
      'en': 'Email adress badly formatted',
      'de': 'E-Mail-Adresse falsch formatiert',
      'fr': 'Adresse e-mail mal formatée',
    },
    'c98xx43a': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
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
      'fr': 'Dos',
    },
    '6bfqj9xn': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // InvitationPageCopyLink
  {
    '86xy1gzi': {
      'en': 'Join OrderNow',
      'de': 'Werden Sie Mitglied bei OrderNow',
      'fr': 'Rejoignez OrderNow',
    },
    'zgr3f1wq': {
      'en': 'Paste the code you received by email',
      'de': 'Fügen Sie den Code ein, den Sie per E-Mail erhalten haben',
      'fr': 'Collez le code que vous avez reçu par email',
    },
    'lkjvk16k': {
      'en': 'Your code goes here',
      'de': 'Ihr Code kommt hier rein',
      'fr': 'Votre code va ici',
    },
    'pot0n8aq': {
      'en': 'Continue with registration',
      'de': 'Weiter mit der Registrierung',
      'fr': 'Continuer l\'inscription',
    },
    'whpy8b1a': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
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
      'de': 'Zusätzliche Kommentare',
      'fr': 'Commentaires supplémentaires',
    },
    '0z7htsjg': {
      'en': 'e.g. without mushrooms',
      'de': 'z.B. ohne Pilze',
      'fr': 'par exemple sans champignons',
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
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // Checkout
  {
    '5ercb35x': {
      'en': 'Subtotal',
      'de': 'Zwischensumme',
      'fr': 'Sous-total',
    },
    'jr1t9dhk': {
      'en': 'Extra charges',
      'de': 'Zusätzliche Kosten',
      'fr': 'Frais supplémentaires',
    },
    'lliu3wtb': {
      'en': 'Discount',
      'de': 'Rabatt',
      'fr': 'Rabais',
    },
    'rhz0gmgt': {
      'en': 'Tip',
      'de': 'Trinkgeld',
      'fr': 'Pourboire',
    },
    'afcy56k9': {
      'en': 'Total',
      'de': 'Gesamt',
      'fr': 'Total',
    },
    '5whot6tx': {
      'en': 'Card/Cash payment',
      'de': 'Karten-/Barzahlung',
      'fr': 'Paiement carte / cash',
    },
    '4fevjzcq': {
      'en': 'Tip',
      'de': 'Trinkgeld',
      'fr': 'Pourboire',
    },
    'hhnblemg': {
      'en': 'Extra charges',
      'de': 'Zusätzliche Kosten',
      'fr': 'Frais supplémentaires',
    },
    'ldhts9xe': {
      'en': 'Discount',
      'de': 'Rabatt',
      'fr': 'Rabais',
    },
    'vnriltvf': {
      'en': 'Pay',
      'de': 'Zahlen',
      'fr': 'Payer',
    },
    's0skw56o': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // BusinessListOrderHistory
  {
    'cljinu9z': {
      'en': 'Order #',
      'de': 'Befehl #',
      'fr': 'Commande #',
    },
    'hyc0xq34': {
      'en': 'Orders history',
      'de': 'Bestellverlauf',
      'fr': 'Historique des commandes',
    },
    'ua2h2pt2': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // UserOrderHistory
  {
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
    'qn5hp69l': {
      'en': 'Orders history',
      'de': 'Bestellverlauf',
      'fr': 'Historique des commandes',
    },
    'cxubtz9n': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // PaymentList
  {
    'rcp5ms8t': {
      'en': 'Logout',
      'de': 'Ausloggen',
      'fr': 'Déconnexion',
    },
    'sh0bxdln': {
      'en': 'Restaurants payments',
      'de': 'Zahlungen im Restaurant',
      'fr': 'Paiements des restaurants',
    },
    'fjn6umqv': {
      'en': 'Staff payments',
      'de': 'Personalzahlungen',
      'fr': 'Paiements du personnel',
    },
    'c7fowh9k': {
      'en': 'Tables to print',
      'de': 'Tabellen zum Ausdrucken',
      'fr': 'Tableaux à imprimer',
    },
    '7j11cdyy': {
      'en': 'To be paid',
      'de': 'Zu bezahlen',
      'fr': 'À payer',
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
    'sxgdfz1q': {
      'en': 'Order',
      'de': 'Befehl',
      'fr': 'Commande',
    },
    '1k9lq4d5': {
      'en': 'Payment Details',
      'de': 'Zahlungsdetails',
      'fr': 'Détails de paiement',
    },
    'zvkkhc8m': {
      'en': 'Transaction ID : ',
      'de': 'Transaktions-ID:',
      'fr': 'ID de transaction :',
    },
    'tm4dtury': {
      'en': 'Date : ',
      'de': 'Datum :',
      'fr': 'Date :',
    },
    'bc11qf5e': {
      'en': 'Amount : ',
      'de': 'Menge :',
      'fr': 'Montant :',
    },
    '02367vwd': {
      'en': 'Status :',
      'de': 'Status:',
      'fr': 'Statut :',
    },
    '3v06lvwz': {
      'en': 'Completed',
      'de': 'Vollendet',
      'fr': 'Complété',
    },
    'gxt0rgmh': {
      'en': 'Payment Method : ',
      'de': 'Zahlungsmethode:',
      'fr': 'Mode de paiement :',
    },
    'efh3svrr': {
      'en': 'Table : ',
      'de': 'Tisch :',
      'fr': 'Tableau :',
    },
    '515qjm9i': {
      'en': 'Transaction Breakdown (VAT Incl.)',
      'de': 'Transaktionsaufschlüsselung (inkl. MwSt.)',
      'fr': 'Répartition des transactions (TVA incluse)',
    },
    'ucv811j4': {
      'en': 'Subtotal',
      'de': 'Zwischensumme',
      'fr': 'Total',
    },
    'u08ywe7r': {
      'en': 'Extra charges',
      'de': 'Zusätzliche Kosten',
      'fr': 'Frais supplémentaires',
    },
    '71p6putr': {
      'en': 'Tip',
      'de': 'Tipp',
      'fr': 'Conseil',
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
      'en': 'Service',
      'de': 'Service',
      'fr': 'Service',
    },
    'horkn0sl': {
      'en': 'Handled by',
      'de': 'Betreut von',
      'fr': 'Géré par',
    },
    '694orle0': {
      'en': 'Store details',
      'de': 'Details speichern',
      'fr': 'Détails du magasin',
    },
    'lu5xzqu4': {
      'en': 'Address',
      'de': 'Adresse',
      'fr': 'Adresse',
    },
    '8qzzjlc6': {
      'en': 'Report Now',
      'de': 'Jetzt melden',
      'fr': 'Signaler maintenant',
    },
    'ai9czea7': {
      'en': 'Order Details',
      'de': 'Bestelldetails',
      'fr': 'Détails de la commande',
    },
  },
  // SuccessPage
  {
    'rjmgqn56': {
      'en': 'Payment successful',
      'de': 'Zahlung erfolgreich',
      'fr': 'Paiement réussi',
    },
    'iwp2knyv': {
      'en': 'Thank you !',
      'de': 'Danke !',
      'fr': 'Merci !',
    },
    '6bc51u0j': {
      'en': 'OK',
      'de': 'OK',
      'fr': 'D\'ACCORD',
    },
    'lx7esnsc': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // RestaurantPaymentDetails
  {
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
    '4xk4z7eg': {
      'en': 'Total brut',
      'de': 'Total brut',
      'fr': 'Total brut',
    },
    'dgcyuk5e': {
      'en': 'Bénéficiaire',
      'de': 'Begünstigter',
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
      'de': 'Nettobetrag pro Monat (CHF)',
      'fr': 'Montant net à verser (CHF)',
    },
    '2p5cwxay': {
      'en': 'Payer',
      'de': 'Zahler',
      'fr': 'Payeur',
    },
    'vyk9veyp': {
      'en': 'Payment details',
      'de': 'Zahlungsdetails',
      'fr': 'Détails de paiement',
    },
    '31is1nh6': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // page
  {
    '5zhv3dnd': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // PaymentStaffList
  {
    'jkzbk0eh': {
      'en': 'Logout',
      'de': 'Ausloggen',
      'fr': 'Déconnexion',
    },
    'm6ypk789': {
      'en': 'Staff Payments',
      'de': 'Personalzahlungen',
      'fr': 'Paiements du personnel',
    },
    '4myex7iv': {
      'en': 'Restaurant payments',
      'de': 'Restaurantzahlungen',
      'fr': 'Paiements au restaurant',
    },
    'jpy1y2gn': {
      'en': 'A payer',
      'de': 'Ein Zahler',
      'fr': 'Un payeur',
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
      'de': 'Zahlungsdetails',
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
      'en': 'Montant brut',
      'de': 'Montant brut',
      'fr': 'Montant brut',
    },
    'molwitz4': {
      'en': 'Bénéficiaire',
      'de': 'Begünstigter',
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
      'de': 'Nettobetrag pro Monat (CHF)',
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
  // forgot
  {
    'ce7b7v0p': {
      'en': 'Back',
      'de': 'Zurück',
      'fr': 'Dos',
    },
    'xjx9vauj': {
      'en': 'Forgot Password',
      'de': 'Passwort vergessen',
      'fr': 'Mot de passe oublié',
    },
    'lgcg19gh': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'de':
          'Wir senden Ihnen eine E-Mail mit einem Link zum Zurücksetzen Ihres Passworts. Geben Sie unten bitte die mit Ihrem Konto verknüpfte E-Mail-Adresse ein.',
      'fr':
          'Nous vous enverrons un e-mail avec un lien pour réinitialiser votre mot de passe, veuillez saisir l\'e-mail associé à votre compte ci-dessous.',
    },
    'ryvrmgej': {
      'en': 'Your email address...',
      'de': 'Ihre E-Mail-Adresse...',
      'fr': 'Votre adresse e-mail...',
    },
    '39r9cjym': {
      'en': 'Enter your email...',
      'de': 'Geben Sie Ihre E-Mail-Adresse ein.',
      'fr': 'Entrez votre email...',
    },
    '1loy2qbs': {
      'en': '',
      'de': '',
      'fr': '',
    },
    '5vgpg3lm': {
      'en': 'Send Link',
      'de': 'Link senden',
      'fr': 'Envoyer le lien',
    },
    'mfurw4fq': {
      'en': 'Back',
      'de': 'Zurück',
      'fr': 'Dos',
    },
    'jbbc45pf': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // Revenues
  {
    'kh4cta5i': {
      'en': 'Sales',
      'de': 'Verkäufe',
      'fr': 'Ventes',
    },
    'dg57rpva': {
      'en': 'Gross sales (including tips)',
      'de': 'Bruttoumsatz (inkl. Trinkgeld)',
      'fr': 'Ventes brutes (pourboires inclus)',
    },
    '34vgqf4s': {
      'en': 'Transactions',
      'de': 'Transaktionen',
      'fr': 'Transactions',
    },
    'mj9wxij6': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // ChooseStore
  {
    'xgquclin': {
      'en':
          'Some features only work on the app. Download the app from your store.',
      'de':
          'Einige Funktionen funktionieren nur in der App. Laden Sie die App aus Ihrem Store herunter.',
      'fr':
          'Certaines fonctionnalités ne fonctionnent que sur l\'application. Téléchargez l\'application depuis votre boutique.',
    },
    'z5dwy6bf': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // CreateAccount
  {
    '1xfwcutt': {
      'en': 'Create account | Pay my bill',
      'de': 'Konto erstellen | Meine Rechnung bezahlen',
      'fr': 'Créer un compte | Payer ma facture',
    },
    'd6zv1npd': {
      'en': 'Create business account',
      'de': 'Geschäftskonto erstellen',
      'fr': 'Créer un compte professionnel',
    },
    's8lmj6hv': {
      'en': 'Create business account',
      'de': 'Geschäftskonto erstellen',
      'fr': 'Créer un compte professionnel',
    },
    'pw63xvfx': {
      'en': 'Create account | Pay my bill',
      'de': 'Konto erstellen | Meine Rechnung bezahlen',
      'fr': 'Créer un compte | Payer ma facture',
    },
    'uxzj8nsa': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // createdPage
  {
    'f8oqs9og': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // Tags
  {
    'b9d4nq5c': {
      'en': 'All tags',
      'de': 'Alle Tags',
      'fr': 'Toutes les balises',
    },
    'dgl886p5': {
      'en': 'Create new tag',
      'de': 'Neues Tag erstellen',
      'fr': 'Créer une nouvelle balise',
    },
    '1pby5sf3': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // Subscription
  {
    'm4fwqgar': {
      'en': 'OrderNow Pay',
      'de': 'Jetzt bestellen Bezahlen',
      'fr': 'Commander maintenant Payer',
    },
    '0dgf8nom': {
      'en': 'Cart',
      'de': 'Warenkorb',
      'fr': 'Panier',
    },
    'upp2gm1g': {
      'en': 'Yearly subscription',
      'de': 'Jahresabonnement',
      'fr': 'Abonnement annuel',
    },
    'quib7rai': {
      'en': 'Yearly subscription',
      'de': 'Jahresabonnement',
      'fr': 'Abonnement annuel',
    },
    'jvh6l7qg': {
      'en': 'OrderNow Pay',
      'de': 'Jetzt bestellen Bezahlen',
      'fr': 'Commander maintenant Payer',
    },
    '6w0nnckm': {
      'en': 'for business',
      'de': 'für Unternehmen',
      'fr': 'pour les entreprises',
    },
    'gxrpe7w2': {
      'en': 'CHF 99.- / year',
      'de': 'CHF 99.- / Jahr',
      'fr': 'CHF 99.- / an',
    },
    'c1hbcoy7': {
      'en': '12 months subscription',
      'de': '12 Monate Abonnement',
      'fr': 'Abonnement de 12 mois',
    },
    'zirqcc8b': {
      'en': 'Step 1 / 3',
      'de': 'Schritt 1 / 3',
      'fr': 'Étape 1 / 3',
    },
    '41ejch7q': {
      'en': 'OrderNow Pay Business',
      'de': 'OrderNow Pay Business',
      'fr': 'Commander maintenant Payer Entreprise',
    },
    'kcl0h6go': {
      'en': 'Create account',
      'de': 'Benutzerkonto erstellen',
      'fr': 'Créer un compte',
    },
    'vj7wxm2u': {
      'en': 'Name',
      'de': 'Name',
      'fr': 'Nom',
    },
    'oiph36cj': {
      'en': 'Label here...',
      'de': 'Etikett hier...',
      'fr': 'Étiquette ici...',
    },
    'sq3hv3t4': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // crm
  {
    'csrcqwvh': {
      'en': 'CRM',
      'de': 'CRM',
      'fr': 'CRM',
    },
    'k2y31xn9': {
      'en': 'Unauthorized access',
      'de': 'Unbefugter Zugriff',
      'fr': 'Accès non autorisé',
    },
    '31h1a1m5': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // CRMDetail
  {
    'wiel18s9': {
      'en': ' || ',
      'de': '||',
      'fr': '||',
    },
    'qf6alto0': {
      'en': 'Client ID',
      'de': 'Kunden-ID',
      'fr': 'ID client',
    },
    'kd7zttyr': {
      'en': 'Send package to customer',
      'de': 'Paket an Kunden senden',
      'fr': 'Envoyer le colis au client',
    },
    'ztuc09bq': {
      'en': 'Package already sent',
      'de': 'Paket bereits versendet',
      'fr': 'Colis déjà envoyé',
    },
    'z7n4xmv7': {
      'en': 'Manager',
      'de': 'Manager',
      'fr': 'Directeur',
    },
    'qab6tqm4': {
      'en': 'Description',
      'de': 'Beschreibung',
      'fr': 'Description',
    },
    '0q1s42ss': {
      'en': 'Tables',
      'de': 'Tabellen',
      'fr': 'Tableaux',
    },
    '2pug8d3f': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // DatatransPaymentPage
  {
    'yec9c8r5': {
      'en': '20',
      'de': '20',
      'fr': '20',
    },
    'y2j8cbv0': {
      'en': 'Pay',
      'de': 'Zahlen',
      'fr': 'Payer',
    },
    'rz3oof90': {
      'en': 'Page Title',
      'de': '',
      'fr': '',
    },
    'g33tkitr': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // ResumeSubscription
  {
    '7p3plifs': {
      'en': 'Subscription summary',
      'de': 'Abonnementübersicht',
      'fr': 'Résumé de l\'abonnement',
    },
    '90lu7nug': {
      'en': 'Personal information',
      'de': 'Persönliche Informationen',
      'fr': 'Informations personnelles',
    },
    '6hqqwdf8': {
      'en': 'Name, Email, Phone number...',
      'de': 'Name, E-Mail, Telefonnummer ...',
      'fr': 'Nom, Email, Numéro de téléphone...',
    },
    'yxq9quw6': {
      'en': 'Name',
      'de': 'Name',
      'fr': 'Nom',
    },
    'ouhxxs21': {
      'en': 'Email',
      'de': 'E-Mail',
      'fr': 'E-mail',
    },
    'mllawp1f': {
      'en': 'Phone number',
      'de': 'Telefonnummer',
      'fr': 'Numéro de téléphone',
    },
    'nv66735o': {
      'en': 'Restaurant details',
      'de': 'Restaurantdetails',
      'fr': 'Détails du restaurant',
    },
    '1rz04b3k': {
      'en': 'Name, Email, Phone number...',
      'de': 'Name, E-Mail, Telefonnummer ...',
      'fr': 'Nom, Email, Numéro de téléphone...',
    },
    'ifjon5t2': {
      'en': 'Restaurant\'s name',
      'de': 'Name des Restaurants',
      'fr': 'Nom du restaurant',
    },
    'b2vya1z7': {
      'en': 'Adress and number',
      'de': 'Adresse und Nummer',
      'fr': 'Adresse et numéro',
    },
    '869mkuuc': {
      'en': 'ZIP Code and city',
      'de': 'PLZ und Ort',
      'fr': 'Code postal et ville',
    },
    '16d4bl6z': {
      'en': 'Bank details',
      'de': 'Bankverbindung',
      'fr': 'Coordonnées bancaires',
    },
    '7c27qj2h': {
      'en': 'Name, Email, Phone number...',
      'de': 'Name, E-Mail, Telefonnummer ...',
      'fr': 'Nom, Email, Numéro de téléphone...',
    },
    '2gsi4hm4': {
      'en': 'Beneficiary name',
      'de': 'Name des Begünstigten',
      'fr': 'Nom du bénéficiaire',
    },
    'ws491q1p': {
      'en': 'Beneficiary adress',
      'de': 'Empfängeradresse',
      'fr': 'Adresse du bénéficiaire',
    },
    'cbitqgr9': {
      'en': 'IBAN',
      'de': 'IBAN',
      'fr': 'IBAN',
    },
    'k6ehr2xq': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // SignUpUser
  {
    '8xg5cjvb': {
      'en': 'Create an account',
      'de': 'Ein Konto erstellen',
      'fr': 'Créer un compte',
    },
    '91tfdcqv': {
      'en': 'It\'s simple. It\'s free.',
      'de': 'Es ist ganz einfach. Es ist kostenlos.',
      'fr': 'C\'est simple, c\'est gratuit.',
    },
    '1s9sf9eh': {
      'en': 'Name',
      'de': 'Name',
      'fr': 'Nom',
    },
    '1fs5tmvv': {
      'en': 'John Doe',
      'de': 'John Doe',
      'fr': 'John Doe',
    },
    '9tv057ql': {
      'en': 'Telephone number',
      'de': 'Telefonnummer',
      'fr': 'Numéro de téléphone',
    },
    'eqquvt64': {
      'en': '+41',
      'de': '',
      'fr': '',
    },
    '2f4w24e7': {
      'en': 'Email',
      'de': 'E-Mail',
      'fr': 'E-mail',
    },
    'vjoq6o7p': {
      'en': 'Password',
      'de': 'Passwort',
      'fr': 'Mot de passe',
    },
    't3196e2x': {
      'en': 'Confirm Password',
      'de': 'Passwort bestätigen',
      'fr': 'Confirmez le mot de passe',
    },
    'jlhxzpwe': {
      'en': 'Create account',
      'de': 'Benutzerkonto erstellen',
      'fr': 'Créer un compte',
    },
    'v4pzdeya': {
      'en': 'OR',
      'de': 'ODER',
      'fr': 'OU',
    },
    'e6tj3xyl': {
      'en': 'Already have an account? ',
      'de': 'Hast du schon ein Konto?',
      'fr': 'Vous avez déjà un compte ?',
    },
    'pt06dcdw': {
      'en': ' Sign In here',
      'de': 'Hier anmelden',
      'fr': 'Connectez-vous ici',
    },
    'jv0rn4kh': {
      'en': 'Home',
      'de': 'Heim',
      'fr': 'Maison',
    },
  },
  // OrderListEmpty
  {
    '5out5q08': {
      'en': 'Seems you don’t have \nany orders',
      'de': 'Sieht so aus, als hätten Sie keine\nBestellungen',
      'fr': 'Il semble que vous n\'ayez\npas de commandes',
    },
    'bzbv6h5c': {
      'en': 'To create a new order, start by scanning your customer\'s table',
      'de':
          'Um eine neue Bestellung zu erstellen, scannen Sie zunächst den Tisch Ihres Kunden',
      'fr':
          'Pour créer une nouvelle commande, commencez par scanner la table de votre client',
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
  // tipSheet
  {
    'a2402x3l': {
      'en': 'Tip',
      'de': 'Tipp',
      'fr': 'Conseil',
    },
    'lvw6iwcu': {
      'en': 'You have been served by:',
      'de': 'Sie wurden bedient von:',
      'fr': 'Vous avez été servi par :',
    },
    'irmmt4qo': {
      'en': '10%',
      'de': '10 %',
      'fr': '10%',
    },
    'lsw6l5f1': {
      'en': '15%',
      'de': '15 %',
      'fr': '15%',
    },
    'kda6uge1': {
      'en': '20%',
      'de': '20 %',
      'fr': '20%',
    },
    'mqb3zuyg': {
      'en': 'CHF 0.00 (Comma [ , ] not allowed)',
      'de': 'CHF 0.00 (Komma [ , ] nicht erlaubt)',
      'fr': 'CHF 0.00 (Virgule [ , ] non autorisée)',
    },
    'h9xjt5sp': {
      'en': 'Add',
      'de': 'Hinzufügen',
      'fr': 'Ajouter',
    },
    'qnih1ex7': {
      'en': 'Remove',
      'de': 'Entfernen',
      'fr': 'Retirer',
    },
  },
  // Card40PropertyDetails
  {
    'u9t3v838': {
      'en': '56292 West Hollywood Blvd.',
      'de': '56292 West Hollywood Blvd.',
      'fr': '56292, boulevard West Hollywood',
    },
    'jofu6m8f': {
      'en': 'San Fransico, CA. 98210',
      'de': 'San Francisco, Kalifornien 98210',
      'fr': 'San Francisco, Californie 98210',
    },
    '9vx8olvh': {
      'en': 'Available',
      'de': 'Verfügbar',
      'fr': 'Disponible',
    },
    'suq009i0': {
      'en': '621 Views',
      'de': '621 Mal Gesehen',
      'fr': '621 vues',
    },
  },
  // discountSheet
  {
    'lf1h386e': {
      'en': 'Discount',
      'de': 'Rabatt',
      'fr': 'Rabais',
    },
    'kujtvg4i': {
      'en': 'CHF 0.00 (Comma [ , ] not allowed)',
      'de': 'CHF 0.00 (Komma [ , ] nicht erlaubt)',
      'fr': 'CHF 0.00 (Virgule [ , ] non autorisée)',
    },
    '6tzsvpdk': {
      'en': 'Add',
      'de': 'Hinzufügen',
      'fr': 'Ajouter',
    },
    'yab5c8n3': {
      'en': 'Remove',
      'de': 'Entfernen',
      'fr': 'Retirer',
    },
  },
  // extraChargeSheet
  {
    'p8x3x08a': {
      'en': 'Extra charges',
      'de': 'Zusätzliche Kosten',
      'fr': 'Frais supplémentaires',
    },
    't8bzrwwa': {
      'en': 'CHF 0.00 (Comma [ , ] not allowed)',
      'de': 'CHF 0.00 (Komma [ , ] nicht erlaubt)',
      'fr': 'CHF 0.00 (Virgule [ , ] non autorisée)',
    },
    'v7vix5h2': {
      'en': 'Add',
      'de': 'Hinzufügen',
      'fr': 'Ajouter',
    },
    'ynx8vxw2': {
      'en': 'Remove',
      'de': 'Entfernen',
      'fr': 'Retirer',
    },
  },
  // BuyStickers
  {
    'd1q84e2b': {
      'en': 'Vinyl Stickers',
      'de': 'Vinyl-Aufkleber',
      'fr': 'Autocollants en vinyle',
    },
    'turznbm2': {
      'en': 'CHF 29.00',
      'de': 'CHF 29.00',
      'fr': 'CHF 29.00',
    },
    '7bue1wgo': {
      'en': 'Printed and sent to your Adress',
      'de': 'Gedruckt und an Ihre Adresse gesendet',
      'fr': 'Imprimé et envoyé à votre adresse',
    },
    'lffkmh0g': {
      'en': 'Name',
      'de': 'Name',
      'fr': 'Nom',
    },
    'o2hw8mmu': {
      'en': 'Name',
      'de': 'Name',
      'fr': 'Nom',
    },
    '8oo4mc38': {
      'en': 'Adress and number',
      'de': 'Adresse und Nummer',
      'fr': 'Adresse et numéro',
    },
    'lvyelkwg': {
      'en': 'Adress',
      'de': 'Adresse',
      'fr': 'Adresse',
    },
    'b16rix8w': {
      'en': 'Zip code and City',
      'de': 'PLZ und Ort',
      'fr': 'Code postal et ville',
    },
    'madthgdd': {
      'en': 'City',
      'de': 'Stadt',
      'fr': 'Ville',
    },
    '62225jpp': {
      'en': 'Order & Pay',
      'de': 'Bestellen & Bezahlen',
      'fr': 'Commander et payer',
    },
  },
  // Language
  {
    'qe6un6bj': {
      'en': 'Select language',
      'de': 'Sprache auswählen',
      'fr': 'Sélectionner la langue',
    },
    '7j69lbou': {
      'en': 'English',
      'de': 'Englisch',
      'fr': 'Anglais',
    },
    '5yu9m6hr': {
      'en': 'Français',
      'de': 'Deutsch',
      'fr': 'Français',
    },
    'qkdi8tkd': {
      'en': 'Deutsch',
      'de': 'Deutsch',
      'fr': 'Allemand',
    },
  },
  // DeleteAccount
  {
    '4t8vj42z': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    'ddhwagqr': {
      'en': 'Delete account',
      'de': 'Konto löschen',
      'fr': 'Supprimer le compte',
    },
  },
  // CreatedAccount
  {
    'yccbrims': {
      'en': 'Your account account has been created successfuly',
      'de': 'Ihr Konto wurde erfolgreich erstellt',
      'fr': 'Votre compte a été créé avec succès',
    },
    'qhp9awup': {
      'en': 'Start',
      'de': 'Start',
      'fr': 'Commencer',
    },
  },
  // EmptyItems
  {
    '8dcj51dm': {
      'en':
          'Your menu is empty. To take your first order, you need to add an item.',
      'de':
          'Ihr Menü ist leer. Um Ihre erste Bestellung aufzugeben, müssen Sie einen Artikel hinzufügen.',
      'fr':
          'Votre menu est vide. Pour prendre votre première commande, vous devez ajouter un article.',
    },
  },
  // EmptyTables
  {
    'gp3oiuqi': {
      'en':
          'There are no tables at the moment. To take your first order, you need to add a table.',
      'de':
          'Momentan sind keine Tische verfügbar. Um Ihre erste Bestellung entgegenzunehmen, müssen Sie einen Tisch hinzufügen.',
      'fr':
          'Il n\'y a pas de table pour le moment. Pour prendre votre première commande, vous devez ajouter une table.',
    },
  },
  // StayZenDay
  {
    '9elvskux': {
      'en': 'Stay zen',
      'de': 'Bleib Zen',
      'fr': 'Restez zen',
    },
    '1jpe7cgn': {
      'en': ' and start by scanning your table QR Code',
      'de': 'und scannen Sie zunächst den QR-Code Ihres Tisches',
      'fr': 'et commencez par scanner le QR Code de votre table',
    },
  },
  // StayZenNight
  {
    'wecrpjum': {
      'en': 'Stay zen',
      'de': 'Bleib Zen',
      'fr': 'Restez zen',
    },
    'c4kb0ivx': {
      'en': ' and start by scanning your table QR Code',
      'de': 'und scannen Sie zunächst den QR-Code Ihres Tisches',
      'fr': 'et commencez par scanner le QR Code de votre table',
    },
  },
  // TipsComponent
  {
    'zyk27l3c': {
      'en': 'Add tables',
      'de': 'Tabellen hinzufügen',
      'fr': 'Ajouter des tableaux',
    },
    'nzyb75t8': {
      'en': 'To take your first order',
      'de': 'So nehmen Sie Ihre erste Bestellung auf',
      'fr': 'Pour prendre votre première commande',
    },
    'luda3vho': {
      'en':
          ', you need to create tables. We recommend that you name the tables in ascending order (1, 2, 3, etc.).  Each newly created table will be assigned a unique QR code. Once you\'ve created all your tables, request a printout. Stickers will be sent to you by post.',
      'de':
          'müssen Sie Tische anlegen. Wir empfehlen Ihnen, die Tische in aufsteigender Reihenfolge zu benennen (1, 2, 3, usw.). Jeder neu angelegte Tisch erhält einen individuellen QR-Code. Wenn Sie alle Tische angelegt haben, fordern Sie einen Ausdruck an. Aufkleber werden Ihnen per Post zugeschickt.',
      'fr':
          ', vous devez créer des tableaux. Nous vous recommandons de nommer les tableaux par ordre croissant (1, 2, 3, etc.). Chaque tableau nouvellement créé se verra attribuer un code QR unique. Une fois tous vos tableaux créés, demandez une impression. Des autocollants vous seront envoyés par courrier.',
    },
  },
  // UserEmptyListOrder
  {
    '9x2aibgr': {
      'en':
          'Currently, there are no transactions to report. To pay your bill, simply click on the \'Pay\' button.',
      'de':
          'Aktuell sind keine Transaktionen zu melden. Um deine Rechnung zu bezahlen, klicke einfach auf den Button „Bezahlen“.',
      'fr':
          'Il n\'y a actuellement aucune transaction à signaler. Pour régler votre facture, cliquez simplement sur le bouton « Payer ».',
    },
  },
  // AdminOrStaffEmptyListOrderCopy
  {
    'niprfznv': {
      'en':
          'Currently, there are no transactions to report. To place an order, simply click on the \'New order\' button.',
      'de':
          'Derzeit sind keine Transaktionen zu melden. Um eine Bestellung aufzugeben, klicken Sie einfach auf die Schaltfläche „Neue Bestellung“.',
      'fr':
          'Actuellement, il n\'y a aucune transaction à signaler. Pour passer une commande, cliquez simplement sur le bouton « Nouvelle commande ».',
    },
  },
  // TablesEmptyListOrder
  {
    'ljokk0oc': {
      'en': 'To place an order, you must first create a table.',
      'de':
          'Um eine Bestellung aufzugeben, müssen Sie zuerst einen Tisch erstellen.',
      'fr': 'Pour passer une commande, vous devez d\'abord créer une table.',
    },
  },
  // ItemsEmptyListOrder
  {
    'h97ubsja': {
      'en': 'To place an order, you must first add an item.',
      'de':
          'Um eine Bestellung aufzugeben, müssen Sie zuerst einen Artikel hinzufügen.',
      'fr': 'Pour passer une commande, vous devez d\'abord ajouter un article.',
    },
  },
  // AddYourFirstItem
  {
    '4yg1cjkm': {
      'en': 'Add item',
      'de': 'Artikel hinzufügen',
      'fr': 'Ajouter un article',
    },
    'kzxqytbn': {
      'en':
          'To take an order, you need to have at least one item on your menu. Please add an item now.',
      'de':
          'Um eine Bestellung aufzunehmen, muss Ihr Menü mindestens einen Artikel enthalten. Bitte fügen Sie jetzt einen Artikel hinzu.',
      'fr':
          'Pour prendre une commande, vous devez avoir au moins un article sur votre menu. Veuillez ajouter un article maintenant.',
    },
  },
  // AddYourFirstTable
  {
    'hs7zmkvm': {
      'en': 'Add table',
      'de': 'Tabelle hinzufügen',
      'fr': 'Ajouter un tableau',
    },
    'ru012n53': {
      'en':
          'To take an order, you need to have at least one table. Please add a table now.',
      'de':
          'Um eine Bestellung aufzunehmen, benötigen Sie mindestens einen Tisch. Bitte fügen Sie jetzt einen Tisch hinzu.',
      'fr':
          'Pour prendre une commande, vous devez avoir au moins une table. Veuillez ajouter une table maintenant.',
    },
  },
  // AddBankDetails
  {
    'bvm34p0t': {
      'en': 'Add your banking details',
      'de': 'Fügen Sie Ihre Bankdaten hinzu',
      'fr': 'Ajoutez vos coordonnées bancaires',
    },
    '95bhhzc6': {
      'en':
          'OrderNow Pay needs your IBAN to pay your tips. Fill in your bank details now.',
      'de':
          'OrderNow Pay benötigt Ihre IBAN, um Ihr Trinkgeld auszuzahlen. Geben Sie jetzt Ihre Bankdaten ein.',
      'fr':
          'OrderNow Pay a besoin de votre IBAN pour payer vos pourboires. Remplissez vos coordonnées bancaires maintenant.',
    },
  },
  // QRCodeIsNotValid
  {
    'dm59wot9': {
      'en': 'Oups! \nQR code not valid',
      'de': 'Ups! \nQR-Code ungültig',
      'fr': 'Oups ! \nCode QR non valide',
    },
    'dlgyrh5a': {
      'en':
          'The scanned QR code does not match any OrderNow Pay table or board. Please scan the official OrderNow Pay QR code. ',
      'de':
          'Der gescannte QR-Code passt zu keinem OrderNow Pay-Tisch oder -Brett. Bitte scannen Sie den offiziellen OrderNow Pay-QR-Code.',
      'fr':
          'Le code QR scanné ne correspond à aucune table ou plateau OrderNow Pay. Veuillez scanner le code QR officiel OrderNow Pay.',
    },
    '2qne15rb': {
      'en': 'Close',
      'de': 'Schließen',
      'fr': 'Fermer',
    },
  },
  // NoOrderForThisTable
  {
    'l9xb6l5u': {
      'en': 'Oups! \nNo active order',
      'de': 'Ups! \nKeine aktive Bestellung',
      'fr': 'Oups ! \nAucune commande active',
    },
    'm71dgg5q': {
      'en':
          'There are currently no active orders for this table. Please contact our service staff to activate your order.',
      'de':
          'Für diesen Tisch liegen derzeit keine aktiven Bestellungen vor. Bitte kontaktieren Sie unser Servicepersonal, um Ihre Bestellung zu aktivieren.',
      'fr':
          'Il n\'y a actuellement aucune commande active pour cette table. Veuillez contacter notre personnel de service pour activer votre commande.',
    },
    'k5hb625x': {
      'en': 'Close',
      'de': 'Schließen',
      'fr': 'Fermer',
    },
  },
  // BusinessTableAlreadyInUse
  {
    'i6ps6flz': {
      'en': 'Oups! \nTable already in use',
      'de': 'Ups! \nTabelle bereits in Verwendung',
      'fr': 'Oups ! \nTable déjà utilisée',
    },
    '080dzrgx': {
      'en':
          'The table you scanned is already in use. Check your active orders.',
      'de':
          'Der von Ihnen gescannte Tisch wird bereits verwendet. Überprüfen Sie Ihre aktiven Bestellungen.',
      'fr':
          'La table que vous avez scannée est déjà utilisée. Vérifiez vos commandes actives.',
    },
    '3gqnl95d': {
      'en': 'Close',
      'de': 'Schließen',
      'fr': 'Fermer',
    },
  },
  // AddTagComponent
  {
    'h5paq6qi': {
      'en': 'Create Tag',
      'de': 'Tag erstellen',
      'fr': 'Créer une balise',
    },
    'kj2ltrig': {
      'en': 'Name',
      'de': 'Name',
      'fr': 'Nom',
    },
    'b5t05s1n': {
      'en': 'Starter, Dessert, Drink...',
      'de': 'Vorspeise, Dessert, Getränk...',
      'fr': 'Entrée, Dessert, Boisson...',
    },
    'uqc2htw9': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
    '3hdogw89': {
      'en': 'Create tag',
      'de': 'Tag erstellen',
      'fr': 'Créer une balise',
    },
  },
  // confirmAction
  {
    '9v6osod9': {
      'en': 'Deleted',
      'de': 'Gelöscht',
      'fr': 'Supprimé',
    },
  },
  // tagsComponent
  {
    'os8yh46e': {
      'en': 'Option 1',
      'de': 'Option 1',
      'fr': 'Option 1',
    },
  },
  // ActionSheetSimple
  {
    '8nrly5sf': {
      'en': 'Complete the payment manually',
      'de': 'Schließen Sie die Zahlung manuell ab',
      'fr': 'Effectuer le paiement manuellement',
    },
    'ltdut29n': {
      'en': 'Process card payment',
      'de': 'Kartenzahlung verarbeiten',
      'fr': 'Traiter le paiement par carte',
    },
    'e9zeehlo': {
      'en': 'Process cash payment',
      'de': 'Barzahlung abwickeln',
      'fr': 'Traiter les paiements en espèces',
    },
    '3gnyzlxn': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
  },
  // review
  {
    'jvq2njrz': {
      'en': 'Rate your experience ',
      'de': 'Bewerten Sie Ihre Erfahrung',
      'fr': 'Évaluez votre expérience',
    },
    'lhnrjjwe': {
      'en': 'Send',
      'de': 'Schicken',
      'fr': 'Envoyer',
    },
  },
  // changeName
  {
    'xv4dpw8n': {
      'en': 'Your name',
      'de': 'Ihr Name',
      'fr': 'Votre nom',
    },
    'lhq2vbfu': {
      'en': 'Save',
      'de': 'Speichern',
      'fr': 'Sauvegarder',
    },
    'ul920ef9': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
  },
  // applePay
  {
    'i3jl2z2s': {
      'en': 'Configure',
      'de': 'Konfigurieren',
      'fr': 'Configure',
    },
    'kt3qcqye': {
      'en': 'Apple Pay',
      'de': 'Apple Pay',
      'fr': 'Apple Pay',
    },
    'm9aoliei': {
      'en': 'With Apple Pay, pay your bill in two clicks. Safer. Faster.',
      'de':
          'Mit Apple Pay bezahlen Sie Ihre Rechnung mit zwei Klicks. Sicherer. Schneller.',
      'fr':
          'Avec Apple Pay, payez votre facture en deux clics. Plus sûr. Plus rapide.',
    },
    'd91z01t8': {
      'en': 'Watch tutorial',
      'de': 'Tutorial ansehen',
      'fr': 'Regarder le tutoriel',
    },
    'xnkqkp1a': {
      'en': 'Close message',
      'de': 'Meldung schließen',
      'fr': 'Fermer le message',
    },
    'da3f1hu1': {
      'en': 'Don\'t show this message again',
      'de': 'Diese Nachricht nicht mehr anzeigen',
      'fr': 'Ne plus afficher ce message',
    },
  },
  // AdminOrUserWelcome
  {
    'uu8fbyvx': {
      'en': 'Welcome to OrderNow Pay',
      'de': 'Willkommen bei OrderNow Pay',
      'fr': 'Bienvenue sur OrderNow Pay',
    },
    'vphyn9e0': {
      'en':
          'We\'re delighted that you\'ve chosen OrderNow as your restaurant partner. Follow the instructions to get started.',
      'de':
          'Wir freuen uns, dass Sie OrderNow als Ihren Restaurantpartner ausgewählt haben. Folgen Sie den Anweisungen, um loszulegen.',
      'fr':
          'Nous sommes ravis que vous ayez choisi OrderNow comme partenaire de votre restaurant. Suivez les instructions pour commencer.',
    },
    '4lnwni6a': {
      'en': 'Create tables',
      'de': 'Erstellen von Tabellen',
      'fr': 'Créer des tableaux',
    },
    'bfc6blfs': {
      'en':
          'To take your first order, you need to recreate your tables. Each newly created table generates a unique QR code. Print out your stickers and stick them on your tables.',
      'de':
          'Um Ihre erste Bestellung entgegenzunehmen, müssen Sie Ihre Tische neu erstellen. Jeder neu erstellte Tisch generiert einen einzigartigen QR-Code. Drucken Sie Ihre Aufkleber aus und kleben Sie sie auf Ihre Tische.',
      'fr':
          'Pour prendre votre première commande, vous devez recréer vos tables. Chaque table nouvellement créée génère un QR code unique. Imprimez vos stickers et collez-les sur vos tables.',
    },
    'vk0lmg5w': {
      'en': 'Add your menu',
      'de': 'Fügen Sie Ihr Menü hinzu',
      'fr': 'Ajoutez votre menu',
    },
    '99o24e4w': {
      'en':
          'Add the first items to your menu, set the price for each and complete with a description. Once the items have been created, you can also add tags to them to find what your customer is looking for at a glance.',
      'de':
          'Fügen Sie Ihrem Menü die ersten Artikel hinzu, legen Sie den Preis für jeden Artikel fest und geben Sie eine Beschreibung ein. Sobald die Artikel erstellt wurden, können Sie ihnen auch Tags hinzufügen, damit Ihr Kunde auf einen Blick findet, wonach er sucht.',
      'fr':
          'Ajoutez les premiers éléments à votre menu, fixez le prix de chacun et complétez avec une description. Une fois les éléments créés, vous pouvez également leur ajouter des balises pour trouver en un coup d\'œil ce que votre client recherche.',
    },
    'q4vya0bz': {
      'en': 'You\'re all set.',
      'de': 'Sie sind fertig.',
      'fr': 'Vous êtes tous prêts.',
    },
    'lwpd0lfp': {
      'en': 'Close tutorial',
      'de': 'Tutorial schließen',
      'fr': 'Fermer le tutoriel',
    },
    'r8oothvz': {
      'en': 'Don\'t show this tutorial again',
      'de': 'Dieses Tutorial nicht mehr anzeigen',
      'fr': 'Ne plus afficher ce tutoriel',
    },
  },
  // subscriptionBottomCart
  {
    'kihpdong': {
      'en': 'Cart',
      'de': 'Warenkorb',
      'fr': 'Panier',
    },
    'ih19pir4': {
      'en': 'My package',
      'de': 'Mein Paket',
      'fr': 'Mon colis',
    },
    'chusibxa': {
      'en': 'OrderNow Business',
      'de': 'OrderNow Business',
      'fr': 'OrderNow Entreprise',
    },
    'ljpcyy68': {
      'en': '99.00 per year',
      'de': '99,00 pro Jahr',
      'fr': '99,00 \$ par an',
    },
    'da4vt4os': {
      'en': '12 months subscription',
      'de': '12 Monate Abonnement',
      'fr': 'Abonnement de 12 mois',
    },
    '34twsxay': {
      'en': 'Included',
      'de': 'Inbegriffen',
      'fr': 'Compris',
    },
    'pfnwlh75': {
      'en': '36 tables',
      'de': '36 Tische',
      'fr': '36 tableaux',
    },
    'z1s60m32': {
      'en': 'Stickers QR Codes sent to your address',
      'de': 'Aufkleber-QR-Codes an Ihre Adresse gesendet',
      'fr': 'Autocollants QR Codes envoyés à votre adresse',
    },
    'cv0cgne3': {
      'en': 'Unlimited staff',
      'de': 'Unbegrenztes Personal',
      'fr': 'Personnel illimité',
    },
    '6waizumu': {
      'en': 'Unlimited items',
      'de': 'Unbegrenzte Anzahl an Artikeln',
      'fr': 'Articles illimités',
    },
    'z0vlgh50': {
      'en': 'Unlimited transactions',
      'de': 'Unbegrenzte Transaktionen',
      'fr': 'Transactions illimitées',
    },
    '35aadbyg': {
      'en': '3.9% + 0.30 ct per transaction',
      'de': '3,9% + 0,30 ct pro Transaktion',
      'fr': '3,9% + 0,30 ct par transaction',
    },
    'huq0dk8h': {
      'en': 'Incl. VAT (8,1%)',
      'de': 'Inkl. MwSt. (8,1%)',
      'fr': 'TVA incluse (8,1%)',
    },
    'n79bzpks': {
      'en': '8.00',
      'de': '8.00',
      'fr': '8,00',
    },
    'sjzd0bx4': {
      'en': 'Total',
      'de': 'Gesamt',
      'fr': 'Total',
    },
    'r0vmtz1k': {
      'en': 'CHF 99.00 per year',
      'de': 'CHF 99.00 pro Jahr',
      'fr': 'CHF 99.00 par an',
    },
  },
  // FinalizeRegistration
  {
    'wtf1scjo': {
      'en': 'Finalize your registration',
      'de': 'Schließen Sie Ihre Registrierung ab',
      'fr': 'Finalisez votre inscription',
    },
    '6jp5r0kl': {
      'en': 'Some information is missing to finalize your registration.',
      'de': 'Um Ihre Registrierung abzuschließen, fehlen einige Informationen.',
      'fr':
          'Certaines informations sont manquantes pour finaliser votre inscription.',
    },
    'sjssbfzu': {
      'en': 'Finalize registration',
      'de': 'Registrierung abschließen',
      'fr': 'Finaliser l\'inscription',
    },
  },
  // NoData
  {
    'df1rh8xi': {
      'en': 'No data found',
      'de': 'Keine Daten gefunden',
      'fr': 'Aucune donnée trouvée',
    },
  },
  // changePhoneNumber
  {
    'fgbfomqp': {
      'en': 'Phone number',
      'de': 'Telefonnummer',
      'fr': 'Numéro de téléphone',
    },
    'u1woghr4': {
      'en': 'Save',
      'de': 'Speichern',
      'fr': 'Sauvegarder',
    },
    'f8so6pvg': {
      'en': 'Cancel',
      'de': 'Stornieren',
      'fr': 'Annuler',
    },
  },
  // TermsAndConditions
  {
    '7b115as3': {
      'en': 'Close',
      'de': 'Schließen',
      'fr': 'Fermer',
    },
    'ei5cmdev': {
      'en': 'Terms and conditions of use',
      'de': 'Nutzungsbedingungen',
      'fr': 'Conditions générales d\'utilisation',
    },
    'hd1q22xd': {
      'en':
          'These terms of use (the \"Terms\") govern your use of the OrderNow application (the \"Application\"), available on iOS and Android. By using the Application, you agree to be bound by these Terms. If you do not agree to these Terms, please do not use the Application.\n\n',
      'de':
          'Diese Nutzungsbedingungen (die „Bedingungen“) regeln Ihre Nutzung der OrderNow-Anwendung (die „Anwendung“), die für iOS und Android verfügbar ist. Durch die Nutzung der Anwendung erklären Sie sich mit diesen Bedingungen einverstanden. Wenn Sie diesen Bedingungen nicht zustimmen, verwenden Sie die Anwendung bitte nicht.',
      'fr':
          'Les présentes conditions d\'utilisation (les « Conditions ») régissent votre utilisation de l\'application OrderNow (l\'« Application »), disponible sur iOS et Android. En utilisant l\'Application, vous acceptez d\'être lié par ces Conditions. Si vous n\'acceptez pas ces Conditions, veuillez ne pas utiliser l\'Application.',
    },
    '86055e4q': {
      'en': '1. Use of the Application\n\n1.1 Free Users\n',
      'de': '1. Nutzung der Anwendung\n\n1.1 Kostenlose Benutzer',
      'fr': '1. Utilisation de l\'application\n\n1.1 Utilisateurs gratuits',
    },
    'r5ohbu1y': {
      'en':
          'Free users (\"Free Users\") are customers of registered restaurants on the Application. They use the Application to pay their bill online. By using the Application as a free user, you agree to comply with these Terms.\n\n',
      'de':
          'Kostenlose Benutzer („Kostenlose Benutzer“) sind Kunden von in der Anwendung registrierten Restaurants. Sie verwenden die Anwendung, um ihre Rechnung online zu bezahlen. Indem Sie die Anwendung als kostenloser Benutzer verwenden, erklären Sie sich mit diesen Bedingungen einverstanden.',
      'fr':
          'Les utilisateurs gratuits (« Utilisateurs gratuits ») sont des clients des restaurants inscrits sur l\'Application. Ils utilisent l\'Application pour payer leur facture en ligne. En utilisant l\'Application en tant qu\'utilisateur gratuit, vous acceptez de vous conformer aux présentes Conditions.',
    },
    'e6i1xc89': {
      'en': '1.2 Business Users\n',
      'de': '1.2 Geschäftskunden',
      'fr': '1.2 Utilisateurs professionnels',
    },
    'cn87ilzp': {
      'en':
          'Business users (\"Business Users\") are restaurateurs registered on the Application. They take orders from customers and allow customers to pay their bill online. Business users pay an annual subscription of CHF 99.- as well as transaction fees of 3.9% + CHF 0.30 per transaction. By using the Application as a business user, you agree to comply \n\n',
      'de':
          'Geschäftsbenutzer („Geschäftsbenutzer“) sind Gastronomen, die in der Anwendung registriert sind. Sie nehmen Bestellungen von Kunden entgegen und ermöglichen es Kunden, ihre Rechnung online zu bezahlen. Geschäftsbenutzer zahlen ein Jahresabonnement von CHF 99.- sowie Transaktionsgebühren von 3,9% + CHF 0,30 pro Transaktion. Indem Sie die Anwendung als Geschäftsbenutzer verwenden, erklären Sie sich damit einverstanden,',
      'fr':
          'Les utilisateurs professionnels (« Utilisateurs professionnels ») sont des restaurateurs inscrits sur l\'Application. Ils prennent les commandes des clients et permettent aux clients de payer leur facture en ligne. Les utilisateurs professionnels paient un abonnement annuel de CHF 99.- ainsi que des frais de transaction de 3,9% + CHF 0,30 par transaction. En utilisant l\'Application en tant qu\'utilisateur professionnel, vous acceptez de vous conformer',
    },
    '1iqhrfbq': {
      'en': '2. User Responsibilities\n\n',
      'de': '2. Pflichten des Nutzers',
      'fr': '2. Responsabilités de l\'utilisateur',
    },
    'nqfpuiqm': {
      'en': '2.1 Free Users\n',
      'de': '2.1 Kostenlose Benutzer',
      'fr': '2.1 Utilisateurs gratuits',
    },
    'm0zqof1g': {
      'en':
          'As a free user, you are responsible for all transactions made through the Application and agree to abide by the privacy and security policies of the Application.\n\n',
      'de':
          'Als kostenloser Benutzer sind Sie für alle über die Anwendung getätigten Transaktionen verantwortlich und erklären sich damit einverstanden, die Datenschutz- und Sicherheitsrichtlinien der Anwendung einzuhalten.',
      'fr':
          'En tant qu\'utilisateur gratuit, vous êtes responsable de toutes les transactions effectuées via l\'Application et acceptez de respecter les politiques de confidentialité et de sécurité de l\'Application.',
    },
    'sgf233gl': {
      'en': '2.2 Business Users\n',
      'de': '2.2 Gewerbliche Nutzer',
      'fr': '2.2 Utilisateurs professionnels',
    },
    'xteuwebp': {
      'en':
          'As a business user, you are responsible for managing your account and all transactions made through the Application. You also agree to pay the subscription and transaction fees mentioned above.\n\n',
      'de':
          'Als Geschäftskunde sind Sie für die Verwaltung Ihres Kontos und aller über die Anwendung getätigten Transaktionen verantwortlich. Sie erklären sich außerdem damit einverstanden, die oben genannten Abonnement- und Transaktionsgebühren zu zahlen.',
      'fr':
          'En tant qu\'utilisateur professionnel, vous êtes responsable de la gestion de votre compte et de toutes les transactions effectuées via l\'application. Vous acceptez également de payer les frais d\'abonnement et de transaction mentionnés ci-dessus.',
    },
    '3s3nsxfc': {
      'en': '3. Ownership and License\n\n',
      'de': '3. Eigentum und Lizenz',
      'fr': '3. Propriété et licence',
    },
    'h5wy315x': {
      'en':
          'OrderNow owns all intellectual property rights in the Application. By using the Application, you are granted a limited, non-exclusive, revocable license to use the Application in accordance with these Terms.\n\n',
      'de':
          'OrderNow besitzt alle geistigen Eigentumsrechte an der Anwendung. Durch die Nutzung der Anwendung erhalten Sie eine begrenzte, nicht exklusive, widerrufliche Lizenz zur Nutzung der Anwendung gemäß diesen Bedingungen.',
      'fr':
          'OrderNow détient tous les droits de propriété intellectuelle sur l\'Application. En utilisant l\'Application, vous bénéficiez d\'une licence limitée, non exclusive et révocable pour utiliser l\'Application conformément aux présentes Conditions.',
    },
    'wmzu3oar': {
      'en': '4. Limitation of Liability\n\n',
      'de': '4. Haftungsbeschränkung',
      'fr': '4. Limitation de responsabilité',
    },
    'ke1g2700': {
      'en':
          'OrderNow is not responsible for the products or services provided by free or business users. We do not guarantee the accuracy, completeness, or reliability of the information available through the Application.\n\n',
      'de':
          'OrderNow ist nicht verantwortlich für die Produkte oder Dienstleistungen, die von kostenlosen oder gewerblichen Benutzern bereitgestellt werden. Wir übernehmen keine Garantie für die Richtigkeit, Vollständigkeit oder Zuverlässigkeit der über die Anwendung verfügbaren Informationen.',
      'fr':
          'OrderNow n\'est pas responsable des produits ou services fournis par les utilisateurs gratuits ou professionnels. Nous ne garantissons pas l\'exactitude, l\'exhaustivité ou la fiabilité des informations disponibles via l\'application.',
    },
    'iggleg7a': {
      'en': '5. Changes to the Terms\n\n',
      'de': '5. Änderungen der Bedingungen',
      'fr': '5. Modifications des conditions',
    },
    'hobzrgjs': {
      'en':
          'We reserve the right to modify these Terms at any time. Changes will be effective upon publication on the Application. By continuing to use the Application after the publication of changes, you agree to the modified Terms.\n\n\nLast updated: March 27, 2024\n\n',
      'de':
          'Wir behalten uns das Recht vor, diese Bedingungen jederzeit zu ändern. Änderungen werden mit der Veröffentlichung in der Anwendung wirksam. Indem Sie die Anwendung nach der Veröffentlichung von Änderungen weiterhin nutzen, stimmen Sie den geänderten Bedingungen zu.\n\nZuletzt aktualisiert: 27. März 2024',
      'fr':
          'Nous nous réservons le droit de modifier les présentes Conditions à tout moment. Les modifications entreront en vigueur dès leur publication sur l\'Application. En continuant à utiliser l\'Application après la publication des modifications, vous acceptez les Conditions modifiées.\n\nDernière mise à jour : 27 mars 2024',
    },
    'iha3rra1': {
      'en': '6. Confidentiality of the Application\n\n',
      'de': '6. Vertraulichkeit der Bewerbung',
      'fr': '6. Confidentialité de la demande',
    },
    'xl2xqpvj': {
      'en':
          'At OrderNow, we prioritize the privacy and security of our users\' data. Here\'s how we handle data in our application:\n\nData Relating to You\n\nTo enhance your experience with OrderNow, we may collect and use the following types of data:\n\nAdvertising or Marketing: \nWe use your contact details such as your email address to send you information about our products and services.\n\nUser Content: \nInformation you provide, such as emails or SMS, helps us personalize and improve our services.\n\nAnalytics: \nWe gather analytics data to understand how our users interact with our application and to enhance their experience.\n\nCustomer Support: \nYour contact details and user ID enable us to provide efficient and personalized customer support.\n\nProduct Customization: \nWe use your information to customize your experience with our application and provide features tailored to your needs.\n\nAt OrderNow, we are committed to safeguarding the privacy of your data and using it responsibly and securely.',
      'de':
          'Bei OrderNow legen wir größten Wert auf die Privatsphäre und Sicherheit der Daten unserer Benutzer. So gehen wir mit Daten in unserer Anwendung um:\n\nDaten in Bezug auf Sie\n\nUm Ihre Erfahrung mit OrderNow zu verbessern, können wir die folgenden Arten von Daten erfassen und verwenden:\n\nWerbung oder Marketing:\n\nWir verwenden Ihre Kontaktdaten wie Ihre E-Mail-Adresse, um Ihnen Informationen über unsere Produkte und Dienstleistungen zu senden.\n\nBenutzerinhalte:\n\nVon Ihnen bereitgestellte Informationen, wie E-Mails oder SMS, helfen uns, unsere Dienstleistungen zu personalisieren und zu verbessern.\n\nAnalyse:\n\nWir sammeln Analysedaten, um zu verstehen, wie unsere Benutzer mit unserer Anwendung interagieren, und um ihre Erfahrung zu verbessern.\n\nKundensupport:\n\nIhre Kontaktdaten und Benutzer-ID ermöglichen es uns, effizienten und personalisierten Kundensupport bereitzustellen.\n\nProduktanpassung:\n\nWir verwenden Ihre Informationen, um Ihre Erfahrung mit unserer Anwendung anzupassen und Funktionen bereitzustellen, die auf Ihre Bedürfnisse zugeschnitten sind.\n\nBei OrderNow verpflichten wir uns, die Privatsphäre Ihrer Daten zu schützen und sie verantwortungsbewusst und sicher zu verwenden.',
      'fr':
          'Chez OrderNow, nous accordons la priorité à la confidentialité et à la sécurité des données de nos utilisateurs. Voici comment nous traitons les données dans notre application :\n\nDonnées vous concernant\n\nPour améliorer votre expérience avec OrderNow, nous pouvons collecter et utiliser les types de données suivants :\n\nPublicité ou marketing :\nNous utilisons vos coordonnées, telles que votre adresse e-mail, pour vous envoyer des informations sur nos produits et services.\n\nContenu utilisateur :\nLes informations que vous fournissez, telles que les e-mails ou les SMS, nous aident à personnaliser et à améliorer nos services.\n\nAnalyse :\nNous collectons des données d\'analyse pour comprendre comment nos utilisateurs interagissent avec notre application et pour améliorer leur expérience.\n\nAssistance client :\nVos coordonnées et votre identifiant d\'utilisateur nous permettent de fournir une assistance client efficace et personnalisée.\n\nPersonnalisation du produit :\nNous utilisons vos informations pour personnaliser votre expérience avec notre application et fournir des fonctionnalités adaptées à vos besoins.\n\nChez OrderNow, nous nous engageons à protéger la confidentialité de vos données et à les utiliser de manière responsable et sécurisée.',
    },
    'v5t04qhh': {
      'en':
          'Ces conditions générales d\'utilisation (les \"Conditions\") régissent votre utilisation de l\'application OrderNow Pay (l\'\"Application\"), disponible sur iOS et Android. En utilisant l\'Application, vous acceptez d\'être lié par ces Conditions. Si vous n\'acceptez pas ces Conditions, veuillez ne pas utiliser l\'Application.',
      'de':
          'Diese allgemeinen Nutzungsbedingungen (die „Bedingungen“) gelten für die Nutzung der OrderNow Pay-Anwendung (die „Anwendung“), verfügbar auf iOS und Android. Während Sie die Bewerbung nutzen, akzeptieren Sie die folgenden Bedingungen. Wenn Sie diese Bedingungen nicht akzeptieren, dürfen Sie die Bewerbung nicht nutzen.',
      'fr':
          'Ces conditions générales d\'utilisation (les \"Conditions\") régissent votre utilisation de l\'application OrderNow Pay (l\'\"Application\"), disponible sur iOS et Android. En utilisant l\'Application, vous acceptez d\'être lié par ces Conditions. Si vous n\'acceptez pas ces Conditions, veuillez ne pas utiliser l\'Application.',
    },
    '46u8pv90': {
      'en': 'OrderNow Sàrl, 2024',
      'de': 'OrderNow Sàrl, 2024',
      'fr': 'OrderNow Sàrl, 2024',
    },
  },
  // subscriptionNeededToPay
  {
    'u56ddn3q': {
      'en': 'Finalize your subscription',
      'de': 'Schließen Sie Ihr Abonnement ab',
      'fr': 'Finalisez votre inscription',
    },
    'f27cxioa': {
      'en': 'My package',
      'de': 'Mein Paket',
      'fr': 'Mon colis',
    },
    'buenhapo': {
      'en': 'OrderNow Business',
      'de': 'OrderNow Business',
      'fr': 'OrderNow Entreprise',
    },
    'o371g83q': {
      'en': '99.00 per year',
      'de': '99,00 pro Jahr',
      'fr': '99,00 \$ par an',
    },
    'dlzo7ybh': {
      'en': '12 months subscription',
      'de': '12 Monate Abonnement',
      'fr': 'Abonnement de 12 mois',
    },
    'nwn2wztg': {
      'en': 'Included',
      'de': 'Inbegriffen',
      'fr': 'Compris',
    },
    'vk07vw93': {
      'en': '36 tables',
      'de': '36 Tische',
      'fr': '36 tableaux',
    },
    'gve098ex': {
      'en': 'Stickers QR Codes sent to your address',
      'de': 'Aufkleber-QR-Codes an Ihre Adresse gesendet',
      'fr': 'Autocollants QR Codes envoyés à votre adresse',
    },
    '1rgovrqi': {
      'en': 'Unlimited staff',
      'de': 'Unbegrenztes Personal',
      'fr': 'Personnel illimité',
    },
    'lfu9lym0': {
      'en': 'Unlimited items',
      'de': 'Unbegrenzte Anzahl an Artikeln',
      'fr': 'Articles illimités',
    },
    '5kwh3w4e': {
      'en': 'Unlimited transactions',
      'de': 'Unbegrenzte Transaktionen',
      'fr': 'Transactions illimitées',
    },
    'abyn6td4': {
      'en': '3.9% + 0.30 ct per transaction',
      'de': '3,9% + 0,30 ct pro Transaktion',
      'fr': '3,9% + 0,30 ct par transaction',
    },
    'kyrksp3n': {
      'en': 'Incl. VAT (8,1%)',
      'de': 'Inkl. MwSt. (8,1%)',
      'fr': 'TVA incluse (8,1%)',
    },
    '49c7ldz4': {
      'en': '8.00',
      'de': '8.00',
      'fr': '8,00',
    },
    'aw75l1sn': {
      'en': 'Total',
      'de': 'Gesamt',
      'fr': 'Total',
    },
    '9e4omder': {
      'en': 'CHF 99.00 per year',
      'de': 'CHF 99.00 pro Jahr',
      'fr': 'CHF 99.00 par an',
    },
    'qt0n7ils': {
      'en': 'Pay now',
      'de': 'Jetzt bezahlen',
      'fr': 'Payer maintenant',
    },
  },
  // PaymentError
  {
    'cbts25zd': {
      'en': 'Continue',
      'de': 'Weiter',
      'fr': 'Continuer',
    },
  },
  // accountBlocked
  {
    't91cjeof': {
      'en': 'Account Blocked',
      'de': 'Konto gesperrt',
      'fr': 'Compte bloqué',
    },
    '87ams849': {
      'en': 'Your account has been  suspended',
      'de': 'Ihr Konto wurde gesperrt',
      'fr': 'Votre compte a été suspendu',
    },
    'rwlrr0ap': {
      'en':
          'This account has been blocked because you have been removed from the store as a Staff Member. Please contact your company for further information.',
      'de':
          'Dieses Konto wurde gesperrt, da Sie als Mitarbeiter aus dem Geschäft entfernt wurden. Bitte wenden Sie sich für weitere Informationen an Ihr Unternehmen.',
      'fr':
          'Ce compte a été bloqué car vous avez été retiré de la boutique en tant que membre du personnel. Veuillez contacter votre entreprise pour plus d\'informations.',
    },
    'fn69j31q': {
      'en': 'Delete my account',
      'de': 'Mein Konto löschen',
      'fr': 'Supprimer mon compte',
    },
    'u2lsgvrf': {
      'en': 'Log out',
      'de': 'Aus Konto abmelden',
      'fr': 'Se déconnecter',
    },
  },
  // Miscellaneous
  {
    'czr5w4bn': {
      'en':
          'In order to scan tables, this app requires permission to access the camera.',
      'de':
          'Zum Scannen von Tischen benötigt diese App eine Berechtigung zum Zugriff auf die Kamera.',
      'fr':
          'Afin de numériser des tables, cette application nécessite une autorisation d\'accès à la caméra.',
    },
    '518rurxt': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'de':
          'Zum Hochladen von Daten benötigt diese App eine Berechtigung zum Zugriff auf die Fotobibliothek.',
      'fr':
          'Afin de télécharger des données, cette application nécessite une autorisation d\'accès à la photothèque.',
    },
    '4kz8v2fj': {
      'en':
          'In order to use your keyboard microphone, this app requires permission to access the microphone.',
      'de':
          'Um Ihr Tastaturmikrofon verwenden zu können, benötigt diese App die Berechtigung für den Zugriff auf das Mikrofon.',
      'fr':
          'Afin d\'utiliser le microphone de votre clavier, cette application nécessite l\'autorisation d\'accéder au microphone.',
    },
    'hgtrdh4p': {
      'en':
          'Enable notifications to stay on top of important updates and exclusive offers from OrderNow Pay. We’ll send you timely alerts about your account, new features, and special promotions tailored just for you. You can customize or opt out of notifications anytime in your settings.',
      'de':
          'Aktivieren Sie Benachrichtigungen, um über wichtige Updates und exklusive Angebote von OrderNow Pay auf dem Laufenden zu bleiben. Wir senden Ihnen rechtzeitig Benachrichtigungen zu Ihrem Konto, neuen Funktionen und speziell auf Sie zugeschnittenen Sonderaktionen. Sie können Benachrichtigungen jederzeit in Ihren Einstellungen anpassen oder deaktivieren.',
      'fr':
          'Activez les notifications pour rester informé des mises à jour importantes et des offres exclusives de OrderNow Pay. Nous vous enverrons des alertes ponctuelles sur votre compte, les nouvelles fonctionnalités et les promotions spéciales conçues spécialement pour vous. Vous pouvez personnaliser ou désactiver les notifications à tout moment dans vos paramètres.',
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
    '5j6m6x5h': {
      'en': '',
      'de':
          'Diese E-Mail-Adresse wird bereits von einem anderen Konto verwendet',
      'fr': 'Cette adresse email est déjà utilisée par un autre compte',
    },
    '8443n39f': {
      'en': '',
      'de': 'Kochen',
      'fr': 'Cuisiner',
    },
    'mofr0v3p': {
      'en': '',
      'de': 'Ungültiges Dateiformat',
      'fr': 'Format non pris en charge',
    },
    'v96jquf3': {
      'en': '',
      'de': 'Datei herunterladen',
      'fr': 'Téléchargement du fichier',
    },
    'skcco06k': {
      'en': '',
      'de': 'Success!',
      'fr': 'Success!',
    },
    '94tovai9': {
      'en': '',
      'de': 'Hochladen der Daten fehlgeschlagen',
      'fr': 'Le téléchargement a échoué.',
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
      'fr': 'Galllerie (Photo)',
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
          'Erreur de paiement ! Vérifiez votre moyen de paiement ou contactez votre banque.',
    },
  },
].reduce((a, b) => a..addAll(b));
