import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const Color navy = Color(0xFF142B4A);
const Color blue = Color(0xFF2463A6);
const Color gold = Color(0xFFD9A441);
const Color pageBg = Color(0xFFF4F7FB);
const Color green = Color(0xFF218653);
const Color red = Color(0xFFD64545);

void main() {
  runApp(const MasarApp());
}

class MasarApp extends StatelessWidget {
  const MasarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مسار التعليم - مسابقة',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pageBg,
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        appBarTheme: const AppBarTheme(
          backgroundColor: navy,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: const BorderSide(color: Color(0xFFDCE3EC)),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// الصفحة الرئيسية
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openPage(BuildContext context, Widget page) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'مسابقة',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              tooltip: 'القائمة الجانبية',
              icon: const Icon(Icons.menu_rounded),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [navy, blue],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.school_rounded,
                      size: 44,
                      color: gold,
                    ),
                    SizedBox(height: 9),
                    Text(
                      'مسار التعليم',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'طريقك نحو المعرفة والنجاح',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('الصفحة الرئيسية'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('دخول الطالب'),
                onTap: () => openPage(context, const StudentPage()),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard_outlined),
                title: const Text('لوحة الأستاذ'),
                onTap: () => openPage(context, const TeacherPage()),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.menu_book_outlined),
                title: const Text('دليل التطبيق'),
                onTap: () => openPage(context, const GuidePage()),
              ),
              ListTile(
                leading: const Icon(Icons.support_agent_outlined),
                title: const Text('خدمة العملاء'),
                onTap: () => openPage(context, const SupportPage()),
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('حول التطبيق'),
                onTap: () => openPage(context, const AboutPage()),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [navy, blue],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: navy.withValues(alpha: 0.18),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.school_rounded,
                    size: 76,
                    color: gold,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'مسار التعليم',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 9),
                  Text(
                    'طريقك نحو المعرفة والنجاح',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'منصة تعليمية للمسابقات والاختبارات '
                    'التفاعلية وتنمية المعرفة.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.7,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'مرحبًا بك!',
              style: TextStyle(
                color: navy,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'اختر القسم الذي تريد الدخول إليه.',
              style: TextStyle(color: Colors.blueGrey),
            ),
            const SizedBox(height: 15),
            HomeActionCard(
              icon: Icons.person_rounded,
              title: 'دخول الطالب',
              subtitle: 'المشاركة في المسابقة والإجابة عن الأسئلة',
              color: blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StudentPage(),
                  ),
                );
              },
            ),
            HomeActionCard(
              icon: Icons.admin_panel_settings_rounded,
              title: 'لوحة الأستاذ',
              subtitle: 'عرض لوحة إدارة المسابقة التجريبية',
              color: gold,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const TeacherPage(),
                  ),
                );
              },
            ),
            HomeActionCard(
              icon: Icons.menu_book_rounded,
              title: 'دليل التطبيق',
              subtitle: 'تعرف على طريقة استخدام التطبيق',
              color: green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GuidePage(),
                  ),
                );
              },
            ),
            HomeActionCard(
              icon: Icons.support_agent_rounded,
              title: 'خدمة العملاء',
              subtitle: 'تواصل معنا عند الحاجة إلى المساعدة',
              color: blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SupportPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
            const Divider(),
            const SizedBox(height: 12),
            const Center(
              child: Column(
                children: [
                  Text(
                    'مسار التعليم',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: navy,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'طريقك نحو المعرفة والنجاح',
                    style: TextStyle(
                      color: blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'إعداد وتطوير: إياد نصر الشميري',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class HomeActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const HomeActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(13),
        leading: CircleAvatar(
          radius: 27,
          backgroundColor: color.withValues(alpha: 0.13),
          child: Icon(icon, color: color, size: 29),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: navy,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(subtitle),
        ),
        trailing: const Icon(Icons.arrow_back_ios_new, size: 17),
        onTap: onTap,
      ),
    );
  }
}

// نموذج الأسئلة التجريبية
class QuizQuestion {
  final String text;
  final List<String> options;
  final int correctIndex;

  const QuizQuestion({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

const List<QuizQuestion> demoQuestions = [
  QuizQuestion(
    text: 'ما عاصمة اليمن؟',
    options: ['عدن', 'صنعاء', 'تعز', 'إب'],
    correctIndex: 1,
  ),
  QuizQuestion(
    text: 'كم عدد أيام الأسبوع؟',
    options: ['خمسة', 'ستة', 'سبعة', 'ثمانية'],
    correctIndex: 2,
  ),
  QuizQuestion(
    text: 'ما ناتج 5 + 7؟',
    options: ['10', '11', '12', '13'],
    correctIndex: 2,
  ),
  QuizQuestion(
    text: 'ما الكوكب الذي نعيش عليه؟',
    options: ['المريخ', 'الأرض', 'الزهرة', 'المشتري'],
    correctIndex: 1,
  ),
  QuizQuestion(
    text: 'ما اللغة المستخدمة في هذا التطبيق؟',
    options: ['العربية', 'الفرنسية', 'الألمانية', 'الإيطالية'],
    correctIndex: 0,
  ),
];

// دخول الطالب
class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final nameController = TextEditingController();
  final codeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    codeController.dispose();
    super.dispose();
  }

  void startQuiz() {
    final name = nameController.text.trim();
    final code = codeController.text.trim();

    if (name.isEmpty || code.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى كتابة اسم الطالب ورمز المسابقة'),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QuizPage(studentName: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('دخول الطالب')),
      body: ListView(
        padding: const EdgeInsets.all(22),
        children: [
          const SizedBox(height: 18),
          const Icon(Icons.school_rounded, size: 75, color: blue),
          const SizedBox(height: 12),
          const Text(
            'أهلًا بك أيها الطالب',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: navy,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'أدخل بياناتك للبدء في المسابقة التجريبية.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blueGrey),
          ),
          const SizedBox(height: 30),
          const Text(
            'اسم الطالب',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: nameController,
            textDirection: TextDirection.rtl,
            decoration: const InputDecoration(
              hintText: 'اكتب اسمك الكامل',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'رمز المسابقة',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: codeController,
            textDirection: TextDirection.ltr,
            decoration: const InputDecoration(
              hintText: 'أدخل أي رمز للتجربة',
              prefixIcon: Icon(Icons.key_rounded),
            ),
          ),
          const SizedBox(height: 25),
          FilledButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('دخول المسابقة'),
            style: FilledButton.styleFrom(
              backgroundColor: blue,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(54),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'ملاحظة: الرمز في هذه النسخة تجريبي، '
            'ولا يتم التحقق منه عبر قاعدة بيانات.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// شاشة المسابقة
class QuizPage extends StatefulWidget {
  final String studentName;

  const QuizPage({
    super.key,
    required this.studentName,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentIndex = 0;
  int? selectedIndex;
  int score = 0;
  bool submitted = false;

  void submitAnswer() {
    if (selectedIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('اختر إجابة أولًا')),
      );
      return;
    }

    final isCorrect =
        selectedIndex == demoQuestions[currentIndex].correctIndex;

    if (isCorrect) {
      score++;
    }

    if (currentIndex == demoQuestions.length - 1) {
      setState(() {
        submitted = true;
      });
    } else {
      setState(() {
        currentIndex++;
        selectedIndex = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (submitted) {
      return ResultPage(
        studentName: widget.studentName,
        score: score,
        total: demoQuestions.length,
      );
    }

    final question = demoQuestions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('المسابقة')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'الطالب: ${widget.studentName}',
            style: const TextStyle(
              color: navy,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          LinearProgressIndicator(
            value: (currentIndex + 1) / demoQuestions.length,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
            backgroundColor: Colors.blueGrey.shade100,
            color: blue,
          ),
          const SizedBox(height: 10),
          Text(
            'السؤال ${currentIndex + 1} من ${demoQuestions.length}',
            style: const TextStyle(color: Colors.blueGrey),
          ),
          const SizedBox(height: 18),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                question.text,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: navy,
                  height: 1.6,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(question.options.length, (index) {
            final isSelected = selectedIndex == index;

            return Card(
              child: RadioListTile<int>(
                value: index,
                groupValue: selectedIndex,
                activeColor: blue,
                title: Text(
                  question.options[index],
                  style: const TextStyle(fontSize: 16),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            );
          }),
          const SizedBox(height: 22),
          FilledButton.icon(
            onPressed: submitAnswer,
            icon: Icon(
              currentIndex == demoQuestions.length - 1
                  ? Icons.check_circle_outline
                  : Icons.arrow_back_rounded,
            ),
            label: Text(
              currentIndex == demoQuestions.length - 1
                  ? 'إنهاء المسابقة'
                  : 'السؤال التالي',
            ),
            style: FilledButton.styleFrom(
              backgroundColor: blue,
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(52),
            ),
          ),
        ],
      ),
    );
  }
}

// النتيجة
class ResultPage extends StatelessWidget {
  final String studentName;
  final int score;
  final int total;

  const ResultPage({
    super.key,
    required this.studentName,
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (score / total * 100).round();

    return Scaffold(
      appBar: AppBar(title: const Text('نتيجة المسابقة')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(26),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    percentage >= 60
                        ? Icons.emoji_events_rounded
                        : Icons.menu_book_rounded,
                    size: 85,
                    color: gold,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'انتهت المسابقة!',
                    style: TextStyle(
                      color: navy,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('الطالب: $studentName'),
                  const SizedBox(height: 25),
                  Text(
                    '$score / $total',
                    style: const TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      color: blue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'نسبة النجاح: $percentage%',
                    style: const TextStyle(
                      fontSize: 18,
                      color: green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    percentage >= 60
                        ? 'أحسنت! استمر في التعلم والنجاح.'
                        : 'واصل المراجعة والمحاولة، فالتعلم رحلة مستمرة.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(height: 1.7),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        Navigator.popUntil(
                          context,
                          (route) => route.isFirst,
                        );
                      },
                      child: const Text('العودة إلى الرئيسية'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// لوحة الأستاذ التجريبية
class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('لوحة الأستاذ')),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [navy, blue],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.dashboard_customize_rounded,
                  color: gold,
                  size: 43,
                ),
                SizedBox(height: 10),
                Text(
                  'لوحة التحكم',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'نظرة عامة على النسخة التجريبية',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Expanded(
                child: StatCard(
                  title: 'الأسئلة',
                  value: '5',
                  icon: Icons.quiz_outlined,
                  color: blue,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: StatCard(
                  title: 'الطلاب',
                  value: '0',
                  icon: Icons.people_outline,
                  color: green,
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Expanded(
                child: StatCard(
                  title: 'المحجوز',
                  value: '0',
                  icon: Icons.lock_outline,
                  color: red,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: StatCard(
                  title: 'المتاح',
                  value: '5',
                  icon: Icons.check_circle_outline,
                  color: gold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          const Text(
            'الأسئلة التجريبية',
            style: TextStyle(
              color: navy,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...List.generate(demoQuestions.length, (index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: green.withValues(alpha: 0.12),
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  demoQuestions[index].text,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: const Text('متاح - سؤال تجريبي'),
                trailing: const Icon(
                  Icons.check_circle,
                  color: green,
                ),
              ),
            );
          }),
          const SizedBox(height: 15),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'هذه لوحة عرض تجريبية فقط. '
                'إضافة المسابقات والأسئلة وتعديلها وحذفها، '
                'وتسجيل الأستاذ، وحفظ نتائج الطلاب، '
                'تحتاج إلى بناء قاعدة بيانات وربطها بالتطبيق.',
                style: TextStyle(height: 1.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 19,
          horizontal: 10,
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

// دليل التطبيق
class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final guides = [
      (
        'دليل الطالب',
        'افتح دخول الطالب، ثم اكتب اسمك ورمز المسابقة '
            'واضغط دخول المسابقة. اختر الإجابة المناسبة '
            'لكل سؤال، ثم انتقل إلى السؤال التالي حتى تظهر النتيجة.'
      ),
      (
        'دليل الأستاذ',
        'تحتوي النسخة الحالية على لوحة عرض تجريبية '
            'للأسئلة والإحصاءات. تسجيل الدخول الحقيقي '
            'وإدارة المسابقات والأسئلة سيحتاجان إلى قاعدة بيانات.'
      ),
      (
        'النتائج',
        'تعرض النسخة الحالية نتيجة الأسئلة التجريبية '
            'على الهاتف الذي أجاب عنها. لا تُحفظ النتائج '
            'في قاعدة بيانات مشتركة في هذا الإصدار.'
      ),
      (
        'الدعم الفني',
        'إذا واجهت مشكلة في استخدام التطبيق، افتح القائمة '
            'الجانبية ثم اختر خدمة العملاء للتواصل عبر واتساب '
            'أو البريد الإلكتروني.'
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('دليل التطبيق')),
      body: ListView(
        padding: const EdgeInsets.all(17),
        children: [
          const Icon(
            Icons.menu_book_rounded,
            size: 75,
            color: blue,
          ),
          const SizedBox(height: 12),
          const Text(
            'مرحبًا بك في دليل مسار التعليم',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: navy,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 18),
          ...guides.map(
            (guide) => Card(
              child: ExpansionTile(
                leading: const Icon(
                  Icons.help_outline_rounded,
                  color: blue,
                ),
                title: Text(
                  guide.$1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                childrenPadding: const EdgeInsets.all(16),
                children: [
                  Text(
                    guide.$2,
                    style: const TextStyle(height: 1.8),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// فتح روابط الدعم
Future<void> openSupportLink(
  BuildContext context,
  String value,
) async {
  final uri = Uri.parse(value);

  try {
    final opened = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تعذر فتح التطبيق المطلوب'),
        ),
      );
    }
  } catch (_) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تعذر فتح الرابط')),
      );
    }
  }
}

// خدمة العملاء
class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('خدمة العملاء')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 12),
          const Icon(
            Icons.support_agent_rounded,
            size: 85,
            color: blue,
          ),
          const SizedBox(height: 12),
          const Text(
            'كيف يمكننا مساعدتك؟',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: navy,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'اختر طريقة التواصل المناسبة لك.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE0F5E8),
                child: Icon(Icons.chat, color: green),
              ),
              title: const Text(
                'التواصل عبر واتساب',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('737074368 - اليمن'),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => openSupportLink(
                context,
                'https://wa.me/967737074368',
              ),
            ),
          ),
          Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: const CircleAvatar(
                backgroundColor: Color(0xFFE7EFFB),
                child: Icon(Icons.email_outlined, color: blue),
              ),
              title: const Text(
                'البريد الإلكتروني',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'eyad6377nasralshamiri@gmail.com',
              ),
              trailing: const Icon(Icons.open_in_new),
              onTap: () => openSupportLink(
                context,
                'mailto:eyad6377nasralshamiri@gmail.com'
                '?subject=الدعم الفني لتطبيق مسار التعليم',
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'يمكنك التواصل للإبلاغ عن مشكلة أو الاستفسار '
            'عن استخدام التطبيق.',
            textAlign: TextAlign.center,
            style: TextStyle(height: 1.8),
          ),
        ],
      ),
    );
  }
}

// حول التطبيق
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('حول التطبيق')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.school_rounded,
                    color: gold,
                    size: 85,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'مسار التعليم',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: navy,
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'طريقك نحو المعرفة والنجاح',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: blue,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Divider(),
                  const SizedBox(height: 15),
                  const Text('إعداد وتطوير'),
                  const SizedBox(height: 8),
                  const Text(
                    'إياد نصر الشميري',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: navy,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'تطبيق تعليمي يهدف إلى تسهيل إنشاء '
                    'المسابقات والاختبارات التفاعلية '
                    'ومساعدة الطلاب على التعلم والتقدم.',
                    textAlign: TextAlign.center,
                    style: TextStyle(height: 1.8),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'الإصدار التجريبي',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}