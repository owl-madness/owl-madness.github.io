import '../models/experience.dart';
import '../models/project.dart';
import '../models/skill_group.dart';

/// All site content lives here. Edit this file to update the portfolio.
/// Keep wording honest: say what you personally did.
class PortfolioData {
  PortfolioData._();

  // ---- Identity -----------------------------------------------------------
  static const String name = 'Sourav Sathyan CP';
  static const String title = 'Flutter Developer';
  static const String location = 'Kerala, India';
  static const String pitch =
      'I build Flutter apps for Android and iOS, from real-time chat '
      'to store releases.';

  static const List<String> bio = [
    "I'm a Flutter developer from Kerala with 4+ years of experience "
        'building, shipping and maintaining apps on the Google Play Store '
        'and Apple App Store.',
    "I've worked on real-time messaging, governance and video-conferencing "
        'apps, a jewellery scheme platform and an e-learning app. I like the '
        'parts of mobile work that sit close to the platform: push '
        'notifications, native integrations, debugging live apps and getting '
        'a build through store review.',
  ];

  static const List<String> facts = [
    '4+ years of experience',
    'Android and iOS',
    'Based in Kerala, India',
    'Open to relocation',
  ];

  // ---- Contact ------------------------------------------------------------
  static const String email = 'sourav99chitram@gmail.com';
  static const String emailLink = 'mailto:sourav99chitram@gmail.com';
  static const String linkedInUrl =
      'https://www.linkedin.com/in/sourav-sathyan-cp';
  static const String githubUrl = 'https://github.com/owl-madness';

  /// File lives at web/resume/. Relative on purpose, see utils/links.dart.
  static const String resumePath = 'resume/Sourav_Sathyan_CP_Resume.pdf';

  // ---- Experience ---------------------------------------------------------
  static const List<ExperienceItem> experience = [
    ExperienceItem(
      company: 'XGen Business Systems',
      role: 'Flutter Developer',
      period: 'Apr 2024 to Sep 2026',
      location: 'Kochi, Kerala',
      highlights: [
        'Helped complete and ship apps in the NEAR suite (Near Chat, Near '
            'Governance, Near Connect) on the Google Play Store and Apple '
            'App Store.',
        'Built real-time messaging features: Meteor-based sync, local '
            'SQLite storage, pagination and push notifications.',
        'Wrote native Swift and Kotlin code behind Flutter MethodChannels '
            'for iOS notification handling and Android device information.',
        'Diagnosed and fixed concurrency and performance issues in live '
            'apps, working with backend and design teams.',
        'Worked with a Jenkins and Bitbucket pipeline for automated store '
            'builds, published releases manually, and tested on Android '
            'phones, iPhone and iPad.',
      ],
    ),
    ExperienceItem(
      company: 'Lilac Infotech',
      role: 'Software Engineer',
      period: 'Nov 2023 to Jan 2024',
      location: 'Calicut, Kerala',
      highlights: [
        'Maintained production apps: fixed bugs, resolved user-reported '
            'issues, wrote unit tests and added small features.',
        'Worked in codebases using Riverpod, BLoC and GetX.',
        'Reviewed code and mentored interns on Flutter fundamentals, Clean '
            'Architecture and good practice.',
      ],
    ),
    ExperienceItem(
      company: 'Logiology Solutions',
      role: 'Flutter Developer',
      period: 'Nov 2021 to Oct 2023',
      location: 'Calicut, Kerala',
      highlights: [
        'Built and deployed Android and iOS apps from scratch to '
            'production, mainly with Provider for state management.',
        'Integrated payment gateways, push notifications and third-party '
            'SDKs, and implemented secure authentication.',
        'Used Hive and SQLite for offline storage, and built reusable UI '
            'components and REST API layers with design and backend teams.',
      ],
    ),
  ];

  // ---- Projects -----------------------------------------------------------
  // Company projects: description and store links only, no screenshots,
  // unless the company has approved it. Add links when you have them, e.g.
  //   links: [ProjectLink(label: 'Google Play', url: 'https://...')],
  static const List<Project> projects = [
    Project(
      name: 'Near Chat',
      featured: true,
      kind: ProjectKind.company,
      org: 'XGen Business Systems',
      summary:
          'A real-time messaging app in the NEAR suite, with one-to-one and '
          'group chat on Android and iOS.',
      role:
          'Flutter developer on the team that completed and shipped the '
          'app. I worked on every feature except audio and video calling, '
          'where I fixed bugs.',
      features: [
        'One-to-one and group messaging with real-time sync',
        'Local message storage and pagination',
        'Push notifications',
        'Profile settings',
        'Native iOS and Android integration through platform channels',
        'Release builds and store publishing',
      ],
      stack: [
        'Flutter',
        'Dart',
        'Provider',
        'Meteor',
        'Dio',
        'SQLite',
        'Firebase Cloud Messaging',
        'Swift',
        'Kotlin',
      ],
    ),
    Project(
      name: 'Near Governance 1.0',
      kind: ProjectKind.company,
      org: 'XGen Business Systems',
      summary:
          'A governance app in the NEAR suite for proposals and voting.',
      role:
          'Flutter development, native build setup, and Play Store and App '
          'Store publishing and compliance.',
      features: [
        'Proposal workflows',
        'Voting workflows',
      ],
      stack: ['Flutter', 'Dart', 'REST APIs', 'Firebase'],
    ),
    Project(
      name: 'Near Connect',
      kind: ProjectKind.company,
      org: 'XGen Business Systems',
      summary:
          'A lighter video-conferencing app from the NEAR suite, with a '
          'smaller feature set than Near Governance.',
      role: 'Flutter development and release builds.',
      features: ['Video conferencing'],
      stack: ['Flutter', 'Dart', 'WebRTC', 'Firebase'],
    ),
    Project(
      name: 'Scheme Agent and Customer Apps',
      kind: ProjectKind.company,
      org: 'Logiology Solutions',
      summary:
          'Two apps for a jewellery scheme platform: one for agents, one '
          'for customers.',
      role: 'Flutter developer: UI, API integration and notifications.',
      features: [
        'Scheme enrolment and management',
        'Instalment tracking and payment history',
        'Payment reminders and alerts',
        'ERP integration',
      ],
      stack: [
        'Flutter',
        'Dart',
        '.NET backend (REST)',
        'Firebase Cloud Messaging',
      ],
    ),
    Project(
      name: 'Samastha E-Learning',
      kind: ProjectKind.company,
      org: 'Logiology Solutions',
      summary:
          'A digital madrasa learning app for students and parents.',
      role: 'Flutter developer: video playback, API integration and '
          'authentication.',
      features: [
        'Video lessons and learning materials',
        'Sign-in for students and parents',
        'Announcements and event reminders through notifications',
      ],
      stack: [
        'Flutter',
        'Dart',
        'Dio',
        'Firebase Auth',
        'Firebase Cloud Messaging',
        'FlickPlayer',
      ],
    ),
    Project(
      name: 'WorkEase Assistant',
      kind: ProjectKind.personal,
      status: 'MCA final project, prototype',
      summary:
          'A mobile assistant that reads facial expressions on the device '
          'and adapts its productivity suggestions to the detected mood.',
      role: 'Solo project: app, model training and on-device integration.',
      features: [
        'Face detection with Google ML Kit',
        'Emotion classification (happy, sad, angry, neutral) with a '
            'TensorFlow Lite model',
        'Task creation, viewing and deletion with local storage',
        'Inference runs on the device, so no face data leaves the phone',
        'Prototype accuracy of about 50 to 55 percent on FER2013, which '
            'uses low-resolution grayscale images',
      ],
      stack: [
        'Flutter',
        'Dart',
        'Provider',
        'MVVM',
        'TensorFlow Lite',
        'MobileNetV2',
        'Google ML Kit',
        'Hive',
        'Python',
      ],
    ),
    Project(
      name: 'FinMan',
      kind: ProjectKind.personal,
      status: 'In progress',
      summary:
          'A personal finance manager I am building to practise '
          'feature-based architecture, Riverpod and a typed local database.',
      features: [
        'Feature-based project structure',
        'Navigation with go_router',
        'Drift database with transactions and categories tables',
      ],
      stack: ['Flutter', 'Dart', 'Riverpod', 'go_router', 'Drift'],
    ),
    Project(
      name: 'BLoC Calculator',
      kind: ProjectKind.personal,
      summary:
          'A calculator built to learn BLoC, events and states, and unit '
          'testing.',
      features: [
        'Digits, decimals, operators, equals, clear and backspace',
        '8 passing unit tests',
      ],
      stack: ['Flutter', 'Dart', 'flutter_bloc', 'Equatable'],
    ),
    Project(
      name: 'HabitTrack',
      kind: ProjectKind.personal,
      status: 'Internal testing on Google Play',
      summary: 'An Android habit tracker.',
      features: ['Habit tracking'],
      // TODO: confirm the stack and add the real feature list.
      stack: ['Flutter', 'Dart'],
    ),
  ];

  // ---- Skills -------------------------------------------------------------
  static const List<SkillGroup> skills = [
    SkillGroup(
      title: 'Daily driver',
      note: 'What I have used most in production.',
      skills: [
        'Flutter and Dart',
        'Provider',
        'REST APIs and Dio',
        'Firebase (Auth, Firestore, FCM)',
        'Push notifications',
        'Native Android and iOS integration',
        'SQLite and Hive',
        'Git and Bitbucket',
        'Play Store and App Store releases',
      ],
    ),
    SkillGroup(
      title: 'Hands-on, growing',
      note: 'Used in maintenance work and personal projects.',
      skills: [
        'BLoC and Cubit',
        'Riverpod',
        'Clean Architecture',
        'Unit testing',
        'CI/CD',
        'WebRTC (limited exposure)',
      ],
    ),
    SkillGroup(
      title: 'Also worked with',
      skills: [
        'Kotlin',
        'Swift',
        'Java',
        'Python',
        'GetX',
        'Jenkins',
        'TensorFlow Lite',
        'Postman',
        'Figma',
      ],
    ),
  ];

  // ---- Education ----------------------------------------------------------
  static const List<EducationItem> education = [
    EducationItem(
      degree: 'Master of Computer Applications (MCA)',
      institution: 'Sikkim Manipal University',
      period: '2024 to 2026',
    ),
    EducationItem(
      degree: 'Bachelor of Computer Applications (BCA)',
      institution: 'University of Calicut',
      period: '2017 to 2020',
    ),
  ];
}
