![Block User_Agent](./block_user_agent.webp)


# AgentShield

AgentShield هو سكربت مصمم للتحكم في الوصول إلى الخادم بناءً على "User Agents". بشكل افتراضي، يسمح السكربت بجميع حركة المرور، ولكن يمكنك حظر "User Agents" محددة عند الحاجة باستخدام Nginx.

## Installation / التثبيت

To install AgentShield, follow these steps:

لتثبيت AgentShield، اتبع الخطوات التالية:

1. **Clone the Repository / نسخ المستودع:**

   ```bash
   git clone https://github.com/RAKAN-ALYAMI/AgentShield.git
   ```

2. **Navigate to the Project Directory / انتقل إلى دليل المشروع:**

   ```bash
   cd AgentShield
   ```

3. **Make the Script Executable / اجعل السكربت قابلاً للتنفيذ:**

   ```bash
   chmod +x AgentShield.sh
   ```

4. **Run the Script / تشغيل السكربت:**

   ```bash
   ./AgentShield.sh
   ```

   - Ensure that Nginx is installed on your server. The script will check for Nginx and prompt you to install it if it is not found.

   - تأكد من أن Nginx مثبت على الخادم. سيتحقق السكربت من وجود Nginx وسيطالبك بتثبيته إذا لم يكن موجودًا.

## Usage / الاستخدام

Once the script is running, you'll have several options:

بمجرد تشغيل السكربت، سيكون لديك عدة خيارات:

1. **Allow all access (default) / السماح بجميع الزيارات (الإعداد الافتراضي):** 
   - This will remove any existing User Agent blocks and allow all traffic.
   - سيؤدي هذا إلى إزالة أي حظر حالي على "User Agents" والسماح بجميع الزيارات.

2. **Block access by User Agent / حظر الوصول بناءً على "User Agent":** 
   - Enter the User Agent you wish to block. The script will add the necessary rules to Nginx to block this specific User Agent.
   - أدخل "User Agent" الذي ترغب في حظره. سيقوم السكربت بإضافة القواعد اللازمة إلى Nginx لحظر "User Agent" المحدد.

3. **View blocked visits / عرض الزيارات المحظورة:** 
   - Displays the User Agents that have been blocked.
   - يعرض "User Agents" التي تم حظرها.

4. **Remove all blocks and firewall rules / إزالة جميع الحظر وقواعد الجدار الناري:** 
   - This option removes all blocks and resets the access to allow all traffic.
   - يزيل هذا الخيار جميع الحظر ويعيد السماح لجميع الزيارات.

5. **Exit / الخروج:** 
   - Exits the script.
   - ينهي تشغيل السكربت.

## Uninstallation / إزالة التثبيت

To completely remove AgentShield and its associated configurations:

لإزالة AgentShield بالكامل مع التكوينات المرتبطة به:

1. **Remove the Nginx Configuration / إزالة تكوين Nginx:**

   Run the script and select the option to "Remove all blocks and firewall rules" to clean up any modifications made by the script.

   قم بتشغيل السكربت واختر الخيار "إزالة جميع الحظر وقواعد الجدار الناري" لتنظيف أي تعديلات تم إجراؤها بواسطة السكربت.

2. **Delete the Script and Repository / حذف السكربت والمستودع:**

   ```bash
   rm -rf /path/to/AgentShield
   ```

3. **Optionally, you can also remove the log file / يمكنك أيضًا إزالة ملف السجل اختياريًا:**

   ```bash
   sudo rm -f /var/log/blocked_ips.log
   ```

## Contact / طرق التواصل

For any questions or support, you can reach out to:

لأي استفسارات أو دعم، يمكنك التواصل عبر:

- **Email / البريد الإلكتروني:** rakan7777@gmail.com
- **Telegram / تليجرام:** [r7000r](https://t.me/r7000r)

---

© 2024 RAKAN ALYAMI. All rights reserved.
