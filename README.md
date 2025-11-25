# Test Automation Assignment - Robot Framework Project

โปรเจค Test Automation ครบทุกข้อตามที่โจทย์กำหนด รวม Web, API, Mobile Testing และ CI/CD Pipeline

[![Robot Framework](https://img.shields.io/badge/Robot%20Framework-7.0-blue.svg)](https://robotframework.org/)
[![Python](https://img.shields.io/badge/Python-3.10-green.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## 📋 สารบัญ

- [ภาพรวมโปรเจค](#-ภาพรวมโปรเจค)
- [โครงสร้างโปรเจค](#-โครงสร้างโปรเจค)
- [รายละเอียดแต่ละข้อ](#-รายละเอียดแต่ละข้อ)
- [การติดตั้งและใช้งาน](#-การติดตั้งและใช้งาน)
- [Jenkins Pipeline Setup](#-jenkins-pipeline-setup)
- [Test Reports](#-test-reports)
- [Troubleshooting](#-troubleshooting)

---

## 🎯 ภาพรวมโปรเจค

โปรเจคนี้ทำตามโจทย์ **Test Automation Assignment** ทั้งหมด 6 ข้อ:

| ข้อ | โจทย์ | ไฟล์ | สถานะ |
|-----|-------|------|--------|
| **1** | Check duplicate items (Python) | [`check_dup_item.robot`](src/scripts/check_dup_item.robot) | ✅ |
| **2** | Web Login Testing (3 TCs) | [`login_test_web.robot`](src/scripts/login_test_web.robot) | ✅ |
| **3** | API Testing (2 TCs) | [`api_testing.robot`](src/scripts/api_testing.robot) | ✅ |
| **4** | Mobile Testing (Minimal Todo) | [`mobile_testing.robot`](src/scripts/mobile_testing.robot) | ✅ |
| **5** | Jenkins Pipeline | [`Jenkinsfile`](CICD/Jenkinsfile) | ✅ |
| **6** | Caesar Cipher Decrypt (Python) | [`couterclockwise_direction.robot`](src/scripts/couterclockwise_direction.robot) | ✅ |

---

## 🏗️ โครงสร้างโปรเจค

```
robot_Phatsawit/
├── 📄 README.md                                    # เอกสารโปรเจค
├── 📄 requirements.txt                             # Python dependencies
├── 📄 init.resource                                # Main resource file
├── 📄 env.config.yaml                              # Environment configuration
│
├── 📂 CICD/
│   └── 📄 Jenkinsfile                              # ✅ ข้อ 5: Jenkins Pipeline (5 stages)
│
├── 📂 src/
│   ├── 📂 scripts/                                 # Test Scripts
│   │   ├── 📄 check_dup_item.robot                 # ✅ ข้อ 1: Check duplicate items
│   │   ├── 📄 login_test_web.robot                 # ✅ ข้อ 2: Web login (3 TCs)
│   │   ├── 📄 api_testing.robot                    # ✅ ข้อ 3: API testing (2 TCs)
│   │   ├── 📄 mobile_testing.robot                 # ✅ ข้อ 4: Mobile testing (8 TCs)
│   │   └── 📄 couterclockwise_direction.robot      # ✅ ข้อ 6: Caesar cipher (3 TCs)
│   │
│   └── 📂 resources/
│       ├── 📄 specifics.resource                   # Custom keywords
│       ├── 📂 lib/
│       │   └── 📄 customlib.py                     # ✅ Python functions (duplicate, cipher)
│       ├── 📂 keywords/
│       │   ├── 📂 browser/
│       │   │   └── 📄 browser.keywords.resource    # Web testing keywords
│       │   ├── 📂 api/
│       │   │   └── 📄 api.keywords.resource        # API testing keywords
│       │   └── 📂 mobile/
│       │       └── 📄 mobile.keywords.resource     # Mobile testing keywords
│       └── 📂 variables/
│           └── 📄 common.yaml                       # Common test variables
│
├── 📂 data/
│   ├── 📄 api.data.yaml                            # API test data
│   └── 📄 app-minimal.apk                          # Minimal Todo APK (for mobile testing)
│
└── 📂 results/                                      # Test results (auto-generated)
    ├── web/
    ├── api/
    ├── mobile/
    └── consolidated/
```

---

## 📝 รายละเอียดแต่ละข้อ

### ข้อ 1: Check Duplicate Items from List A and List B

**ไฟล์:** [`src/scripts/check_dup_item.robot`](src/scripts/check_dup_item.robot)

**โจทย์:**
```
List A: [1, 2, 3, 5, 6, 8, 9]
List B: [3, 2, 1, 5, 6, 0]
```

**ผลลัพท์:** `[1, 2, 3, 5, 6]`

**วิธีรัน:**
```bash
robot src/scripts/check_dup_item.robot
```

---

### ข้อ 2: Web Login Testing

**ไฟล์:** [`src/scripts/login_test_web.robot`](src/scripts/login_test_web.robot)

**เว็บไซต์:** http://the-internet.herokuapp.com/login

**Test Cases (3 TCs):**
1. ✅ **Login Success** - Valid username and password
2. ✅ **Login Failed - Password Incorrect** - Wrong password
3. ✅ **Login Failed - Username Not Found** - Invalid username

**Credentials:**
- Username: `tomsmith`
- Password: `SuperSecretPassword!`

**วิธีรัน:**
```bash
robot src/scripts/login_test_web.robot
```

---

### ข้อ 3: API Testing (REST API)

**ไฟล์:** [`src/scripts/api_testing.robot`](src/scripts/api_testing.robot)

**API Endpoint:** https://reqres.in/api/users/{id}

**Test Cases (2 TCs):**
1. ✅ **Get User Profile Success** (ID: 12) → Status 200
   - Verify: ID, Email, First Name, Last Name, Avatar
2. ✅ **Get User Profile but user not found** (ID: 1234) → Status 404
   - Verify: Empty body `{}`

**วิธีรัน:**
```bash
robot src/scripts/api_testing.robot
```

---

### ข้อ 4: Mobile App Testing (Minimal Todo)

**ไฟล์:** [`src/scripts/mobile_testing.robot`](src/scripts/mobile_testing.robot)

**App:** [Minimal-Todo](https://github.com/avjinder/Minimal-Todo)

**Framework:** Robot Framework + Appium

**Test Cases (8 TCs):**
1. ✅ Verify App Launch Successfully
2. ✅ Add Single Todo Item
3. ✅ Add Multiple Todo Items
4. ✅ Delete Single Todo Item
5. ✅ Add Todo With Special Characters
6. ✅ Add Todo With Unicode Characters
7. ✅ Add Todo With Empty Text (Negative)
8. ✅ Add Duplicate Todo Items

**Pre-requisites:**
```bash
# เริ่ม Appium Server
appium --relaxed-security

# เปิด Android Emulator
emulator -avd <your_avd_name>

# ตรวจสอบ device
adb devices
```

**วิธีรัน:**
```bash
robot src/scripts/mobile_testing.robot
```

---

### ข้อ 5: Jenkins Pipeline

**ไฟล์:** [`CICD/Jenkinsfile`](CICD/Jenkinsfile)

**Pipeline Stages (5 stages):**
1. ✅ **Checkout Code From Git** - Clone repository from GitHub
2. ✅ **Install Dependencies** - Install Python packages and libraries
3. ✅ **Run Tests in Parallel** - Execute Web, API, Mobile tests concurrently
4. ✅ **Publish Test Results** - Archive and publish Robot Framework reports
5. ✅ **Generate Test Report** - Create consolidated report

**Parameters:**
- `RUN_MOBILE_TESTS` (Boolean): Enable/disable mobile tests
- `TEST_SUITE` (Choice): ALL/WEB/API/MOBILE
- `TAGS` (String): Filter by tags (e.g., Smoke, P0)

**Setup Guide:** [ดูรายละเอียด](#-jenkins-pipeline-setup)

---

### ข้อ 6: Caesar Cipher Decryption

**ไฟล์:** [`src/scripts/couterclockwise_direction.robot`](src/scripts/couterclockwise_direction.robot)

**Python Function:** [`src/resources/lib/customlib.py`](src/resources/lib/customlib.py)

**โจทย์:**
```python
encrypted = 'VTAOG'
k = 2
# Result: 'TRYME'
```

**Test Cases (3 TCs):**
1. ✅ Example Case: `VTAOG` → `TRYME` (k=2)
2. ✅ Different Shift: `DEF` → `ABC` (k=3)
3. ✅ Wrap Around: `ABC` → `VWX` (k=5)

**วิธีรัน:**
```bash
robot src/scripts/couterclockwise_direction.robot
```

---

## 🚀 การติดตั้งและใช้งาน

### 1. Clone Repository

```bash
git clone https://github.com/Phatsawit-T/robot_Phatsawit.git
cd robot_Phatsawit
```

### 2. ติดตั้ง Dependencies

```bash
# ติดตั้ง Python packages
pip install -r requirements.txt

# ติดตั้ง Browser Library (สำหรับ Web Testing)
rfbrowser init
```

### 3. ตรวจสอบ Environment

```bash
# Python version
python --version  # ควรเป็น 3.10+

# Robot Framework version
robot --version

# ตรวจสอบ libraries
python -m robot.libdoc Browser list
python -m robot.libdoc RequestsLibrary list
```

### 4. รัน Tests

**รันทีละไฟล์:**
```bash
# ข้อ 1: Check duplicate
robot src/scripts/check_dup_item.robot

# ข้อ 2: Web login
robot src/scripts/login_test_web.robot

# ข้อ 3: API testing
robot src/scripts/api_testing.robot

# ข้อ 4: Mobile testing (ต้องเปิด Appium ก่อน)
robot src/scripts/mobile_testing.robot

# ข้อ 6: Caesar cipher
robot src/scripts/couterclockwise_direction.robot
```

**รันทั้งหมด:**
```bash
robot --outputdir results src/scripts/
```

**รันด้วย Tags:**
```bash
robot --include p0 --outputdir results src/scripts/
robot --include assignment_q2 --outputdir results src/scripts/
```

---

## 🔧 Jenkins Pipeline Setup

### ขั้นตอนที่ 1: ติดตั้ง Jenkins Plugins

1. เข้า **Manage Jenkins** → **Plugins**
2. ติดตั้ง Plugins:
   - ✅ Pipeline
   - ✅ Git
   - ✅ Robot Framework Plugin

### ขั้นตอนที่ 2: สร้าง Pipeline Job

1. **New Item** → ตั้งชื่อ: `Robot_Framework_Tests`
2. เลือก: **Pipeline**
3. คลิก **OK**

### ขั้นตอนที่ 3: Configure Pipeline

**ส่วน Pipeline:**
- **Definition**: `Pipeline script from SCM`
- **SCM**: `Git`
- **Repository URL**: `https://github.com/Phatsawit-T/robot_Phatsawit.git`
- **Branch**: `*/main`
- **Script Path**: `CICD/Jenkinsfile`

**ส่วน Parameters:**
1. **Boolean Parameter**: `RUN_MOBILE_TESTS` (default: `false`)
2. **Choice Parameter**: `TEST_SUITE` (choices: `ALL`, `WEB`, `API`, `MOBILE`)
3. **String Parameter**: `TAGS` (default: `''`)

### ขั้นตอนที่ 4: รัน Pipeline

1. คลิก **Build with Parameters**
2. เลือก Parameters:
   - `RUN_MOBILE_TESTS`: `false` (ถ้าไม่มี Appium)
   - `TEST_SUITE`: `ALL`
   - `TAGS`: เว้นว่าง
3. คลิก **Build**

### ขั้นตอนที่ 5: ดูผลลัพท์

- **Console Output**: ดู log แบบ real-time
- **Robot Results**: ดู test report และ statistics
- **Artifacts**: ดาวน์โหลด `report.html`, `log.html`

---

## 📊 Test Reports

### Robot Framework Reports

หลังจากรัน tests เสร็จ จะได้ไฟล์:

1. **report.html** - สรุปผลการทดสอบ
2. **log.html** - รายละเอียดแต่ละ test step
3. **output.xml** - ข้อมูล test results (XML format)

### Consolidated Report

รวมผลจากหลาย test suites:

```bash
rebot --name "Automated Test Report" \
      --outputdir results/consolidated \
      --output output.xml \
      --log log.html \
      --report report.html \
      results/web/output.xml \
      results/api/output.xml
```

---

## 📦 Dependencies

ไฟล์: [`requirements.txt`](requirements.txt)

```
robotframework==7.0
robotframework-browser==18.0.0
robotframework-requests==0.9.7
robotframework-jsonlibrary==0.5
robotframework-appiumlibrary==2.0.0
requests==2.31.0
selenium==4.15.0
```

---

## 🏷️ Tags

| Tag | Description |
|-----|-------------|
| `assignment_q1` | ข้อ 1: Check duplicate |
| `assignment_q2` | ข้อ 2: Web login |
| `assignment_q3` | ข้อ 3: API testing |
| `assignment_q4` | ข้อ 4: Mobile testing |
| `p0` | Priority 0 (Critical) |
| `p1` | Priority 1 (High) |
| `p2` | Priority 2 (Medium) |
| `smoke` | Smoke tests |
| `positive` | Positive test cases |
| `negative` | Negative test cases |

---

## 🐛 Troubleshooting

### ปัญหา: Git SSL Error ใน Jenkins

```bash
# วิธีแก้ (Run as Administrator)
git config --system --unset http.sslBackend
git config --global http.sslBackend schannel

# Restart Jenkins
net stop jenkins
net start jenkins
```

### ปัญหา: Robot command not found

```bash
# ใช้ python -m robot แทน
python -m robot --version
python -m robot src/scripts/login_test_web.robot
```

### ปัญหา: Browser Library ไม่ทำงาน

```bash
# ติดตั้งใหม่
pip install --upgrade robotframework-browser
rfbrowser init
```

### ปัญหา: Appium connection refused

```bash
# ตรวจสอบ Appium Server
appium --version
appium --relaxed-security

# ตรวจสอบ device
adb devices
adb shell dumpsys window | findstr mCurrentFocus
```

---

## 📚 References

- [Robot Framework Documentation](https://robotframework.org/)
- [Browser Library](https://robotframework-browser.org/)
- [RequestsLibrary](https://github.com/MarketSquare/robotframework-requests)
- [AppiumLibrary](https://github.com/serhatbolsu/robotframework-appiumlibrary)
- [Jenkins Pipeline](https://www.jenkins.io/doc/book/pipeline/)

---

## 👨‍💻 Author

**Phatsawit Sattayabut**

- GitHub: [@Phatsawit-T](https://github.com/Phatsawit-T)
- Repository: [robot_Phatsawit](https://github.com/Phatsawit-T/robot_Phatsawit)

---

## 📄 License

MIT License

---

**พร้อมส่งงานแล้ว!** 🚀 ครบทุกข้อตามโจทย์ Test Automation Assignment

## 🚀 CI/CD Pipelines

### 1. Jenkins Pipeline
ไฟล์: `CICD/Jenkinsfile`

**Features:**
- ✅ รัน Web, API, และ Mobile Tests แบบ Parallel
- ✅ รองรับ Windows Environment (ใช้ `bat` commands)
- ✅ สร้าง Consolidated Report จากผลทั้งหมด
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
