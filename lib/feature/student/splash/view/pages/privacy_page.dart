import 'package:aviatoruz/feature/student/home/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final privacyAcceptedProvider = StateProvider<bool>((ref) => false);

class PrivacyPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();
    final privacyAccepted = ref.watch(privacyAcceptedProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Privacy Policy',
          )),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                PrivacyContent(language: 'UZ'),
                PrivacyContent(language: 'RU'),
                PrivacyContent(language: 'EN'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: privacyAccepted,
                onChanged: (value) {
                  ref.read(privacyAcceptedProvider.notifier).state =
                      value ?? false;
                },
              ),
              Text('I accept the privacy policy'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 58,
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: privacyAccepted
                    ? () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('privacyAccepted', true);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (_) => false);
                      }
                    : null,
                child: Text(
                  'Continue',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class PrivacyContent extends StatelessWidget {
  final String language;
  const PrivacyContent({required this.language});

  @override
  Widget build(BuildContext context) {
    String content = '';
    if (language == 'UZ') {
      content =
          "Maxfiylik siyosati\n\nUshbu maxfiylik siyosati 'Aeronavigatsiya' ilovasi (keyingi o'rinlarda 'Tizim') foydalanuvchi ma'lumotlarini to'plash, foydalanish va himoya qilish tartiblarini tavsiflaydi. Biz foydalanuvchining shaxsiy maʼlumotlarini himoya qilishga va ulardan foydalanishda shaffoflikka intilamiz. Tizimdan foydalanish orqali siz ushbu siyosat shartlariga rozilik bildirasiz.\n\n 'Aeronavigatisiya' jamoasi biz sizning maxfiyligingizni qadrlaymiz va shaxsiy ma'lumotlaringizni himoya qilishga intilamiz. Ushbu Maxfiylik siyosati maʼlumotlaringizni qanday toʻplashimiz, foydalanishimiz, himoya qilishimiz va almashishimiz, har bir qadamda shaffoflikni taʼminlab beradi.\n\nTo'plangan ma'lumotlar Biz foydalanuvchilardan quyidagi ma'lumotlarni yig'amiz:\n1. Ism va familiya – foydalanuvchilarni aniqlash uchun.\n2. Telefon raqami - foydalanuvchilar bilan muloqot qilish va tizimga kirishni ta'minlash.\n3. Ta'lim markazi uchun to'lovlar - foydalanuvchi to'lovlari va moliyaviy operatsiyalarni qayd etish.\n4. O'quv guruhi va dars jadvali - dars davomatini kuzatish uchun.\n5. So'rovlar – foydalanuvchilarning so'rovlardagi ishtirokini tahlil qilish.\n\nBiz cookie-fayllardan foydalanuvchi tajribasini yaxshilash, foydalanish namunalarini kuzatish va tizim ish faoliyatini optimallashtirish uchun foydalanamiz. Brauzer sozlamalari orqali cookie parametrlarini boshqarishingiz mumkin.\n\nMa'lumotlardan foydalanish\nBiz foydalanuvchi ma'lumotlaridan quyidagi maqsadlarda foydalanamiz: Foydalanuvchilar bilan samarali muloqotni osonlashtirish; O'quv jarayonini boshqarish va nazorat qilish; Foydalanuvchi to'lovlari va moliyaviy holatini boshqarish; Davomatni kuzatish va hisobotlarni tayyorlash; Foydalanuvchilarning so'rovlardagi ishtirokini tahlil qilish.\n\nMaxsus ma'lumotlardan foydalanish\n\nTelefon raqami - SMS-xabarnomalar va dars jadvallari yoki tizim o'zgarishlari bilan bog'liq shoshilinch yangilanishlar uchun ishlatiladi.\n\nMa'lumotlar xavfsizligi\n\nBiz foydalanuvchi ma'lumotlarini himoya qilish uchun barcha zarur texnik va tashkiliy choralarni ko'ramiz. Ma'lumotlar bizning serverlarimizda xavfsiz saqlanadi va har hafta zaxira nusxalari olinadi.\n\nQonuniy muvofiqlik\n\nBiz maʼlumotlaringiz maxfiylikni himoya qilishning eng yuqori standartlariga muvofiq boshqarilishini taʼminlab, quyidagi qonunlarga rioya qilamiz: 'Shaxsiy ma'lumotlar to'g'risida'gi qonun (No ZRU-547, 2020-yil 2-iyul), 'Axborot erkinligi to'g'risida'gi qonun (No ZRU-364, 2003-yil 12-dekabr), 'Elektron tijorat to'g'risida'gi qonun (No ZRU-328, 2015-yil 29-aprel), 'Axborot xavfsizligi to'g'risida'gi qonun (No ZRU-440, 2019-yil 15-oktabr).\n\nMa'lumotlarni saqlash muddati\n\nFoydalanuvchi ma'lumotlari bizning tizimimizda o'quv jarayoni uchun zarur bo'lgan vaqt davomida saqlanadi. Ma'lumotlar, agar qonun hujjatlarida boshqacha tartib nazarda tutilgan bo'lmasa, o'quv jarayoni tugaganidan keyin ko'pi bilan 5 yil davomida saqlanadi.\n\nMa'lumotlarni buzish tartiblari\n\nMa'lumotlar buzilgan taqdirda, biz zararlangan foydalanuvchilarni buzilish aniqlangandan keyin 72 soat ichida xabardor qilamiz, hodisaning mohiyatini va kelajakdagi buzilishlardan himoya qilish uchun barcha choralarni ko'rsatamiz.\n\nUchinchi shaxslar bilan ma'lumotlarni almashish\n\nBiz foydalanuvchi maʼlumotlarini uchinchi shaxslar bilan baham koʻrmaymiz, qonun talab qilgan hollar bundan mustasno, masalan, davlat organlari yoki sudlarning soʻrovlari. Maʼlumotlarimizni xavfsiz joylashtirish uchun ishonchli uchinchi tomon xizmat koʻrsatuvchi provayderlardan foydalanamiz. Ushbu uchinchi tomonlar qat'iy maxfiylik shartnomalari bilan bog'langan va ma'lumotlaringizdan kelishilganidan boshqa maqsadlarda foydalanmaydi.\n\nFoydalanuvchi huquqlari\n\nFoydalanuvchilar quyidagi huquqlarga ega: Ularning ma'lumotlariga kirish va yangilash; Ularning ma'lumotlarini o'chirish yoki ulardan foydalanishni cheklash; Bizga [aloqa maʼlumotlari] orqali murojaat qilish orqali ularning maʼlumotlariga kirish, tuzatish yoki oʻchirishni soʻrash uchun. Maʼlumotlarni himoya qilish boʻyicha amaldagi qonunlarga muvofiq barcha soʻrovlarga 30 kun ichida javob beramiz.\n\nMaxfiylik siyosatiga kiritilgan o'zgartirishlar\n\nBiz vaqti-vaqti bilan ushbu maxfiylik siyosatini yangilashimiz mumkin. Agar biz ushbu siyosatga biron bir muhim o'zgartirish kiritsak, biz sizni SMS orqali xabardor qilamiz va yangi shartlarni ko'rib chiqish uchun 30 kun vaqt beramiz. Agar rozi bo'lmasangiz, tizimdan foydalanishni to'xtatishingiz va ma'lumotlarni o'chirishni so'rashingiz mumkin.\n\nBog'lanish uchun ma'lumot\n\nMaxfiyligingiz bilan bog'liq har qanday tashvish yoki savollaringiz bo'lsa yoki huquqlaringizni amalga oshirishni istasangiz, iltimos biz bilan bog'laning:\nElektron pochta:  asdibroxim@gmail.com\nTelefon: 90 021 21 64";
    } else if (language == 'RU') {
      content =
          "Политика конфиденциальности\n\nВ настоящей политике конфиденциальности описывается, Aeronavigatsiya (далее «Система») собирает, использует и защищает данные пользователей. Мы стремимся защищать вашу личную информацию и быть прозрачными в отношении того, как мы ее используем. Используя систему, вы соглашаетесь с условиями данной политики. В Aeronavigatsiya  мы ценим вашу конфиденциальность и стремимся защищать вашу личную информацию. Настоящая Политика конфиденциальности обеспечивает прозрачность того, как мы собираем, используем, защищаем и передаем вашу информацию на каждом этапе пути.\n\nСобранные данные\n\nМы собираем следующую информацию от пользователей:\n1. Имя и фамилия – для идентификации пользователей.\n2. Номер телефона – для связи с пользователями и предоставления доступа к системе.\n3. Платежи за Учебный центр – учет пользовательских сборов и финансовых транзакций.\n4. Расписание учебных групп и занятий – для контроля посещаемости занятий.\n5. Опросы – анализ участия пользователей в опросах. Мы используем файлы cookie для улучшения пользовательского опыта, отслеживания моделей использования и оптимизации производительности системы. Вы можете управлять настройками файлов cookie через настройки вашего браузера.\n\nИспользование информации\n\nМы используем пользовательские данные для следующих целей: Содействие эффективному общению с пользователями; Управление и контроль учебного процесса; Управление комиссиями пользователей и финансовым состоянием; Контроль посещаемости и подготовка отчетов; Анализ участия пользователей в опросах.\n\nИспользование личной информации\n\nНомер телефона — используется для SMS-уведомлений и срочных обновлений о расписании занятий или изменениях в системе.\n\nБезопасность данных\n\nМы принимаем все необходимые технические и организационные меры для защиты данных пользователей. Данные надежно хранятся на наших серверах и еженедельно резервируются.\n\nСоблюдение законодательства\n\nМы соблюдаем следующие законы, гарантируя, что ваша информация будет управляться в соответствии с самыми высокими стандартами защиты конфиденциальности: Закон «О персональных данных» (№ ЗРУ-547 от 2 июля 2020 г.), Закон «О свободе информации» (№ ЗРУ-364 от 12 декабря 2003 г.), Закон «Об электронной коммерции» (№ ЗРУ-328 от 29 апреля 2015 г.), Закон «Об информационной безопасности» (№ ЗРУ-440 от 15 октября 2019 г.).\n\nСрок хранения данных\n\nДанные пользователя хранятся в нашей системе столько времени, сколько необходимо для процесса обучения. Данные хранятся максимум 5 лет после окончания образовательного процесса, если иное не установлено законом.\n\nПроцедуры утечки данных\n\nВ случае утечки данных мы уведомим пострадавших пользователей в течение 72 часов с момента обнаружения утечки, подробно описав характер инцидента и все меры по защите от будущих нарушений.\n\nПередача информации третьим лицам\n\nМы не передаем информацию о пользователях третьим лицам, за исключением случаев, предусмотренных законом, например, запросов государственных органов или судов. Мы используем проверенных сторонних поставщиков услуг для безопасного хранения наших данных. Эти третьи стороны связаны строгими соглашениями о конфиденциальности и не будут использовать вашу информацию для целей, отличных от согласованных.\n\nПрава пользователя\n\nПользователи имеют следующие права: Доступ и обновление своей информации; Удалить свои данные или ограничить их использование. Чтобы запросить доступ, исправление или удаление своих данных, свяжитесь с нами по адресу [контактные данные]. Мы ответим на все запросы в течение 30 дней в соответствии с применимыми законами о защите данных.\n\nИзменения в Политике конфиденциальности\n\nМы можем время от времени обновлять данную политику конфиденциальности. Если мы внесем какие-либо существенные изменения в эту политику, мы уведомим вас по SMS и дадим вам 30 дней на ознакомление с новыми условиями. Если вы не согласны, вы можете прекратить использование системы и запросить удаление данных.\n\nКонтактная информация\n\nЕсли у вас есть какие-либо опасения или вопросы относительно вашей конфиденциальности или вы хотите реализовать свои права, свяжитесь с нами:\n\nЭлектронная почта: asibroxim@gmail.com\nТелефон: +998 90 021 21 64";
    } else {
      content =
          "Privacy Policy\n\nThis privacy policy describes how Aeronavigatsiya's  collects, uses, and protects user data. We are committed to safeguarding your personal information and being transparent about how we use it. By using the system, you agree to the terms of this policy. At Aeronavigatsiya CRM, we value your privacy and strive to protect your personal information. This Privacy Policy ensures transparency regarding how we collect, use, protect, and share your information at every step of the way.\n\nCollected Data\n\nWe collect the following information from users:\n1. First and last name – for user identification.\n2. Phone number – for contacting users and providing system access.\n3. Payments for the Training Center – to track user fees and financial transactions.\n4. Schedule of study groups and classes – to monitor class attendance.\n5. Surveys – to analyze user participation in surveys. We use cookies to enhance user experience, track usage patterns, and optimize system performance. You can manage cookie settings through your browser preferences.\n\nUse of Information\n\nWe use user data for the following purposes: Facilitating effective communication with users; Managing and overseeing the educational process; Managing user fees and financial status; Monitoring attendance and preparing reports; Analyzing user participation in surveys.\n\nUse of Personal Information\n\nPhone number – used for SMS notifications and urgent updates regarding class schedules or system changes.\n\nData Security\n\nWe take all necessary technical and organizational measures to protect user data. Data is securely stored on our servers and backed up weekly.\n\nLegal Compliance\n\nWe comply with the following laws to ensure your information is handled to the highest privacy standards: Law 'On Personal Data' (No. ZRU-547 dated July 2, 2020), Law 'On Freedom of Information' (No. ZRU-364 dated December 12, 2003), Law 'On Electronic Commerce' (No. ZRU-328 dated April 29, 2015), Law 'On Information Security' (No. ZRU-440 dated October 15, 2019).\n\nData Retention Period\n\nUser data is stored in our system for as long as necessary for the educational process. Data is retained for a maximum of 5 years after the completion of the educational process, unless otherwise required by law.\n\nData Breach Procedures\n\nIn the event of a data breach, we will notify affected users within 72 hours of discovering the breach, providing details of the incident and all measures to prevent future violations.\n\nSharing Information with Third Parties\n\nWe do not share user information with third parties, except as required by law, such as requests from government authorities or courts. We use trusted third-party service providers for secure data storage. These third parties are bound by strict confidentiality agreements and will not use your information for purposes other than those agreed upon.\n\nUser Rights\n\nUsers have the following rights: Access and update their information; Delete their data or restrict its use. To request access, correction, or deletion of your data, contact us at [contact details]. We will respond to all requests within 30 days in accordance with applicable data protection laws.\n\nChanges to the Privacy Policy\n\nWe may update this privacy policy from time to time. If we make any significant changes to this policy, we will notify you via SMS and give you 30 days to review the new terms. If you disagree, you may stop using the system and request data deletion.\n\nContact Information\n\nIf you have any concerns or questions regarding your privacy or wish to exercise your rights, contact us:\n\nEmail: asibroxim@gmail.com\nPhone: +998 90 021 21 64";
    }
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Text(content, style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
