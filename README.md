# Flutter Clean Architecture Project

এই প্রোজেক্টটি Flutter Clean Architecture শেখার জন্য তৈরি করা হয়েছে।  
একই প্রোজেক্টে তিনটি branch আছে, যাতে শেখা যায় **different state management approaches**:

- `main` → Flutter built-in state management (`setState`)
- `dev_getx` → GetX state management
- `dev_riverpod` → flutter_Riverpod state management

প্রোজেক্টের main goal:
> **UI থেকে শুরু করে data layer পর্যন্ত clean architecture flow বোঝা।**

---
* UI তে user login করে
* Controller → UseCase → Repository → RemoteDataSource
* RemoteDataSource → fake API response (UserModel)
* Repository → UserModel → UserEntity
* UseCase → Controller → UI
* UI → user.name দেখায়
---

## 📂 Project Structure

lib/
└─core
└─ features/
   └─login/
      ├─ data/
      │ ├─ datasources/ ← API / Fake data / DB
      │ │ └─ login_remote_datasource.dart
      │ ├─ models/ ← API response models
      │ └─ repositories/ ← Repository Implementation
      │ └─ login_repository_impl.dart
      ├─ domain/
      │ ├─ entity/ ← Business layer models
      │ │ └─ user_entity.dart
      │ ├─ repositories/ ← Abstract repository (no body)
      │ └─ usecases/ ← Business logic / rules
      │ └─ login_usecase.dart
      └─ presentation/
      ├─ controller/ ← Controller / StateNotifier / GetX Controller
      │ └─ login_controller.dart
      ├─ ui/ ← Flutter widgets / pages
      │ └─ login_page.dart
      └─ providers/ ← Riverpod providers (if using Riverpod)
      └─ login_providers.dart


---

## 🔹 Project Flow (Clean Architecture)

1. **UI → Button Press**
  - User UI থেকে login button press করে

2. **Controller.login()**
  - UI শুধু Controller call করে
  - Controller জানে “login করতে হলে UseCase call করতে হবে”
  - UI কখনো Repository বা DataSource directly call করে না

3. **UseCase**
  - Controller → UseCase
  - UseCase business rule রাখে
  - Example: “repository ব্যবহার করে login করো”
  - Controller কে data return করে, DataSource/ API detail hide থাকে

4. **Repository (LoginRepository / Impl)**
  - UseCase → Repository
  - Repository decide করে data কোথা থেকে আসবে (remote / local / cache / DB)
  - Fake API ব্যবহার করা হয়েছে, পরে real API replace করা যাবে কোনো UI / UseCase change ছাড়া

5. **RemoteDataSource**
  - Repository → RemoteDataSource
  - Data fetch করে, `UserModel` আকারে return করে

6. **Model vs Entity**
  - **UserEntity** → Domain layer / Business layer
  - **UserModel** → Data layer / API conversion
  - Repository ensure করে, UI বা UseCase কখনো Model দেখবে না

7. **Flow Diagram**


UI → Controller.login() → UseCase → Repository → RemoteDataSource → UserModel → Repository → UserEntity → UseCase → Controller → UI

---

## 📌 Branch-wise Explanation

| Branch | State Management | Key Features |
|--------|-----------------|-------------|
| `main` | Flutter built-in | Manual controller, `setState`, simplest, beginner-friendly |
| `dev_getx` | GetX | Controller + Obx + Binding + reactive UI |
| `dev_riverpod` | Riverpod | StateNotifier + Provider tree + ConsumerWidget + reactive UI |

**Usage for beginners:**

1. প্রথমে `main` branch থেকে Clean Architecture concept শেখো
2. পরে `dev_getx` branch → reactive state management শেখো
3. শেষে `dev_riverpod` branch → Provider tree + immutable state management শেখো

---

## 🔹 Why This Approach is Best

1. **Concept first, tool second**
  - Clean Architecture flow same → concept বোঝা সহজ
  - Different branch → tool-specific learning

2. **Easy comparison**
  - Main vs GetX vs Riverpod → প্রতিটি advantage / difference দেখা যায়

3. **Scalable & Maintainable**
  - Large project / modular app → নতুন state management branch সহজ add করা যায়

4. **Portfolio ready**
  - এক project → multiple state management skills দেখাতে পারো

---

## 💡 How to Run

1. Clone the repo:

```bash
git clone <repo-url>
cd flutter_clean_architect
```
2. Switch to branch:
# For built-in state
git checkout main

# For GetX
git checkout dev_getx

# For Riverpod
git checkout dev_riverpod
flutter pub get
