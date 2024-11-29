# Character Apps

A Swift workspace with apps that display characters and their details from the *Rick and Morty API* with status filtering capabilities.

I've explored various UI approaches to implement the task and aim to deliver a standout solution that outperforms the competition.

---

## The Apps

- **🚀 MixedUICharacterApp** (main app)
- **🖼 UIKitCharacterApp**
- **📱 SwiftUICharacterApp**

---

# Common Features

- **🧹 Super clean** code based on Design Patterns and SOLID Principles 
- Adapted **📐 OOP**, **🔄 POP**, and **📏 Inheritance** concepts
- **🔌 Decoupled** and **✅ Testable** Code
- Corporate Reactive Programming using **💥 Combine**
- Decoupled and Testable **🌐 Network Layer** based on **URLSession**
- Integrated **🔑 Higher-Order Functions** (e.g., `map`, `compactMap`)
- Implemented reusable functions through **🔧 extensions**
- No **🎩 magic** or **❌ hardcoded strings** in the code files
- Limited use of third-party libraries (**🖼 Kingfisher**, **📦 SnapKit**)

---

## Implementation Details

In this section, I will explain each app and its key features in depth.

---

### 🚀 **MixedUICharacterApp**

This app follows the submission guidelines and is primarily built with **SwiftUI**, while integrating **UICollectionView**.

#### Common Features
- Built using **🏗️ MVVM** Architecture
- A base **🔲 View** and **📦 ViewModel** are implemented
- Custom, reusable views like **🛠️ StatusView** and **🔲 RoundedStyle** are introduced
- **🎨 UICollectionView** was integrated using the `UIViewRepresentable` protocol
- The **🔒 API Service** was mocked in two different ways
- **🧪 Unit Tests** and **🔬 UI Test Cases** have been implemented
- The test coverage is above **85%** 🎯

#### Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/6829e1e9-49f6-4f2d-b78a-67c561dba8f7" width="200" style="margin-right: 10px;"/>
  <img src="https://github.com/user-attachments/assets/ac039478-c95c-4e3e-9b9f-2c1d09a0bd88" width="200" style="margin-right: 10px;"/>
  <img src="https://github.com/user-attachments/assets/d6a83f22-050a-4dda-8cd3-824541ecc12b" width="200" style="margin-right: 10px;"/>
  <img src="https://github.com/user-attachments/assets/8a4b6899-a851-4299-bc23-b0c441d2a70d" width="200"/>
</p>

---

### 🖼 **UIKitCharacterApp**

This app is developed entirely with **UIKit** to showcase proficiency in Swift and UIKit.

#### Common Features
- Developed using **🏗️ MVVM-C** Architecture
- **🎬 View Controllers** and custom views were built programmatically
- Navigation is handled using the **🧭 Coordinator** pattern
- **🛠️ Clean & Complex** views are created using **📐 Auto Layout** with no warnings
- A base **🔲 View** and **📦 ViewModel** are implemented
- Custom reusable views like **📊 UIFiltersView** and **📄 UIDetailsView** were introduced
- A few third-party libraries were used (**🖼 Kingfisher**, **📦 SnapKit**)

#### Screenshots
<p align="center">
  <img src="https://github.com/user-attachments/assets/95f74569-26be-42b2-8077-d501ce3ffbec" width="200" style="margin-right: 10px;"/>
  <img src="https://github.com/user-attachments/assets/5ba288b0-131e-4a85-9f86-7a1a00e66168" width="200" style="margin-right: 10px;"/>
  <img src="https://github.com/user-attachments/assets/f8552c4f-ddbf-44dc-a2fe-4637abbb2279" width="200" style="margin-right: 10px;"/>
  <img src="https://github.com/user-attachments/assets/25ac0852-2405-4632-9638-0dc77e457304" width="200"/>
</p>

#### Unit Tests Results

<p align="center">
  <img width="250" alt="Screenshot 2024-11-30 at 1 00 26 AM" src="https://github.com/user-attachments/assets/e0975b9c-7d5e-4290-9f83-dd8295ae1c87" style="margin-right: 10px;"/>
  <img width="250" alt="Screenshot 2024-11-30 at 12 59 46 AM" src="https://github.com/user-attachments/assets/bd2b0485-f202-4485-9f10-2e911a0ef3fe" style="margin-right: 10px;"/>
  <img width="250" alt="Screenshot 2024-11-30 at 12 59 57 AM" src="https://github.com/user-attachments/assets/e147e16c-091f-4722-96e5-802a016e9b54"/>
</p>

---

### 📱 **SwiftUICharacterApp**

This app is developed entirely with **SwiftUI** to demonstrate proficiency in Swift and SwiftUI.

#### Common Features
- Built using **🏗️ MVVM** Architecture
- Implemented a new **🎨 design** for the interface
- Introduced custom, reusable views like **📝 TinyInfoItemView**

#### Screenshots
<p align="center">
  <img src="https://github.com/user-attachments/assets/7bed0660-2bda-473c-b905-3370dee9c626" width="200" style="margin-right: 10px;"/>
  <img src="https://github.com/user-attachments/assets/5a38d372-1ca7-4e94-80f2-8c07088a9a1e" width="200" style="margin-right: 10px;"/>
  <img src="https://github.com/user-attachments/assets/4a5b78da-e7a0-4d50-8c6b-747bfbdf1a11" width="200" style="margin-right: 10px;"/>
  <img src="https://github.com/user-attachments/assets/5dac99e0-0488-40ea-8ffa-8bf58a452829" width="200"/>
</p>

---

## Prerequisites

- **💻 Xcode 15.4** (15F31d)
- **⚙️ Swift 5.9**
