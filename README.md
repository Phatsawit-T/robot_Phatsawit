# Automate Testing CI/CD

โปรเจค Automated Testing ที่รวม Web, API และ Mobile Testing พร้อม CI/CD Pipeline

## 🚀 CI/CD Pipelines

### 1. Jenkins Pipeline
ไฟล์: `CICD/Jenkinsfile`

**Features:**
- ✅ รัน Web, API, และ Mobile Tests แบบ Parallel
- ✅ รองรับ Windows Environment (ใช้ `bat` commands)
- ✅ สร้าง Consolidated Report จากผลทั้งหมด
- ✅ Email notification เมื่อ Pipeline เสร็จ
- ✅ Archive test results และ reports
- ✅ Parameters สำหรับควบคุมการรัน tests

**การใช้งาน:**
```groovy
// รัน Pipeline ด้วย Parameters
- RUN_MOBILE_TESTS: true/false
- TEST_SUITE: ALL/WEB/API/MOBILE
- TAGS: Smoke, P0, P1, etc.
```

**Requirements:**
- Jenkins plugins:
  - Robot Framework Plugin
  - Email Extension Plugin
  - Pipeline Plugin

### 2. GitHub Actions
ไฟล์: `.github/workflows/ci.yml`

**Features:**
- ✅ รัน Web Tests บน Ubuntu
- ✅ รัน API Tests บน Ubuntu
- ✅ รัน Mobile Tests (optional, ต้องเปิด Appium)
- ✅ สร้าง Consolidated Report
- ✅ Upload artifacts (results & reports)
- ✅ Test Summary ใน PR

**Triggers:**
- Push to `main` or `develop` branch
- Pull Request to `main` or `develop`
- Manual workflow dispatch

**การใช้งาน:**
1. Push code ไปยัง GitHub
2. Pipeline จะรันอัตโนมัติ
3. ดูผลใน Actions tab
4. Download artifacts จาก workflow run

## 📦 Dependencies

ไฟล์: `requirements.txt`

```txt
robotframework==7.0
robotframework-browser==18.0.0
robotframework-requests==0.9.7
robotframework-jsonlibrary==0.5
robotframework-appiumlibrary==2.0.0
requests==2.31.0
selenium==4.15.0
```

**ติดตั้ง:**
```bash
pip install -r requirements.txt
rfbrowser init  # สำหรับ Browser Library
```

## 🏗️ โครงสร้างโปรเจค

```
Automate_Testing/
├── .github/
│   └── workflows/
│       └── ci.yml                 # GitHub Actions Pipeline
├── CICD/
│   ├── Jenkinsfile               # Jenkins Pipeline
│   └── README.md                 # เอกสารนี้
├── src/
│   ├── scripts/
│   │   ├── api_testing.robot     # API Test Cases
│   │   ├── login_test_web.robot  # Web Test Cases
│   │   └── mobile_testing.robot  # Mobile Test Cases
│   └── resources/
│       ├── keywords/             # Reusable Keywords
│       └── variables/            # Test Data
├── data/
│   └── app-minimal.apk          # Mobile App for Testing
├── results/                      # Test Results (Generated)
│   ├── web/
│   ├── api/
│   ├── mobile/
│   └── consolidated/
├── requirements.txt              # Python Dependencies
└── init.resource                # Main Resource File
```

## 🎯 Test Suites

### Web Tests
- **File**: `src/scripts/login_test_web.robot`
- **Library**: Browser Library (Playwright)
- **Target**: https://the-internet.herokuapp.com

### API Tests
- **File**: `src/scripts/api_testing.robot`
- **Library**: RequestsLibrary, JSONLibrary
- **Target**: https://reqres.in/api

### Mobile Tests
- **File**: `src/scripts/mobile_testing.robot`
- **Library**: AppiumLibrary
- **App**: Minimal Todo (Android)
- **Requirements**: Appium Server, Android Emulator/Device

## 🔧 การตั้งค่า Jenkins

### 1. ติดตั้ง Plugins
```
Robot Framework Plugin
Email Extension Plugin
Pipeline Plugin
Git Plugin
```

### 2. สร้าง Pipeline Job
1. New Item → Pipeline
2. ตั้งชื่อ: `Automate_Testing_Pipeline`
3. เลือก: Pipeline script from SCM
4. SCM: Git
5. Repository URL: `https://github.com/rkirasun/Automated_Test_Rkira`
6. Script Path: `CICD/Jenkinsfile`

### 3. Configure Parameters
- RUN_MOBILE_TESTS (Boolean)
- TEST_SUITE (Choice)
- TAGS (String)

### 4. Email Notification
Configure SMTP server ใน Jenkins → Manage Jenkins → Configure System

## 📊 Test Reports

### Robot Framework Reports
- **log.html**: รายละเอียดการรัน test แต่ละขั้นตอน
- **report.html**: สรุปผลการทดสอบ
- **output.xml**: ข้อมูล test results (XML format)

### Consolidated Report
รวมผลจาก Web, API, และ Mobile tests เป็นรายงานเดียว

**สร้างด้วย:**
```bash
rebot --name "Automated Test Report" \
      --outputdir results/consolidated \
      --output output.xml \
      results/*/output.xml
```

## 🏃 การรัน Tests Local

### All Tests
```bash
robot --outputdir results src/scripts/
```

### Web Tests Only
```bash
robot --outputdir results/web src/scripts/login_test_web.robot
```

### API Tests Only
```bash
robot --outputdir results/api src/scripts/api_testing.robot
```

### Mobile Tests Only
```bash
# เริ่ม Appium Server ก่อน
appium --relaxed-security

# รัน tests
robot --outputdir results/mobile src/scripts/mobile_testing.robot
```

### Filter by Tags
```bash
robot --include Smoke --outputdir results src/scripts/
robot --include P0 --outputdir results src/scripts/
```

## 📝 Tags ที่ใช้

- **Smoke**: Smoke tests
- **P0**: Priority 0 (Critical)
- **P1**: Priority 1 (High)
- **P2**: Priority 2 (Medium)
- **P3**: Priority 3 (Low)
- **Functional**: Functional tests
- **Negative**: Negative tests
- **CRUD**: CRUD operations
- **Input_Validation**: Input validation tests
- **Sanity**: Sanity tests

## 🔐 Environment Variables

### env.cofig.yaml
```yaml
BROWSER:
  BASE_URL: https://the-internet.herokuapp.com

API:
  BASE_URL: https://reqres.in/api
  AUTH_KEY:
    x-api-key: reqres-free-v1

Mobile:
  REMOTE_URL: http://localhost:4723
  PLATFORMNAME: Android
  PLATFORMVERSION: "15"
  DEVICENAME: Android Emulator
  UDID: emulator-5554
  APPPACKAGE: com.avjindersinghsekhon.minimaltodo
  APPACTIVITY: com.example.avjindersinghsekhon.toodle.MainActivity
```

## 🐛 Troubleshooting

### Jenkins Issues

**Problem**: Pipeline ไม่รัน
- ตรวจสอบ: Git credentials
- ตรวจสอบ: Jenkinsfile syntax

**Problem**: Tests fail ใน Jenkins แต่ Local ผ่าน
- ตรวจสอบ: Environment variables
- ตรวจสอบ: Python version
- ตรวจสอบ: Dependencies installation

### GitHub Actions Issues

**Problem**: Workflow ไม่รัน
- ตรวจสอบ: Workflow file location (.github/workflows/)
- ตรวจสอบ: YAML syntax

**Problem**: Tests timeout
- เพิ่ม: timeout-minutes ใน workflow

## 📚 References

- [Robot Framework](https://robotframework.org/)
- [Jenkins Pipeline](https://www.jenkins.io/doc/book/pipeline/)
- [GitHub Actions](https://docs.github.com/en/actions)
- [Robot Framework Browser](https://robotframework-browser.org/)
- [Appium](https://appium.io/)

## 👨‍💻 Author

**Phatsawit Sattayabut**
- GitHub: [@rkirasun](https://github.com/rkirasun)
- Repository: [Automated_Test_Rkira](https://github.com/rkirasun/Automated_Test_Rkira)
